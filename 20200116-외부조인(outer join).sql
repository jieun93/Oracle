2020-01-16-01)외부조인(outer join)
- 내부조인(inner join, equi-join)에서는 조인조건을 만족하지 않는 데이터는
 검색에서 제외
- 외부조인에서는 모자라는 테이블에  null 행을 삽입하여 모든 행이 검색되도록 조회하는 방법
- 데이터의 갯수(행의 수)가 아니라 종류가 기준
(사용형식-일반 outer join)
. 조인조건에서 부족한 쪽의 컬럼명 뒤에 '(+)'연산자를 추가
 select 컬럼명 list
  from 테이블list
  where 컬럼명= 컬럼명(+)...

(사용형식-ANSI outer join)
  select 컬럼명 list
    from 테이블명1
    left|right|full [outer] join 테이블명2 on (조인조건 [
    and 일반조건...]
           :
    [where 일반조건]



(주의사항)
.3개 이상의 테이블이 사용되는 경우 모두 외부조인할 경우 모든 조인조건에'(+)' 연산자를 기술 해야함
.한번에 한 테이블에 대해서만 외부조인을 할 수가 있음. 즉 A,B,C 테이블을 대상으로 외부조인을 
수행하는 경우 A를 기준으로 B테이블을 외부조인으로 연결했다면 C를 기준으로 B테이블에 외부조인을 
수행할 수 없다.
.'(+)' 연산자가 붙은 조건과 다음 조건을 OR  연산자로 결합시킬수 없다.
.'(+)' 연산자는 IN연산자와 같이 사용할 수 없다.
.일반 외부조인 조건과 일반조건이 동시에 적용되면 외부조인은 수행되지 않음
 (내부 조인결과가 반환됨- 해결방법으로 subquery나 ANSI outer join 을 사용해야 함)


예) 상품테이블과 분류테이블을 이용하여 전체 분류별 상품의 수를 조회하시오.
    Alias는 분류코드,분류명, 상품의 수이다.
    
    
    select count (*) from lprod;

    select count(distinct prod_lgu) from prod;


(내부조인)
select b.prod_lgu as 분류코드,
       a.lprod_nm as 분류명,
       count(*) as 상품의수
     from lprod a ,prod b
    where a.lprod_gu=b.prod_lgu
    group by b.prod_lgu, a.lprod_nm;


(외부조인)
select a.lprod_gu as 분류코드,
       a.lprod_nm as 분류명,
       count(prod_id) as 상품의수
     from lprod a ,prod b 
    where a.lprod_gu=b.prod_lgu(+)
    group by a.lprod_gu, a.lprod_nm
    order by 1;

--count 조인을 사용 할때는 컬럼명을 기술해줘야 한다.
--*를 사용할수 없다.
(ansi 형식)
select a.lprod_gu as 분류코드,
       a.lprod_nm as 분류명,
       count(prod_id) as 상품의수
     from lprod a 
    left outer join prod b on(a.lprod_gu=b.prod_lgu)
    group by a.lprod_gu, a.lprod_nm
    order by 1;

예) 2005년 6월 매출정보를 조회하되 모든 상품별 매출정보 조회
Alias 상품명, 판매수량, 판매금액

(내부조인)
select a.prod_name as 상품명,
      sum(b.cart_qty) as 판매수량,
      sum(b.cart_qty*a.prod_price) as 판매금액 
from prod a, cart b
where b.cart_prod=a.prod_id
 and b.cart_no like'200506%'
group by a.prod_name;
 
(외부조인)
select a.prod_name as 상품명,
      sum(b.cart_qty) as 판매수량,
      sum(b.cart_qty*a.prod_price) as 판매금액 
from prod a, cart b
where b.cart_prod(+)=a.prod_id
and b.cart_no(+) like'200506%'
group by a.prod_name
order by 1;

(ansi 형식)
select a.prod_name as 상품명,
      nvl(sum(b.cart_qty),0) as 판매수량,
      nvl(sum(b.cart_qty*a.prod_price),0) as 판매금액 
from cart b
right outer join prod a on(b.cart_prod=a.prod_id--조인조건
 and b.cart_no like'200506%')
group by a.prod_name;


예) 2005년 6월 매입정보를 조회하되 모든 상품별 매입정보 조회
Alias 상품명, 매입수량, 구매금액
--buyprod
(내부조인)
select b.prod_name as  상품명,
      sum(a.buy_qty) as 매입수량,
      sum(a.buy_qty*a.buy_cost) as 구매금액
from buyprod a, prod b
where a.buy_prod = b.prod_id
and a.buy_date between '20050601' and '20050630'
group by b.prod_name;

(외부조인)

select b.prod_name as  상품명,
      sum(a.buy_qty)as 매입수량,
      sum(a.buy_qty*a.buy_cost) as 구매금액
from buyprod a, prod b
where a.buy_prod(+) = b.prod_id
and a.buy_date(+) between '20050601' and '20050630'
group by b.prod_name;


(ansi 형식)
select b.prod_name as  상품명,
      nvl(sum(a.buy_qty),0) as 매입수량,
      nvl(sum(a.buy_qty*a.buy_cost),0) as 구매금액
from buyprod a
right outer join prod b on(a.buy_prod = b.prod_id
      and a.buy_date between '20050601' and '20050630')
group by b.prod_name;


(subquery)
select b.prod_name as  상품명,
     nvl(f.qamt,0) as 판매수량,
     nvl(f.mamt,0) as 판매금액
from(select cart_prod,
        sum(cart_qty) as qamt,
        sum(cart_qty*prod_price) as mamt
     from cart,prod
     where cart_prod=prod_id
       and cart_no like '200506%'
       group by cart_prod 0439127682a, prod b
 where a.cart_prod(+)=b.prod_d;      


예) 사원테이블에서 모든 부서에 대한 사원수를 조회하는 쿼리르 작서하시오.
Alias는 부서코드,부서명,사원수/*employees*/
--deapartment
--외래키 사원테이블에 0이 없다.
(일반외부조인)
select departments.department_id as 부서코드,
       departments.department_name as 부서명,
        count(employees.employee_id) as 사원수
   from employees
   full outer join departments on(departments.department_id=employees.department_id)
   group by departments.department_id,departments.department_name;

예) 2005년도 5월전체(/*outer join*/) 상품에 대하여 입,출고 현황을 조회하시오.
alias는 상품코드, 상품명,입고량(buyprod), 출고량(cart)

select a.prod_id as  상품코드,
       a.prod_name as 상품명,
       sum(b.buy_qty) as 입고량,
       sum(c.cart_qty) as  출고량
 from prod a, buyprod b, cart c
 where a.prod_id=c.cart_prod
  and a.prod_id = b.buy_prod
   and c.cart_no between '20050501' and '20050531'
   group by a.prod_id,a.prod_name;
   
   
  (외부조인) 
   select a.prod_id as  상품코드,
       a.prod_name as 상품명,
       sum(b.buy_qty) as 입고량,
       sum(c.cart_qty) as  출고량
 from prod a, buyprod b, cart c
 where a.prod_id =c.cart_prod(+)
  and a.prod_id = b.buy_prod
   and c.cart_no(+) like '2005%'
   group by a.prod_id,a.prod_name;
   
   (ansi)
select a.prod_id as  상품코드,
       a.prod_name as 상품명,
       nvl(sum(b.buy_qty),0) as 입고량,
       nvl(sum(c.cart_qty),0) as  출고량
 from prod a
 right outer join buyprod b on(a.prod_id = b.buy_prod)
 left outer join cart c on(a.prod_id =c.cart_prod 
   and c.cart_no between '20050501' and '20050531')
group by a.prod_id,a.prod_name;



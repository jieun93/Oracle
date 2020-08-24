2020-01-14-02)테이블조인
- 하나의 테이블의 데이터만으로 처리할 수 없는 경우 해당 자료를 가지고 있는 테이블 모두 쿼리에 참여해야 함
- 즉, 2개 이상의 테이블에서 필요한 자료를 추출하는 연산을 조인(join)이라 함.
- join을 수행하기 위해서 조인 연산에 참여하는 테이블 사이에 반드시 관계(relationship)가
  존재해야함(공통의 컬럼이 존재)
- 공통된 컬럼 값을 비교 연산자(관계연산자)로 조건식(조인조건)을 구성
- n개의 테이블이 조인 연산에 참여하는 경우 적어도 n-1개의 조인 조건이 필요
 
 (사용형식)
select  [테이블별칭.]컬럼명,...
  from  테이블명1 [테이블별칭1], 테이블명2 [테이블별칭2][,...]
  where [테이블별칭.]컬럼명=[테이블별칭2.]컬럼명
   [and [테이블별칭m.]컬럼명=[테이블별칭n.]컬럼명....
   [and 일반조건...]

1)Cartesian Product
- 가능한 모든 행들의 조합을 수행하는 조인
- A 테이블이 100행, 10열, B테이블이 50행, 7열이고 이 두테이블에 대하여 Cartesian Product 를 수행하면 5000행(곱) 17열(합)의 결과
- 조인조건이 잘못 기술되거나 조인조건을 생략하는 경우 발생
- ANSI 조인에서는 Cross Join이라고 한다.
- 특수한 목적 이외에는 수행되는 곳이 없음


예) 상품테이블과 회원테이블을 조인하시오.
select * from prod,member;

select 74*24 from dual;

select count(*)
    from cart,buyprod,prod;
    
2)Equi join
 - 내부 조인(Inner Join) 이라고도 함
 - 조인 조건에 동등연산자('=')가 사용
 - 조인 조건에 맞지 않는 자료는 무시
 
 예)사원테이블에서 입사일이 2005년 1월1일 이후 입사한 직원을 조회하시오.
   Alias는 사원번호, 사원명, 부서코드, 부서명, 급여이다.
   
   select distinct a.department_id as 부서코드, 
          b.department_name as 부서명 
     from employees a, departments b
    where a.department_id = b.department_id --조인조건
 order by 1;       
      
   예) 장바구니 테이블에서 2005년 5월 판매정보를 조회하시오.
   Alias는 제품코드, 제품명, 판매수량합계,판매금액합계
   
   select  b.prod_id as 제품코드, 
           b.prod_name as 제품명,
           sum(a.cart_qty) as 판매수량합계, 
           sum(a.cart_qty*b.prod_price) as 판매금액합계
     from cart a, prod b  
     where a.cart_no like '200505%'--일반조건
       and a.cart_prod = b.prod_id --조인조건
       group by b.prod_id, b.prod_name--중복되는 내용
  
  예) 매입테이블(buyprod)의 정보를 이용하여 2005년  1월 거래처별 매입금액 합계를 구하시오.
      단,  Alias 는 거래처 코드, 거래처명, 매입수량합계, 매입금액합계
      select c.prod_buyer as 거래처코드,
             a.buyer_name as 거래처명,
             sum(b.buy_qty) as 매입수량합계,
             sum(b.buy_qty*b.buy_cost) as 매입금액합계
        from buyer a, buyprod b  ,prod c
        where b.buy_date between '20050101' and '20050131'
        
        
        
        and  c.prod_id = b.buy_prod
        and  a.buyer_id = c.prod_buyer
        group by c.prod_buyer , a.buyer_name;
        
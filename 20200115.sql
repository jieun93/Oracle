2020-01-15-01) ANSI Inner join 형식
(사용형식)
select 컬러명,...
    from 테이블명1
  inner join 테이블명2 on 조인조건
   [and 일반조건...] 
  [inner join 테이블명3 on  조인조건
  ......]
  [where 일반조건.....]
  
  예)2005년 3월 제품별 매입정보를 조회하시오.
    Alias는 제품번호,제품명,매입수량,매입금액
   (일반조인) 
    select a.buy_prod as 제품번호,
           b.prod_name as 제품명,
           count(*) as 구매횟수,
           sum(a.buy_qty) as 매입수량,
           sum(a.buy_qty*a.buy_cost) as 매입금액
      from buyprod a, prod b
     where a.buy_prod = b.prod_id --조인조건
       and a.buy_date between '20050301' and '20050331'
       group by a.buy_prod, b.prod_name;      
       
       (ansi 형식)
   select a.buy_prod as 제품번호,
           b.prod_name as 제품명,
           count(*) as 구매횟수,
           sum(a.buy_qty) as 매입수량,
           sum(a.buy_qty*a.buy_cost) as 매입금액
      from buyprod a
    inner  join prod b on (a.buy_prod = b.prod_id --조인조건
       and  a.buy_date between '20050301' and '20050331')
   group by a.buy_prod, b.prod_name;
   
   예) 상품테이블에 저장된 상품에 대하여 상품번호,상품명, 분류명, 거래처명을 조회하시오.
   /*lgu분류번호,buyer 상품거래처번호,분류명-lprod테이블,buyer 거래처명*/
   
   select a.prod_id as 상품번호,
          a.prod_name as 상품명,
          c.lprod_nm as 분류명,
          b.buyer_name as 거래처명    
    from prod a , buyer b , lprod c
    where a.prod_buyer = b.buyer_id
      and a.prod_lgu = c.lprod_gu;
   
   (ansi형식)
   select a.prod_id as 상품번호,
          a.prod_name as 상품명,
          c.lprod_nm as 분류명,
          b.buyer_name as 거래처명    
    from prod a 
    inner join buyer b on (a.prod_buyer = b.buyer_id)--조인조건
    inner join lprod c on (a.prod_lgu = c.lprod_gu);--조인조건
    
   
   예)2005년도 회원별 매출액을 조회하시오. 단, 구입건수가 5회 이상이고, 
     매출액이 500만원 이상인 회원에 대하여 회원번호,회원명,구매건수,구입금액.
   /*member,prod,cart*/
   (일반조인)
   select a.mem_id as  회원번호,
          a.mem_name as  회원명,
          count(*) as  구매건수,
          sum (c.cart_qty*b.prod_price) as  구입금액
   from member a, prod b , cart c
   where a.mem_id = c.cart_member
     and b.prod_id = c.cart_prod
     and c.cart_no like '2005%'--substr(cart_no,1,4)='2005'
     group by a.mem_id, a.mem_name
     having count(*)>=5 and sum(c.cart_qty*b.prod_price)>=5000000
    order by 4 desc; 
  
   (ansi형식)
   
    select a.mem_id as  회원번호,
          a.mem_name as  회원명,
          count(*) as  구매건수,
          sum (c.cart_qty * b.prod_price) as  구입금액
   from member a 
   inner join prod b on (b.prod_id = c.cart_prod 
   and c.cart_no like '2005%')
   inner join  cart c on (a.mem_id = c.cart_member)
     group by a.mem_id, a.mem_name
     having count(*)>=5 and sum(c.cart_qty*b.prod_price)>=5000000
     order by 4 desc;
   
   
   
   예) 2005년도 매출자료(cart)를 이용하여 거래처별 매출액을 조회하시오.
      거래처번호, 거래처명, 판매건수, 판매금액
      buyer/cart/prod
      (일반형식)
      select a.buyer_id as 거래처번호,
             a.buyer_name as 거래처명,
             count(a.cart_no) as  판매건수,
             sum(b.prod_price*c.cart_qty) as 판매금액
      from   buyer a, prod b, cart c
      where  c.cart_no like'2005%'
        and  b.prod_id = c.cart_prod
        and  b.prod_buyer=a.buyer_id
   group by  a.buyer_id,a.buyer_name;
   
   (ansi 형식)
   
   select a.buyer_id as 거래처번호,
             a.buyer_name as 거래처명,
             count(*) as 판매건수,
             sum(b.prod_price*c.cart_qty) as 판매금액
      from   cart c 
      inner join prod b on (b.prod_id = c.cart_prod)
      inner join buyer a on ( b.prod_buyer=a.buyer_id)
      where   c.cart_no like '2005%'
   group by  a.buyer_id,a.buyer_name;
   
   예) 장바구니 테이블의 자료를 활용하여 2005년 5월 상품 분류별 판매현황을 조회하시오.
   Alias 분류코드, 분류명, 판매액 합계
   lprod,prod,cart
   
    select a.lprod_gu as 분류코드,
           a.lprod_nm as 분류명,
           sum(b.prod_price*c.cart_qty) as 판매액합계
       from lprod a , prod b, cart c  
       where c.cart_no like '200505%'
         and a.lprod_gu = b.prod_lgu
         and c.cart_prod = b.prod_id
       group by  a.lprod_gu, a.lprod_nm;
         
         (ansi)
      select a.lprod_gu as 분류코드,
           a.lprod_nm as 분류명,
           sum(b.prod_price*c.cart_qty) as 판매액합계
       from cart c 
       inner join prod b on(c.cart_prod = b.prod_id)
       inner join lprod a on(a.lprod_gu = b.prod_lgu)
       where c.cart_no like '200505%'
       group by  a.lprod_gu, a.lprod_nm;
       
           
        
   
        
       
      
  
2020-01-30-03)function
 - procedure와 동일한 기능 수행
 - 반환값이 존재함 (select절, where 절에서 사용 가능)
 
 (사용형식)
 create [or replace] function 함수명[(
  매개변수 [in|out}inout] 타입[:=디폴트값],...)]
   return 타입명
   [is|as]
   begin
    pl/sql문(들);
    
     [exception
       예외처리문;]
   end;
   
   예)2005년 5월 판매된 상품코드를 입력 받아  판매금액합계를 계산하는 함수작성
   
   
   (2005년 5월 판매된 상품코드)
    select  distinct cart_prod
      from cart;
    where cart_no like '200505%'
    
    (상품코드)
    select prod_id
       from prod;
       
    (판매금액 합계)
       create or replace function fn_cart_01(
        p_id in cart.cart_prod%type)
        
        return number
        
        is 
         v_sum number:=0;
         begin
         select sum(cart_qty*prod_price) into v_sum
             from cart,prod
             where cart_prod=prod_id
              and cart_prod=p_id
              and cart_no like '200505%';
              
          return v_sum;
          
          exception
             when others then
              DBMS_OUTPUT.PUT_LINE('예외발생 : '||sqlerrm);
           end;   
           
           (실행)
           select prod_id as 상품코드,
                  prod_name as 상품명,
                  nvl(fn_cart_01(prod_id),0) as 판매금액
           from prod;
           where fn_cart_01(prod_id)>=300000;
       
    
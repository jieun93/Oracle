2020-01-30-03)function
 - procedure�� ������ ��� ����
 - ��ȯ���� ������ (select��, where ������ ��� ����)
 
 (�������)
 create [or replace] function �Լ���[(
  �Ű����� [in|out}inout] Ÿ��[:=����Ʈ��],...)]
   return Ÿ�Ը�
   [is|as]
   begin
    pl/sql��(��);
    
     [exception
       ����ó����;]
   end;
   
   ��)2005�� 5�� �Ǹŵ� ��ǰ�ڵ带 �Է� �޾�  �Ǹűݾ��հ踦 ����ϴ� �Լ��ۼ�
   
   
   (2005�� 5�� �Ǹŵ� ��ǰ�ڵ�)
    select  distinct cart_prod
      from cart;
    where cart_no like '200505%'
    
    (��ǰ�ڵ�)
    select prod_id
       from prod;
       
    (�Ǹűݾ� �հ�)
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
              DBMS_OUTPUT.PUT_LINE('���ܹ߻� : '||sqlerrm);
           end;   
           
           (����)
           select prod_id as ��ǰ�ڵ�,
                  prod_name as ��ǰ��,
                  nvl(fn_cart_01(prod_id),0) as �Ǹűݾ�
           from prod;
           where fn_cart_01(prod_id)>=300000;
       
    
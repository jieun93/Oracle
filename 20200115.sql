2020-01-15-01) ANSI Inner join ����
(�������)
select �÷���,...
    from ���̺��1
  inner join ���̺��2 on ��������
   [and �Ϲ�����...] 
  [inner join ���̺��3 on  ��������
  ......]
  [where �Ϲ�����.....]
  
  ��)2005�� 3�� ��ǰ�� ���������� ��ȸ�Ͻÿ�.
    Alias�� ��ǰ��ȣ,��ǰ��,���Լ���,���Աݾ�
   (�Ϲ�����) 
    select a.buy_prod as ��ǰ��ȣ,
           b.prod_name as ��ǰ��,
           count(*) as ����Ƚ��,
           sum(a.buy_qty) as ���Լ���,
           sum(a.buy_qty*a.buy_cost) as ���Աݾ�
      from buyprod a, prod b
     where a.buy_prod = b.prod_id --��������
       and a.buy_date between '20050301' and '20050331'
       group by a.buy_prod, b.prod_name;      
       
       (ansi ����)
   select a.buy_prod as ��ǰ��ȣ,
           b.prod_name as ��ǰ��,
           count(*) as ����Ƚ��,
           sum(a.buy_qty) as ���Լ���,
           sum(a.buy_qty*a.buy_cost) as ���Աݾ�
      from buyprod a
    inner  join prod b on (a.buy_prod = b.prod_id --��������
       and  a.buy_date between '20050301' and '20050331')
   group by a.buy_prod, b.prod_name;
   
   ��) ��ǰ���̺� ����� ��ǰ�� ���Ͽ� ��ǰ��ȣ,��ǰ��, �з���, �ŷ�ó���� ��ȸ�Ͻÿ�.
   /*lgu�з���ȣ,buyer ��ǰ�ŷ�ó��ȣ,�з���-lprod���̺�,buyer �ŷ�ó��*/
   
   select a.prod_id as ��ǰ��ȣ,
          a.prod_name as ��ǰ��,
          c.lprod_nm as �з���,
          b.buyer_name as �ŷ�ó��    
    from prod a , buyer b , lprod c
    where a.prod_buyer = b.buyer_id
      and a.prod_lgu = c.lprod_gu;
   
   (ansi����)
   select a.prod_id as ��ǰ��ȣ,
          a.prod_name as ��ǰ��,
          c.lprod_nm as �з���,
          b.buyer_name as �ŷ�ó��    
    from prod a 
    inner join buyer b on (a.prod_buyer = b.buyer_id)--��������
    inner join lprod c on (a.prod_lgu = c.lprod_gu);--��������
    
   
   ��)2005�⵵ ȸ���� ������� ��ȸ�Ͻÿ�. ��, ���԰Ǽ��� 5ȸ �̻��̰�, 
     ������� 500���� �̻��� ȸ���� ���Ͽ� ȸ����ȣ,ȸ����,���ŰǼ�,���Աݾ�.
   /*member,prod,cart*/
   (�Ϲ�����)
   select a.mem_id as  ȸ����ȣ,
          a.mem_name as  ȸ����,
          count(*) as  ���ŰǼ�,
          sum (c.cart_qty*b.prod_price) as  ���Աݾ�
   from member a, prod b , cart c
   where a.mem_id = c.cart_member
     and b.prod_id = c.cart_prod
     and c.cart_no like '2005%'--substr(cart_no,1,4)='2005'
     group by a.mem_id, a.mem_name
     having count(*)>=5 and sum(c.cart_qty*b.prod_price)>=5000000
    order by 4 desc; 
  
   (ansi����)
   
    select a.mem_id as  ȸ����ȣ,
          a.mem_name as  ȸ����,
          count(*) as  ���ŰǼ�,
          sum (c.cart_qty * b.prod_price) as  ���Աݾ�
   from member a 
   inner join prod b on (b.prod_id = c.cart_prod 
   and c.cart_no like '2005%')
   inner join  cart c on (a.mem_id = c.cart_member)
     group by a.mem_id, a.mem_name
     having count(*)>=5 and sum(c.cart_qty*b.prod_price)>=5000000
     order by 4 desc;
   
   
   
   ��) 2005�⵵ �����ڷ�(cart)�� �̿��Ͽ� �ŷ�ó�� ������� ��ȸ�Ͻÿ�.
      �ŷ�ó��ȣ, �ŷ�ó��, �ǸŰǼ�, �Ǹűݾ�
      buyer/cart/prod
      (�Ϲ�����)
      select a.buyer_id as �ŷ�ó��ȣ,
             a.buyer_name as �ŷ�ó��,
             count(a.cart_no) as  �ǸŰǼ�,
             sum(b.prod_price*c.cart_qty) as �Ǹűݾ�
      from   buyer a, prod b, cart c
      where  c.cart_no like'2005%'
        and  b.prod_id = c.cart_prod
        and  b.prod_buyer=a.buyer_id
   group by  a.buyer_id,a.buyer_name;
   
   (ansi ����)
   
   select a.buyer_id as �ŷ�ó��ȣ,
             a.buyer_name as �ŷ�ó��,
             count(*) as �ǸŰǼ�,
             sum(b.prod_price*c.cart_qty) as �Ǹűݾ�
      from   cart c 
      inner join prod b on (b.prod_id = c.cart_prod)
      inner join buyer a on ( b.prod_buyer=a.buyer_id)
      where   c.cart_no like '2005%'
   group by  a.buyer_id,a.buyer_name;
   
   ��) ��ٱ��� ���̺��� �ڷḦ Ȱ���Ͽ� 2005�� 5�� ��ǰ �з��� �Ǹ���Ȳ�� ��ȸ�Ͻÿ�.
   Alias �з��ڵ�, �з���, �Ǹž� �հ�
   lprod,prod,cart
   
    select a.lprod_gu as �з��ڵ�,
           a.lprod_nm as �з���,
           sum(b.prod_price*c.cart_qty) as �Ǹž��հ�
       from lprod a , prod b, cart c  
       where c.cart_no like '200505%'
         and a.lprod_gu = b.prod_lgu
         and c.cart_prod = b.prod_id
       group by  a.lprod_gu, a.lprod_nm;
         
         (ansi)
      select a.lprod_gu as �з��ڵ�,
           a.lprod_nm as �з���,
           sum(b.prod_price*c.cart_qty) as �Ǹž��հ�
       from cart c 
       inner join prod b on(c.cart_prod = b.prod_id)
       inner join lprod a on(a.lprod_gu = b.prod_lgu)
       where c.cart_no like '200505%'
       group by  a.lprod_gu, a.lprod_nm;
       
           
        
   
        
       
      
  
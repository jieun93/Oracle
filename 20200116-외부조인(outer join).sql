2020-01-16-01)�ܺ�����(outer join)
- ��������(inner join, equi-join)������ ���������� �������� �ʴ� �����ʹ�
 �˻����� ����
- �ܺ����ο����� ���ڶ�� ���̺�  null ���� �����Ͽ� ��� ���� �˻��ǵ��� ��ȸ�ϴ� ���
- �������� ����(���� ��)�� �ƴ϶� ������ ����
(�������-�Ϲ� outer join)
. �������ǿ��� ������ ���� �÷��� �ڿ� '(+)'�����ڸ� �߰�
 select �÷��� list
  from ���̺�list
  where �÷���= �÷���(+)...

(�������-ANSI outer join)
  select �÷��� list
    from ���̺��1
    left|right|full [outer] join ���̺��2 on (�������� [
    and �Ϲ�����...]
           :
    [where �Ϲ�����]



(���ǻ���)
.3�� �̻��� ���̺��� ���Ǵ� ��� ��� �ܺ������� ��� ��� �������ǿ�'(+)' �����ڸ� ��� �ؾ���
.�ѹ��� �� ���̺� ���ؼ��� �ܺ������� �� ���� ����. �� A,B,C ���̺��� ������� �ܺ������� 
�����ϴ� ��� A�� �������� B���̺��� �ܺ��������� �����ߴٸ� C�� �������� B���̺� �ܺ������� 
������ �� ����.
.'(+)' �����ڰ� ���� ���ǰ� ���� ������ OR  �����ڷ� ���ս�ų�� ����.
.'(+)' �����ڴ� IN�����ڿ� ���� ����� �� ����.
.�Ϲ� �ܺ����� ���ǰ� �Ϲ������� ���ÿ� ����Ǹ� �ܺ������� ������� ����
 (���� ���ΰ���� ��ȯ��- �ذ������� subquery�� ANSI outer join �� ����ؾ� ��)


��) ��ǰ���̺�� �з����̺��� �̿��Ͽ� ��ü �з��� ��ǰ�� ���� ��ȸ�Ͻÿ�.
    Alias�� �з��ڵ�,�з���, ��ǰ�� ���̴�.
    
    
    select count (*) from lprod;

    select count(distinct prod_lgu) from prod;


(��������)
select b.prod_lgu as �з��ڵ�,
       a.lprod_nm as �з���,
       count(*) as ��ǰ�Ǽ�
     from lprod a ,prod b
    where a.lprod_gu=b.prod_lgu
    group by b.prod_lgu, a.lprod_nm;


(�ܺ�����)
select a.lprod_gu as �з��ڵ�,
       a.lprod_nm as �з���,
       count(prod_id) as ��ǰ�Ǽ�
     from lprod a ,prod b 
    where a.lprod_gu=b.prod_lgu(+)
    group by a.lprod_gu, a.lprod_nm
    order by 1;

--count ������ ��� �Ҷ��� �÷����� �������� �Ѵ�.
--*�� ����Ҽ� ����.
(ansi ����)
select a.lprod_gu as �з��ڵ�,
       a.lprod_nm as �з���,
       count(prod_id) as ��ǰ�Ǽ�
     from lprod a 
    left outer join prod b on(a.lprod_gu=b.prod_lgu)
    group by a.lprod_gu, a.lprod_nm
    order by 1;

��) 2005�� 6�� ���������� ��ȸ�ϵ� ��� ��ǰ�� �������� ��ȸ
Alias ��ǰ��, �Ǹż���, �Ǹűݾ�

(��������)
select a.prod_name as ��ǰ��,
      sum(b.cart_qty) as �Ǹż���,
      sum(b.cart_qty*a.prod_price) as �Ǹűݾ� 
from prod a, cart b
where b.cart_prod=a.prod_id
 and b.cart_no like'200506%'
group by a.prod_name;
 
(�ܺ�����)
select a.prod_name as ��ǰ��,
      sum(b.cart_qty) as �Ǹż���,
      sum(b.cart_qty*a.prod_price) as �Ǹűݾ� 
from prod a, cart b
where b.cart_prod(+)=a.prod_id
and b.cart_no(+) like'200506%'
group by a.prod_name
order by 1;

(ansi ����)
select a.prod_name as ��ǰ��,
      nvl(sum(b.cart_qty),0) as �Ǹż���,
      nvl(sum(b.cart_qty*a.prod_price),0) as �Ǹűݾ� 
from cart b
right outer join prod a on(b.cart_prod=a.prod_id--��������
 and b.cart_no like'200506%')
group by a.prod_name;


��) 2005�� 6�� ���������� ��ȸ�ϵ� ��� ��ǰ�� �������� ��ȸ
Alias ��ǰ��, ���Լ���, ���űݾ�
--buyprod
(��������)
select b.prod_name as  ��ǰ��,
      sum(a.buy_qty) as ���Լ���,
      sum(a.buy_qty*a.buy_cost) as ���űݾ�
from buyprod a, prod b
where a.buy_prod = b.prod_id
and a.buy_date between '20050601' and '20050630'
group by b.prod_name;

(�ܺ�����)

select b.prod_name as  ��ǰ��,
      sum(a.buy_qty)as ���Լ���,
      sum(a.buy_qty*a.buy_cost) as ���űݾ�
from buyprod a, prod b
where a.buy_prod(+) = b.prod_id
and a.buy_date(+) between '20050601' and '20050630'
group by b.prod_name;


(ansi ����)
select b.prod_name as  ��ǰ��,
      nvl(sum(a.buy_qty),0) as ���Լ���,
      nvl(sum(a.buy_qty*a.buy_cost),0) as ���űݾ�
from buyprod a
right outer join prod b on(a.buy_prod = b.prod_id
      and a.buy_date between '20050601' and '20050630')
group by b.prod_name;


(subquery)
select b.prod_name as  ��ǰ��,
     nvl(f.qamt,0) as �Ǹż���,
     nvl(f.mamt,0) as �Ǹűݾ�
from(select cart_prod,
        sum(cart_qty) as qamt,
        sum(cart_qty*prod_price) as mamt
     from cart,prod
     where cart_prod=prod_id
       and cart_no like '200506%'
       group by cart_prod 0439127682a, prod b
 where a.cart_prod(+)=b.prod_d;      


��) ������̺��� ��� �μ��� ���� ������� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�.
Alias�� �μ��ڵ�,�μ���,�����/*employees*/
--deapartment
--�ܷ�Ű ������̺� 0�� ����.
(�Ϲݿܺ�����)
select departments.department_id as �μ��ڵ�,
       departments.department_name as �μ���,
        count(employees.employee_id) as �����
   from employees
   full outer join departments on(departments.department_id=employees.department_id)
   group by departments.department_id,departments.department_name;

��) 2005�⵵ 5����ü(/*outer join*/) ��ǰ�� ���Ͽ� ��,��� ��Ȳ�� ��ȸ�Ͻÿ�.
alias�� ��ǰ�ڵ�, ��ǰ��,�԰�(buyprod), ���(cart)

select a.prod_id as  ��ǰ�ڵ�,
       a.prod_name as ��ǰ��,
       sum(b.buy_qty) as �԰�,
       sum(c.cart_qty) as  ���
 from prod a, buyprod b, cart c
 where a.prod_id=c.cart_prod
  and a.prod_id = b.buy_prod
   and c.cart_no between '20050501' and '20050531'
   group by a.prod_id,a.prod_name;
   
   
  (�ܺ�����) 
   select a.prod_id as  ��ǰ�ڵ�,
       a.prod_name as ��ǰ��,
       sum(b.buy_qty) as �԰�,
       sum(c.cart_qty) as  ���
 from prod a, buyprod b, cart c
 where a.prod_id =c.cart_prod(+)
  and a.prod_id = b.buy_prod
   and c.cart_no(+) like '2005%'
   group by a.prod_id,a.prod_name;
   
   (ansi)
select a.prod_id as  ��ǰ�ڵ�,
       a.prod_name as ��ǰ��,
       nvl(sum(b.buy_qty),0) as �԰�,
       nvl(sum(c.cart_qty),0) as  ���
 from prod a
 right outer join buyprod b on(a.prod_id = b.buy_prod)
 left outer join cart c on(a.prod_id =c.cart_prod 
   and c.cart_no between '20050501' and '20050531')
group by a.prod_id,a.prod_name;



2020-01-14-02)���̺�����
- �ϳ��� ���̺��� �����͸����� ó���� �� ���� ��� �ش� �ڷḦ ������ �ִ� ���̺� ��� ������ �����ؾ� ��
- ��, 2�� �̻��� ���̺��� �ʿ��� �ڷḦ �����ϴ� ������ ����(join)�̶� ��.
- join�� �����ϱ� ���ؼ� ���� ���꿡 �����ϴ� ���̺� ���̿� �ݵ�� ����(relationship)��
  �����ؾ���(������ �÷��� ����)
- ����� �÷� ���� �� ������(���迬����)�� ���ǽ�(��������)�� ����
- n���� ���̺��� ���� ���꿡 �����ϴ� ��� ��� n-1���� ���� ������ �ʿ�
 
 (�������)
select  [���̺�Ī.]�÷���,...
  from  ���̺��1 [���̺�Ī1], ���̺��2 [���̺�Ī2][,...]
  where [���̺�Ī.]�÷���=[���̺�Ī2.]�÷���
   [and [���̺�Īm.]�÷���=[���̺�Īn.]�÷���....
   [and �Ϲ�����...]

1)Cartesian Product
- ������ ��� ����� ������ �����ϴ� ����
- A ���̺��� 100��, 10��, B���̺��� 50��, 7���̰� �� �����̺� ���Ͽ� Cartesian Product �� �����ϸ� 5000��(��) 17��(��)�� ���
- ���������� �߸� ����ǰų� ���������� �����ϴ� ��� �߻�
- ANSI ���ο����� Cross Join�̶�� �Ѵ�.
- Ư���� ���� �̿ܿ��� ����Ǵ� ���� ����


��) ��ǰ���̺�� ȸ�����̺��� �����Ͻÿ�.
select * from prod,member;

select 74*24 from dual;

select count(*)
    from cart,buyprod,prod;
    
2)Equi join
 - ���� ����(Inner Join) �̶�� ��
 - ���� ���ǿ� �������('=')�� ���
 - ���� ���ǿ� ���� �ʴ� �ڷ�� ����
 
 ��)������̺��� �Ի����� 2005�� 1��1�� ���� �Ի��� ������ ��ȸ�Ͻÿ�.
   Alias�� �����ȣ, �����, �μ��ڵ�, �μ���, �޿��̴�.
   
   select distinct a.department_id as �μ��ڵ�, 
          b.department_name as �μ��� 
     from employees a, departments b
    where a.department_id = b.department_id --��������
 order by 1;       
      
   ��) ��ٱ��� ���̺��� 2005�� 5�� �Ǹ������� ��ȸ�Ͻÿ�.
   Alias�� ��ǰ�ڵ�, ��ǰ��, �Ǹż����հ�,�Ǹűݾ��հ�
   
   select  b.prod_id as ��ǰ�ڵ�, 
           b.prod_name as ��ǰ��,
           sum(a.cart_qty) as �Ǹż����հ�, 
           sum(a.cart_qty*b.prod_price) as �Ǹűݾ��հ�
     from cart a, prod b  
     where a.cart_no like '200505%'--�Ϲ�����
       and a.cart_prod = b.prod_id --��������
       group by b.prod_id, b.prod_name--�ߺ��Ǵ� ����
  
  ��) �������̺�(buyprod)�� ������ �̿��Ͽ� 2005��  1�� �ŷ�ó�� ���Աݾ� �հ踦 ���Ͻÿ�.
      ��,  Alias �� �ŷ�ó �ڵ�, �ŷ�ó��, ���Լ����հ�, ���Աݾ��հ�
      select c.prod_buyer as �ŷ�ó�ڵ�,
             a.buyer_name as �ŷ�ó��,
             sum(b.buy_qty) as ���Լ����հ�,
             sum(b.buy_qty*b.buy_cost) as ���Աݾ��հ�
        from buyer a, buyprod b  ,prod c
        where b.buy_date between '20050101' and '20050131'
        
        
        
        and  c.prod_id = b.buy_prod
        and  a.buyer_id = c.prod_buyer
        group by c.prod_buyer , a.buyer_name;
        
2020-01-17-02)������/������ ��������
 - ���������� ����� �ϳ��� ������ ��ȯ�Ǵ� ��������
 -���� ������(=,>,<,>=,<=,!=)�� ���
 
 ��)������̺��� 50�� �μ��� ���� ����� �ִ� �޿����� �� ���� �޿��� �޴� �����
 �����ȣ, �μ���, ��å��, �޿��� ����Ͻÿ�.
 
 �������� ����� �����ȣ, �μ���, ��å��, �޿��� ����Ͻÿ�.
 ���������� ���� 50�� �μ��� ���� ���
 
 select a.employee_id as �����ȣ,
        a.emp_name as �����,
        b.department_name as �μ���,
        c.job_title as ��å��,
        a.salary as �޿�
   from employees a , departments b, jobs c
   where a.department_id = b.department_id --��������//�μ���
    and a.job_id=c.job_id --��������//��å��
   -- and a.salary >=(50���μ��� ���� ��� ���� �ִ�޿�)
    and  a.salary >=(select max(salary)
                    from employees
                     where department_id =50);
    
    (2)��������-50�� �μ��� ���� ��� �� �ִ�޿�
    select max(salary)
    from employees
    where department_id >=50;
    
 ��) 2005�� 5�� ��ٱ������̺��� �ִ뱸�ż����� ȸ�������� ��ȸ�Ͻÿ�.
 subquery ����, ȸ����ȣ,ȸ����,��ǰ��--(1)
 subquery ����, ȸ����ȣ,ȸ����,��ǰ��,�ִ뱸�ż���--(2)
 
 select  c.cart_member as ȸ����ȣ,
         a.mem_name as  ȸ����,
         b.prod_name as ��ǰ��,
         d.mqty as �ִ뱸�ż���
   from  member a,prod b, cart c,(select max(cart_qty) as mqty
                                   from cart
                                   where cart_no like '200505%') d
   where a.mem_id = c.cart_member 
     and c.cart_prod=b.prod_id
     and c.cart_qty>=d.mqty;
     
     2)��������
     select max(cart_qty)
     from cart
     where cart_no like '200505%;'
     
     
     ��) 2005�� 5���� ��� ȸ����  ���ż�����, ���űݾ����� ���Ͻÿ�.
      ��,  ansi outer join�� ������� ����,
          ���ž� ���� ���� 5�� ��ȸ�� ��,
          Alias�� ȸ����ȣ, ȸ����, ���ż���, ���űݾ�
          
          select mem_id as ȸ����ȣ,
                 mem_name as ȸ����,
                 cart_qyt as ���ż���,
                 b as  ���űݾ�
          
         (��)2005�� 5�� ���ż������� ���ϰ� ���� 5�� ���
        
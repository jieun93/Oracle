2020-01-17-01)SUBQUERY
 - QUERY�ȿ� ���Ե� �� �ٸ� ����
 - ��������� ����ϱ� ���� ����(�۱��� ����0�� ���� ������ ��
 - ���������� SELECT,WHERE, FROM ���� ��ġ�� �� ����(Ư�� FROM ���� ������
  ���������� IN-LINE SUBQUERY�� �ϸ� ��ü������ ���� �����ؾ� ��
 - ���������� '()'�ȿ� ����Ǹ� �� ������ �� ���� �����
 - ���������� �з���
  .������������ ���ü�(����) ���ο� ���� ������ �ִ� ��������, ������ ���� ���������� �з�
  .��ȯ�Ǵ� ����� �ϳ��� ��/��, �ټ��� ��/���� ���� �з�
 - ���������� �����ڿ� �Բ� ���Ǵ� ��� �ݵ�� ������ �����ʿ� ��� 
  
  1)������ ���� ��������
  .���������� �����ϴ� ���̺�� ���������� ���� ���̺��� �������� ������� ���� ��������
  
  ��) ������̺��� ��ü ����� ��� �޿����� �� ���� �޿��� �޴� ������� ��ȸ�Ͻÿ�.
  Alias�� �����ȣ, �����, �μ���, �޿�
 
 (1)��������-�����̺��� ��ü ����� �����ȣ,�����,�μ���,�޿���ȸ
          -(����) ����� ��� �޿����� �� ���� �޿���  �޴�
          select  a.employees_id as �����ȣ,
                  a.emp_name as �����,
                  b.department_name as �μ���,
                  a.salary as �޿�
          from employees a, departments b
          where a.department_id=b.departmenr_id --��������
  
  (2)��������-����� ��ձ޿�
  select avg(salary) from employees;
  
3)(����)
  select  a.employee_id as �����ȣ,
          a.emp_name as �����,
          b.department_name as �μ���,                 
          a.salary as �޿�
          from employees a, departments b
          where a.department_id=b.department_id --��������
          and a.salary >=(select avg(salary)
                            from employees);
                            
 **in-line subquery �� ����       
  select  a.employee_id as �����ȣ,
          a.emp_name as �����,
          b.department_name as �μ���,                 
          round(c.savg) as  ��ձ޿�,
          a.salary as �޿�
 from employees a, departments b,(select avg(salary) as savg
                                            from employees)c
 where a.department_id=b.department_id  --��������
  and a.salary >=c.savg;
  
            
 ��) ������̺��� �� ����� �μ��� �����μ��� ���� �μ��� ���� ������� ��ȸ�Ͻÿ�.
1)�������� - ������̺��� ������� ��ȸ
               - (����): ������� �μ��� �����μ��� ���� �μ�
      select count(*)
        from employees
       where department_id = (�����μ��� ���� �μ�)
       
2)�������� -�����μ��� ���� �μ�          
  select   department_id   
    from   departments
   where   parent_id is null;
                    
 3) ����                   
select count(*)
from employees
where department_id=(select   department_id   
                     from   departments
                     where   parent_id is null);
 
  ��) ������̺��� �� ����� �μ��� �����μ��� 10�μ��� ���� ������� ��ȸ�Ͻÿ�.    

(in �����ڸ� ����Ѱ��)
select count(*)
from employees
where department_id in (select  department_id   
                       from   departments
                      where   parent_id = 10); 
                

(any, some �����ڸ� ����Ѱ��)
select count(*)
from employees
where department_id =any/*=some*/  (select  department_id   
                       from   departments
                      where   parent_id = 10); 
                      
                      
                      
 ��) ������̺��� �� ����� �μ��� �����μ��� 90�μ��� ���� ������� ��ȸ�Ͻÿ�.                     

(exists �����ڸ� ����Ѱ��)--���ü��ִ� ��������(��������)
select count(*)
  from employees b
 where  exists  (select *    
                  from  employees a
                  where a.department_id in (select department_id
                                            from departments
                                            where parent_id = 90)
                      and a.employee_id=b.employee_id);  --����
                      
  --select 1 from cart;                    
        
   ��) ��ٱ������̺��� 2005�� 6���� �Ǹŵ� �Ǹ������� ��ȸ�Ͻÿ�.
        ��, ������ ������� ����
        Alias�� ȸ����, ��ǰ��, �Ǹż���
        
        select (select mem_name
                    from member
                    where mem_id=cart_member) as ȸ����, 
                    (select prod_name
                      from prod
                      where prod_id = cart_prod) as ��ǰ��,
                      cart_qty as �Ǹż���
        from cart
        where cart_no like '200506%';
        
        
   /*����*/ ��) ������̺�(employees)���� �� ����� �μ��ڵ带 �������� �μ��� ����ӱ��� ���ϰ�
        �ڱⰡ ���� �μ��� ����ӱݺ��� ���� �ӱ��� �޴� ����� ��ȸ�Ͻÿ�.
        select (select 
        
        
        
        
        
        
        
            
            
            
            
            
            
            
            
            
            
            
            
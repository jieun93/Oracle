2020-01-20-02)subquery�� ����� DML(insert, update,delete)
��)�����μ�(parent_id)�� 90���� �μ�(60,70,100,110)�� ��ձ޿��� ����Ͽ� �׵� �μ��� ����
����� �޿��� ��� ��ձ޿��� �����Ͻÿ�.
1) �� �μ�(parent_id)�� 90���� �μ��� ��ձ޿�
select department_id,
        avg(salary)
   from employees a    
   where a.department_id in(��������)
   
   -��������: �����μ���(parent_id)�� 90���� �μ�
   select department_id
   from departments
   where pernt_id=90
   
   -����
  select department_id,
       round(avg(salary))
   from employees a    
   where a.department_id in(select department_id
                                from departments
                               where pernt_id=90)
    group by a.department_id;
    
    ---------
    select emp_name,salary,department_id
    from employees
    where department_id in (60,70,100,110);
    
 -�޿� update
 update employees a
    set a.salary=(select d.sal
                        from(select c.department_id as dept,
                                   round(avg(b.salary)) as sal
                                from employees b, departments c
                                where c.parent_id=90
                                    and b.department_id=c.department_id
                                group by c.department_id) d
                             where department_id=d.dept)
   where a.department_id in(select department_id
                               from departments
                               where parent_id=90);
                               
   rollback;
   select emp_name, department_id, salary
    from employees
    where department_id in (60,70,100,110);
                               
                               
                               
                                            
                                            
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
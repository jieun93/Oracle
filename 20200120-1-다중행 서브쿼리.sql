2020-01-20-01)������ ��������(���� ������ �Ѱ��̻�)

��)��ǰ���̺��� ��ǰ�� �з��ڵ尡 'p201'(����ĳ�־�)�� �ܰ�����
    �� ū �ܰ��� ������ �ִ� ��ǰ�� ��ȸ�Ͻÿ�.
    Alias�� ��ǰ�ڵ�, ��ǰ��, �з��ڵ�, �з���, �ǸŰ����̴�.
    
    (������)-- �з����̺�,��ǰ���̺�
    select a.prod_id as ��ǰ�ڵ�, 
           a.prod_name as ��ǰ��,
           b.lprod_gu as �з��ڵ�,--a.prod_lgu�� ����
           b.lprod_nm as �з���,
           a.prod_price as �ǸŰ���
     from prod a, lprod b
     where a.prod_lgu=lprod_gu
     --�ܼ�����
     and a.prod_price >=all (select prod_price--��������
                                from prod
                              where prod_lgu='P201');
     
     (��������)
     select min(prod_price)--��������
      from prod
      where prod_lgu='P201';
      
      
      (����)
      �� �μ��� ��ձ޿��� ����ϰ� �ڱ� �Ҽ� �μ��� ��� �޿����� �� ���� �޿��� �޴� ������� ��ȸ
      Alias�� �����ȣ, �����, �ҼӺμ���, �޿�
      
      (����)
      select a.employee_id as �����ȣ,
            a.emp_name as �����, 
            b.department_name as �ҼӺμ���,
            round(e.sal) as ��ձ޿�,
            a.salary as �޿�
        from employees a, departments b,(select department_id,
                                            round(avg(salary)) as sal
                                            from employees
                                            group by department_id) e
      where a.department_id=b.department_id
        and a.department_id=e.department_id --����� ���� ��ձ޿� �����°�
        and a.salary>=e.sal --����� �ް� �ִ� �����ϰ�  ��ձ޿��ϰ� ��
        order by 3;
      
    
            
      
      
      
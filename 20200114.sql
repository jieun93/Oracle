2020-01-14-01)null �����Լ�
1) is null, is not null
 - �÷��� ����� ���� null ������ ���θ� �Ǵ�
 - null��'='�� �� �Ұ���
 ��)������̺��� �μ��ڵ尡 null�� ����� ��ȸ�Ͻÿ�.
 select employee_id as �����ȣ,
        emp_name as  �����,
        department_id  as �μ��ڵ�,
        job_id as ��å�ڵ�,
        salary as �޿�
   from employees 
   --where department_id = null;
   where department_id is null;
   
   ��)������̺��� commission_pct(��������)�� null�� �ƴ� ����� ��ȸ�Ͻÿ�.
   select employee_id as  �����ȣ,
          emp_name as  �����,
          department_id as  �μ��ڵ�,
          commission_pct as ��������,
          salary as  �޿�
      from employees
      where commission_pct is not null;
      
      
    ��) ������̺��� ���������� ���� ���ʽ��� ����ϰ� ���޾��� ��ȸ�ϴ�
        ������ �ۼ��Ͻÿ�.
        ���޾�= ���� + ���ʽ�
        ���ʽ�= ����*��������*50%
        
        select  employee_id as �����ȣ,
                emp_name as  �����,
                salary as ���޿�,
                commission_pct as ��������,
                salary*commission_pct*0.5 as ���ʽ�,
                salary+(salary*commission_pct*0.5) as ���޾�
         from employees;  
         
 2)NVL
 - �Ű������� ���ǵ� �÷� ���� 'null'���� �Ǵ��Ͽ� Ư����(���ǵ�) ���� ��ȯ
 (�������)
 NVL(c,v)
 .'c'�� ����� ���� 'null'�̸� 'v' ���� ��ȯ�ϰ�, 'null'�� �ƴϸ� 'c'�� �����
  ���� ��ȯ
  
         select employee_id as �����ȣ,
                emp_name as  �����,
                salary as ���޿�,
                commission_pct as ��������,
                salary*nvl(commission_pct,0)*0.5 as ���ʽ�,--���� null�ΰ��� 0�� ����Ѵ�.
                salary+nvl((salary*commission_pct*0.5),0) as ���޾�-- �÷����� ��ü�� ���� nvl�� �ٿ��� �ȴ�.
         from employees;  
        
 3)NVL2
    .���ǵ� �÷����� 'null'���ο� ���� ���� �ٸ� ���� ��ȯ
    (�������)
    nvl2 (c,v1,v2)
    .'c'�� ����� ���� 'null'�� �ƴϸ� 'v1'�� ��ȯ�ϰ�, 'null'�̸� 'v2'�� ��ȯ
    
    ��) ��ǰ���̺��� ��ǰ�� ����(prod_color)�� 'null'�̸� '�������� ����'�� ����Ͻÿ�,
    
    select  prod_id as ��ǰ�ڵ�,
            prod_name as  ��ǰ��,
            prod_color as "��ǰ�� ����"
    from    prod;
        
(NVL�Լ��� ����)
     select prod_id as ��ǰ�ڵ�,
            prod_name as  ��ǰ��,
            nvl(prod_color,'�������� ����') as "��ǰ�� ����"
    from    prod;
    
  update member
    set mem_like=null
  where mem_like='���'
  
  ��) ȸ�����̺��� ��̰� null�̸� '��̾���',null�� �ƴϸ� '�������'��
        ����Ͽ� ȸ�������� ��ȸ�Ͻÿ�.
        
        select mem_id ȸ����ȣ,
               mem_name as  ȸ����,
               mem_like as ���,
               nvl2(mem_like, '�������','��̾���')
          from member;
          
        
2019-12-27-01)�����Լ�
2)ROUND, TRUNC
    - �����ڷ��� �ݿø��� ���� ��� ����
    (�������)
    ROUND(c, n),TRUNC(c, n)
    . c�� ����� ���� �Ҽ��� ������ ��� n+1�ڸ����� �ݿø�(����)�Ͽ� n�ڸ����� ��ȯ
    . n�� ������ ��� �����κ� n�ڸ����� �ݿø�(����)�Ͽ� ��� ��ȯ
    
    
    update employees
        set salary = salary+(salary*0.13);
        
    ��)������̺�(employees)���� ������� �޿��� �ֱ����� ����Ͽ� ����� ����Ͻÿ�.
        �� ���޿����� �Ҽ��� 2�ڸ����� �ݿø��Ͻÿ�.
        Alias�� 
        
        select employee_id as �����ȣ, 
                emp_name as �����, 
                salary as �޿�,
                round(salary/4,1) as �ֱ޾�1,
                round(salary/4,0) as �ֱ޾�2,
                round(salary/4) as �ֱ޾�3,
                round(salary/4,-1) as �ֱ޾�
             
       from employees;   
             
    ����] ������̺��� ���ʽ��� ����Ͽ� ���ɾ��� ����Ͻÿ�.
            ���ʽ� = �޿� * ��������(commission_pct)
            ���ɾ� = �޿� + ���ʽ� �̸� �����κи� ��Ÿ���ÿ�.
            Alias�� �����ȣ, �����, �޿�, ��������, ���ʽ�, ���ɾ�
            
            
            select employee_id as �����ȣ,
                    emp_name as �����,
                    salary as �޿�,
                    commission_pct as ��������,
                    nvl(salary*commission_pct,0) as ���ʽ�,--������ �ƴѻ���� nulló���Ǵ°��� �������� nvl�� ����Ѵ�.
                    round(salary+nvl(salary*commission_pct,0)) as ���ɾ�
                    
           from employees;
                    
             
             ��)������̺��� �μ���/*�׷�*/ ������� ��ձ޿��� �Ҽ��� 2�ڸ����� ����Ͽ� ����Ͻÿ�.
             (�μ���ȣ ������)/*��������� �׷�->����,�������̴� ���帶������ �־�� �ϴ� �׸�*/
             Alias�� �μ���ȣ, ��ձ޿�
             
             select department_id as �μ���ȣ,
                    round(avg(salary)) as ��ձ޿�1,
                    trunc/*�Ҽ��� ���θ� ���Ŷ� ����,�����κи� ��½� ���*/(avg(salary)) as ��ձ޿�2
             from employees
             group by  department_id
            -- order by department_id;
            -- order by ��ձ޿� �Ǵ� [select���� �÷���|�÷� index] desc;
             
             order by 2 desc;
             
             
             
             ��)������̺��� �μ��� ������� ��ձ޿��� �Ҽ��� 2�ڸ����� ����Ͽ� ����Ͻÿ�.
             (�μ���ȣ ������)
              Alias�� �μ���ȣ, �μ���, ��ձ޿�
              
              
         select a.department_id as �μ���ȣ,
                b.department_name as �μ���,
                round(avg(a.salary)) as ��ձ޿�1,
                trunc(avg(a.salary)) as ��ձ޿�2
        from employees a, departments b
        where a.department_id=b.department_id
        group by  a.department_id,b.department_name;
        
        (���̺� ��Ī)
        
        
        
 4)FLOOR, CEIL
 - ����� �������� ��ȯ ���� �� ���
    (1)FLOOR(n)
        . n�� ���ų� ������ �� n �� ���� ����� ���� 
    (2)CEIL(n) 
        . n�� ���ų� ū�� �� n �� ���� ����� ����
        
    SELECT  FLOOR(10.4),
            FLOOR(10),
            FLOOR(-10.4),
            CEIL(10.4),
            CEIL(10),
            CEIL(-10.4)
    FROM DUAL;        
    
    
   5) MOD, REMAINDER
    - �������� ��ȯ
    - MOD(c, n), REMINDER(c, n)
        . C�� ���� n���� ���� ������ ��ȯ
        . MOD : c - (n*floor(c/n))/*�������������ϴ°�*/
        . REMAINDER : c-(n*ROUND(c/n))/**/
    ��) 13�� 3���� ���� ������
        MOD(13,3) : 13 - 3*floor(13/3)
                  = 13 - 3*floor(4.33333)
                  = 13 - 3 * 4 = 13 - 12 = 1
                                    
       REMAINDER(13,3) : 13 -3 * ROUND(13/3)
                    = 13 - 3 * ROUND(4.333333)
                    = 1
   ��) 14�� 3���� ���� ������
      MOD(14,3) : 14 - 3*floor(14/3)
                  = 14 - 3*floor(4.66666)
                  = 14 - 3 * 4 => 14 - 12 => 2
                                    
       REMAINDER(14,3) : 14 -3 * ROUND(14/3)
                    = 14 - 3 * ROUND(4.6666666)= 14-3*5
                    = -1
                    
                    
                    
    SELECT MOD(113,21), REMAINDER (113,21),
           MOD(149,23), REMAINDER (149,23)
    FROM DUAL;
    
    
    SELECT CASE WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=0 THEN'�Ͽ���'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=1 THEN'������'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=2 THEN'ȭ����'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=3 THEN'������'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=4 THEN'�����'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=5 THEN'�ݿ���'
                ELSE '�����' END "����"
                
       FROM DUAL;
       
       SELECT (SYSDATE- TO_DATE('00010101','YYYYMMDD')) FROM DUAL;
       
       
   6)WIDTH_BUCKET
    - ������ ������ ���ǵ� ���� ���ѱ����� INDEX ���� ��ȯ
    (�������)
    WIDTH_BUCKET(c, min, max,n)
    . c : �񱳴���� �� �Ǵ� ���� ����� �÷���
    . min : ������ ���� ��
    . max : ������ ���� ��
    . n : ������ ����
  
   ��)
   select width_bucket(10, 0, 100, 10) from dual;
                
   ��) ȸ�����̺��� ���ϸ����� 1-10000���̸� 10���� �������� ������
      �� ȸ���� ������ ���ϸ�����  ���� ����� �ο��Ͻÿ�. �� ���� ���ϸ��� ���� ����� �ο��Ͻÿ�.
      (ex) 8000����Ʈ�� 3 ���, 5 ����Ʈ�� 10���....)
      Alias�� ȸ����ȣ, ȸ����, ���ϸ���, ���
      
      select  mem_id as ȸ����ȣ,
              mem_name as ȸ����, 
              mem_mileage as ���ϸ���,
              10-width_bucket (mem_mileage, 0,10000,5) as ���1,
              width_bucket (mem_mileage, 10000,1,5) as ���2
     from member;
     
     
     
     ��) ������̺��� ������� �޿��� 3���� ������� �����ϰ� 
        ��޿� ���� 1����̸� '�� �ӱݱ�'
                  2����̸� '����� �ӱݱ�'
                  3����̸� ' �� �ӱݱ�'�� ����� ����ϴ� ���� �ۼ�
         Alias�� �����ȣ, �����, ��å�ڵ�, �޿�, ���, ����̸�
         �ӱ��� ���Ѱ��� 2000, ���Ѱ��� 30000�̴�.
      
       select employee_id as  �����ȣ,
              emp_name as �����, 
              job_id as ��å�ڵ�, 
              salary as �޿�,
              width_bucket (salary,2000,30000,3)||'���' as ���,
              case when  width_bucket (salary,2000,20000,3) =1 then '�� �ӱݱ�'
                   when  width_bucket (salary,2000,20000,3) =2 then '����� �ӱݱ�'
                   else '�� �ӱݱ�' end as ���
              from employees;     
    
    
    
    
    
    
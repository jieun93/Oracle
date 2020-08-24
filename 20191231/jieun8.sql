2019-12-31-01)��¥�� �Լ�

1)SYSDAE
 - �ý��ۿ��� �����ϴ� ��¥���� ��ȯ
 - ������ ���� ����(����� ������ �ϼ��� ���� ��¥, ������ �ϼ�)
 
 ��)
 SELECT SYSDATE AS "���� �ð�",
        SYSDATE - 30 "�� �� �� ��¥",
        SYSDATE + 30 "�� �� �� ��¥",
        SYSDATE - TO_DATE('20100810')
    FROM DUAL;
    
    
  **�ý����� �����ϴ� �ð� �������� �ʿ��� ���(��,��,�ð� ��)�� ������ ���:
    EXTRACT �Լ� ���  
 
 
 ��) ������̺��� �Ի�����(HIRE_DATE)�� �̿��Ͽ� 15�� �̻� �ټ��� ����� ��ȸ�Ͻÿ�.
     Alias�� �����ȣ, �����, �Ի���, �ټӳ��
     
     
     SELECT EMPLOYEE_ID AS �����ȣ, 
            EMP_NAME AS �����,
            HIRE_DATE AS �Ի���,
            EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM HIRE_DATE) AS �ټӳ��
     FROM EMPLOYEES
     WHERE  EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM HIRE_DATE)>=15
     AND    RETIRE_DATE IS NULL;
     

SELECT * FROM EMPLOYEES
 WHERE RETIRE_DATE IS NULL;
 /*NULL�� = ���� ���Ҽ�����. IS�� ����Ͽ� ���ؾ��Ѵ�.*/
 
 
 2) MONTHS_BETWEEN
    -�Ű������� ������ �� ��¥ ������ �޼��� ��ȯ
    (�������)
    MONTHS_BETWEEN(d1, d2)
    .d1,d2�� ��¥ Ÿ���� �ڷ� �̾�� ��
��)ȸ�����̺��� ���� ��¥�� �������� ȸ������ ���̸� �� ������ ��Ÿ���ÿ�.
    ���� �Ҽ� 1�ڸ����� �ݿø� �Ͻÿ�.
    Alias�� ȸ����ȣ, �̸�, �������, ������
    
    select mem_id as ȸ����ȣ,
           mem_name as �̸�,
           mem_bir as �������,
           round(months_between(sysdate,mem_bir)) as ������
    FROM member;
 
 
 select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from member;
 
 3) EXTRACT
  - ��¥�ڷῡ�� �ʿ��� ��� (��, ��, ��, ��, ��,��)�� ����
  (�������)
  EXTRACT(fmt FROM d1)
  . 'fmt'�� �ʿ��� ��Ҹ� ��Ÿ���� �ܾ�(YEAR, MONTH, DAY, HOUR, MINUTE, SECOND)
  . d1�� ��¥�� �ڷ�
  . ����� ���������� ��ȯ
  
  
  ��) ������̺��� 7���� �Ի��� ��������� ��ȸ�Ͻÿ�.
     Alias�� �����ȣ, �����, �Ի���, �޿�
     
     select employee_id as �����ȣ,
            emp_name as �����,
            hire_date as �Ի���,
            salary as �޿�
            
         from employees 
         where extract(month from hire_date)=7;
            
 
 ��) ȸ�����̺��� �̹��� ������ ȸ�������� �����Ͻÿ�.
    Alias�� ȸ����ȣ, ȸ����, �������, ���ϸ���
    
    select mem_id as  ȸ����ȣ,
            mem_name as  ȸ����,
            mem_mileage as ���ϸ���,
            mem_bir as �������
            
    from member
    where extract(month from mem_bir) = extract(month from sysdate);
 
 
 4)ADD_MONTHS
    - �־��� ��¥ �ڷῡ�� ���ǵ� �� ��ŭ�� ���� ���� ��¥�� ��ȯ
    (�������)
    ADD_MONTHS(d1, n)
    .d1�� ��¥ ����
    .n�� ������ ���� �� 
    
    ��)
    select add_months(sysdate,3) from dual;
 
    ��) ȸ�����̺��� ���� ���� �޼����� 3������ �߼��Ϸ��Ѵ�,
        ���÷� ���� 3���� ���� 3���� ������ ����� ȸ���� ã�� ���� �߼����� ��ȸ�Ͻÿ�.
        Alias�� ȸ����ȣ, ȸ����, ����, ���ڹ߼���
        
        select  mem_id as  ȸ����ȣ,
                mem_name as ȸ����,
                extract(month from mem_bir) ||'�� ' ||
                    extract(day from mem_bir) ||'��' as  ����,
                to_date(to_char(extract(year from sysdate))||
                to_char(extract(month from mem_bir),'99')||
                to_char(extract(day from mem_bir),'99'))-3 as ���ڹ߼���
                
        from member
        where extract(month from mem_bir) = extract(month from add_months(sysdate,3));
 
 select add_months (sysdate,8) from dual;
 
 
 
 5)LAST_DAY
    -�־��� ��¥�� �ش� ���� ���������� ��ȯ
    (�������)
    LAST_DAY(d1)
    . d1 ��¥�� ���Ե� ���� ������ ���� ��ȯ
    
    
    select last_day(to_date('20000910'))from dual;
 
 
 6)NEXT_DAY
    - �Ű������� ��Ÿ���� �ִ� ��¥ ���� �־��� ������ ���� ���� ��¥ ��ȯ
    (�������)
    NEXT_DAY(d1, c1)
    . d1 �� ��������
    . c1 �� ���Ϸ��� ������ ǥ���ϴ� ���ڿ�(������,ȭ����...�Ͽ���)
    
    ��)
    select next_day(to_date('20180705'),'ȭ����')from dual
    
    
    
    
    
    
 
 
 
 
 
 
 
 
 
 
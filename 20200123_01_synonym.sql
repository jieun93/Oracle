2020-01-23-01)synonym(���Ǿ�) ��ü
  - ����Ŭ ��ü�� ������ �̸��� �ο�
  - �ٸ� �������� ���̺� �����ϴ� ��� '��Ű����.���̺��'������ ���ϱ� ������
    ������������ ��������->�̸� ������ �����ϱ� ���� �ַ� ���
  
  select * from [ip.�����ڰ�����.]lprod;
  (�������)
  create [or replace][public] synonym ���Ǿ��
    for ��ü��;
    . public  : ���� ���Ǿ� 
    . '��ü��' : ���Ǿ� �ο� ��� ��ü �̸�
    
��)
    create or replace synonym emp for employees;
    
    select emp_name, salary, department_id
      from  emp;
   /* Student s1 = new Student();
    Student s2 = s1;*/
  
   select emp_name, salary, department_id
      from  employees kbs;
      
   select sysdate from dual; --�ý��۰����� ����ڿ��� �Ѿ�°�
   
   create or replace synonym d1 for sys.dual; --Synonym D1��(��) �����Ǿ����ϴ�.
   
   select to_char(sysdate,'yyyy-mm-dd am hh24:mi:ss') from d1; --��ü�� �̸��� �ο��� �ؼ� �����
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
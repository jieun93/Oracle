2019-12-31-02)��ȯ�Լ�
- �������� ���� ������ġ���� �ӽ÷� �� ��ȯ
- ���������� �Լ��� ��ȯ������ �ʴ´�.
- cast, TO_DATE, to_char, to_number(���ڿ��� ���ڷ� �ٲ��ִ°�)

1)CAST
    -�־��� �ڷḦ ���ǵ� Ÿ������ ����ȯ
    (�������)
    CAST(EXPR AS Ÿ��)
    .'EXPR'�� ���ǵ� �ڷḦ 'Ÿ��'���� ��ȯ
    ��)
    SELECT CAST (1234 AS CHAR(8)) FROM DUAL;
    
    ��) ������̺��� ������� CHAR(50)���� ��ȯ�Ͽ� ����Ͻÿ�.
    Alias �� �����ȣ, �����, ��ȭ��ȣ�̴�.
    
    select employee_id||' '||emp_name||' '||phone_number,   
           employee_id||' '||cast(emp_name as char(30))||' '||phone_number
      from employees;        
    
    
    ��)��ٱ��� ���̺�(cart)���� ��ٱ��Ϲ�ȣ�� ��¥�� ������ �� ���� ������(3�� ��)�� ��ȸ�Ͻÿ�
        (2005�� 4�� 1 ~ 10�� �ڷḸ �˻�)
        Alias�� ȸ����ȣ, ��ٱ��Ϲ�ȣ, ������, ����������
        
        select cart_member as ȸ����ȣ, 
               cart_no as ��ٱ��Ϲ�ȣ, 
               cast(substr(cart_no,1,8) as date) as  ������,/*to_date(substr(cart_no,1,8)) as ������*/
               cast(substr(cart_no,1,8) as date) + 3 as  ����������
         from cart
         where substr(cart_no,1,8 )>='20050401' and substr(cart_no,1,8 )<='20050410';
       --  where substr(cart_no,1,8 )between '20050401' and '20050410';
    
  2)to_char
  - ����, ���ڿ�, ��¥ ������ �ڷḦ ���ڿ� �ڷ�� ��ȯ
  - ���� ���ڿ��� �����Ͽ� format�� ������ ����� ��ȯ
  (�������)
 to_char(c1 [,fmt])
    .'fmt'�� ����ϰ��� �ϴ� ������ �����ϴ� �������� ���ڿ�
    .c1�� ���ڿ��� ��� char, clob Ÿ���� varchar2 �������� ��ȯ
    
    
   ** ��¥ ���� ���� ���ڿ�
   ----------------------------------------------------
    ���Ĺ��ڿ�                          �� ��                           
   ----------------------------------------------------    
   AD,CC,BC                           �����/��
   YYYY,YYY,YY,Y                      �⵵
   Q                                  �б�
   MONTH, MON,MM,RM                   ��
   W, WW, IW                          ��
   DD,DDD,J                           ��
   DAY, DY, D                         ����
   AM, PM, A.M.,P.M.                  ����/����
   HH, HH12,HH24                      �ð� 
   MI                                ��
   SS,SSSSS                          ��
   "  "                              ���������
   -----------------------------------------------------
    
    
    SELECT TO_CHAR(SYSDATE,'HH"��" MI"��"' )FROM DUAL;
    
    
    
    
    
    
    
    
    
    
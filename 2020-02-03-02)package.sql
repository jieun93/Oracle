2020-02-03-02)PACKAGE
  - ���õ� ������ �ϳ��� ���� ó��
  - �������� ����, Ŀ��, �Լ�, ���ν��� ���� �ϳ��� ���ȭ �Ͽ� ó��
  - ���ȭ, ���α׷� ������ ���̼�, ĸ��ȭ, ȿ������ ���� ����
(�Ϲݻ������)

CREATE [OR REPLACE] PACKAGE ��Ű����
IS 
[���/����/Ŀ�� ����;]

  FUNCTION �Լ���[(�Ű�����LIST)]
    RETURN ��ȯŸ��
       :
  PROCEDURE ���ν����� [(�Ű�����LIST)]

END ��Ű����;

(��Ű�� ���� �������)
CREATE OR REPLACE PACKAGE BODY ��Ű����
IS
  ����/���/Ŀ�� ����;
  
  FUNCTION �Լ���[(�Ű�����LIST)]
    RETURN ��ȯŸ��
  BEGIN
  
  END �Լ���;
  
  PROCEDURE ���ν�����[(�Ű�����)]

  BEGIN

  END ���ν�����;

        :
END ��Ű����;

��) �����ȣ�� �Է¹޾� �̸��� ����ϴ� �Լ�, --fn_get_emp_name
    �űԻ���� ����ϴ� ���ν���, --new_emp_proc
    ����� ����� ó���ϴ� ���ν��� --retire_emp_proc
    ���� ������ ó���� �� �ֵ��� ��Ű��(hr_pkg)�� �����Ͻÿ�
    
(hr_pkg �����)
CREATE OR REPLACE PACKAGE HR_PKG 
IS
  FUNCTION FN_GET_EMP_NAME(P_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE) --Ÿ������O, ũ������X
    RETURN EMPLOYEES.EMP_NAME%TYPE;
    
  PROCEDURE NEW_EMP_PROC(P_EMP_NAME VARCHAR2, P_HIRE_DATE VARCHAR2);
  
  PROCEDURE RETIRE_EMP_PROC(P_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE);
END HR_PKG;

(PACKAGE�� BODY)
CREATE OR REPLACE PACKAGE BODY HR_PKG
IS
  FUNCTION FN_GET_EMP_NAME(P_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE)
    RETURN EMPLOYEES.EMP_NAME%TYP
  IS
    V_NAME EMPLOYEES.EMP_NAME%TYPE;
  BEGIN
    SELECT EMP_NAME INTO V_NAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID=P_EMP_ID;
     
    RETURN VNL(V_NAME, '�ش� ������� ����');
    END FN_GET_
    
  PROCEDURE NEW_EMP_PROC(P_EMP_VARCHAR2, P_HIRE_DATE DATE);
  IS
    V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    V_DATE DATE:=TO_DATE(P_HIRE_DATE);
  BEGIN
    SELECT NVL(MAX(EMPLOYEE_ID),0)+1 INTO V_EMP_ID
      FROM EMPLOYEES;
    INSERT INTO EMPLOYEES(EMPLOYEE_ID, EMP_NAME, HIRE_DATE, CREATE_DATE,UP_DATE_DATE)
      VALUES(V_EMP_ID, P_EMP_NAME, V_DATE,SYSDATE,SYSDATE);
      
      EXCEPTION
        WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('���ܹ߻� : '||SQLERRM);
           ROLLBACK;
     END NEW_EMP_PROC;      
      
      
      PROCEDURE RETIRE_EMP_PROC(P_EMP_ID  EMPLOYEES.EMPLOYEE_ID%TYPE)
      IS
        V_CNT NUMBER:=0;
      BEGIN
       UPDATE EMPLOYEES
         SET  RETIRE_DATE= SYSDATE
        WHERE EMPLOYEE_ID= 
     END RETIRE_EMP_PROC;    
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
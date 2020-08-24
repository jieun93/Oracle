2020-02-03-02)PACKAGE
  - 관련된 업무를 하나로 묶어 처리
  - 복수개의 변수, 커서, 함수, 프로시저 등을 하나로 모듈화 하여 처리
  - 모듈화, 프로그램 설계의 용이성, 캡슐화, 효율적인 성능 제공
(일반사용형식)

CREATE [OR REPLACE] PACKAGE 패키지명
IS 
[상수/변수/커서 선언문;]

  FUNCTION 함수명[(매개변수LIST)]
    RETURN 반환타입
       :
  PROCEDURE 프로시저명 [(매개변수LIST)]

END 패키지명;

(패키지 본문 사용형식)
CREATE OR REPLACE PACKAGE BODY 패키지명
IS
  변수/상수/커서 선언;
  
  FUNCTION 함수명[(매개변수LIST)]
    RETURN 반환타입
  BEGIN
  
  END 함수명;
  
  PROCEDURE 프로시저명[(매개변수)]

  BEGIN

  END 프로시저명;

        :
END 패키지명;

예) 사원번호를 입력받아 이름을 출력하는 함수, --fn_get_emp_name
    신규사원을 등록하는 프로시저, --new_emp_proc
    퇴사한 사원을 처리하는 프로시저 --retire_emp_proc
    위의 업무를 처리할 수 있도록 패키지(hr_pkg)를 구성하시오
    
(hr_pkg 선언부)
CREATE OR REPLACE PACKAGE HR_PKG 
IS
  FUNCTION FN_GET_EMP_NAME(P_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE) --타입지정O, 크기지정X
    RETURN EMPLOYEES.EMP_NAME%TYPE;
    
  PROCEDURE NEW_EMP_PROC(P_EMP_NAME VARCHAR2, P_HIRE_DATE VARCHAR2);
  
  PROCEDURE RETIRE_EMP_PROC(P_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE);
END HR_PKG;

(PACKAGE의 BODY)
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
     
    RETURN VNL(V_NAME, '해당 사원정보 없음');
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
          DBMS_OUTPUT.PUT_LINE('예외발생 : '||SQLERRM);
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
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
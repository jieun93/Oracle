2020-01-23-01)synonym(동의어) 객체
  - 오라클 객체에 별도의 이름을 부여
  - 다른 소유자의 테이블에 접근하는 경우 '스키마명.테이블명'형식을 취하기 때문에
    접근지정명이 복잡해짐->이를 간단히 지정하기 위해 주로 사용
  
  select * from [ip.소유자계정명.]lprod;
  (사용형식)
  create [or replace][public] synonym 동의어명
    for 객체명;
    . public  : 공개 동의어 
    . '객체명' : 동의어 부여 대상 객체 이름
    
예)
    create or replace synonym emp for employees;
    
    select emp_name, salary, department_id
      from  emp;
   /* Student s1 = new Student();
    Student s2 = s1;*/
  
   select emp_name, salary, department_id
      from  employees kbs;
      
   select sysdate from dual; --시스템개정이 사용자에게 넘어가는거
   
   create or replace synonym d1 for sys.dual; --Synonym D1이(가) 생성되었습니다.
   
   select to_char(sysdate,'yyyy-mm-dd am hh24:mi:ss') from d1; --객체에 이름이 부여를 해서 만든거
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
2019-12-31-01)날짜형 함수

1)SYSDAE
 - 시스템에서 제공하는 날짜정보 반환
 - 덧셈과 뺄셈 가능(결과는 덧셈으 일수를 더한 날짜, 뺄셈은 일수)
 
 예)
 SELECT SYSDATE AS "현재 시각",
        SYSDATE - 30 "한 달 전 날짜",
        SYSDATE + 30 "한 달 후 날짜",
        SYSDATE - TO_DATE('20100810')
    FROM DUAL;
    
    
  **시스템이 제공하는 시각 정보에서 필요한 요소(날,년,시간 등)를 추출할 경우:
    EXTRACT 함수 사용  
 
 
 예) 사원테이블에서 입사일자(HIRE_DATE)를 이용하여 15년 이상 근속한 사원을 조회하시오.
     Alias는 사원번호, 사원명, 입사일, 근속년수
     
     
     SELECT EMPLOYEE_ID AS 사원번호, 
            EMP_NAME AS 사원명,
            HIRE_DATE AS 입사일,
            EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM HIRE_DATE) AS 근속년수
     FROM EMPLOYEES
     WHERE  EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM HIRE_DATE)>=15
     AND    RETIRE_DATE IS NULL;
     

SELECT * FROM EMPLOYEES
 WHERE RETIRE_DATE IS NULL;
 /*NULL은 = 으로 비교할수없다. IS를 사용하여 비교해야한다.*/
 
 
 2) MONTHS_BETWEEN
    -매개변수로 제공된 두 날짜 사이의 달수를 반환
    (사용형식)
    MONTHS_BETWEEN(d1, d2)
    .d1,d2는 날짜 타입의 자료 이어야 함
예)회원테이블에서 오늘 날짜를 기준으로 회원들의 나이를 월 단위로 나타내시오.
    월은 소수 1자리에서 반올림 하시오.
    Alias는 회원번호, 이름, 생년월일, 개월수
    
    select mem_id as 회원번호,
           mem_name as 이름,
           mem_bir as 생년월일,
           round(months_between(sysdate,mem_bir)) as 개월수
    FROM member;
 
 
 select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from member;
 
 3) EXTRACT
  - 날짜자료에서 필요한 요소 (년, 월, 일, 시, 분,초)를 추출
  (사용형식)
  EXTRACT(fmt FROM d1)
  . 'fmt'는 필요한 요소를 나타내는 단어(YEAR, MONTH, DAY, HOUR, MINUTE, SECOND)
  . d1은 날짜형 자료
  . 결과는 숫자형으로 반환
  
  
  예) 사원테이블에서 7월에 입사한 사원정보를 조회하시오.
     Alias는 사원번호, 사원명, 입사일, 급여
     
     select employee_id as 사원번호,
            emp_name as 사원명,
            hire_date as 입사일,
            salary as 급여
            
         from employees 
         where extract(month from hire_date)=7;
            
 
 예) 회원테이블에서 이번달 생일인 회원정보를 추출하시오.
    Alias는 회원번호, 회원명, 생년월일, 마일리지
    
    select mem_id as  회원번호,
            mem_name as  회원명,
            mem_mileage as 마일리지,
            mem_bir as 생년월일
            
    from member
    where extract(month from mem_bir) = extract(month from sysdate);
 
 
 4)ADD_MONTHS
    - 주어진 날짜 자료에서 정의된 값 만큼의 월을 더한 날짜를 반환
    (사용형식)
    ADD_MONTHS(d1, n)
    .d1은 날짜 정보
    .n은 더해줄 개월 수 
    
    예)
    select add_months(sysdate,3) from dual;
 
    예) 회원테이블에서 생일 축하 메세지를 3일전에 발송하려한다,
        오늘로 부터 3개월 후인 3월에 생일인 사람인 회원을 찾아 문자 발송일을 조회하시오.
        Alias는 회원번호, 회원명, 생일, 문자발송일
        
        select  mem_id as  회원번호,
                mem_name as 회원명,
                extract(month from mem_bir) ||'월 ' ||
                    extract(day from mem_bir) ||'일' as  생일,
                to_date(to_char(extract(year from sysdate))||
                to_char(extract(month from mem_bir),'99')||
                to_char(extract(day from mem_bir),'99'))-3 as 문자발송일
                
        from member
        where extract(month from mem_bir) = extract(month from add_months(sysdate,3));
 
 select add_months (sysdate,8) from dual;
 
 
 
 5)LAST_DAY
    -주어진 날짜의 해당 월의 마지막일을 반환
    (사용형식)
    LAST_DAY(d1)
    . d1 날짜에 포함된 월의 마지막 일자 반환
    
    
    select last_day(to_date('20000910'))from dual;
 
 
 6)NEXT_DAY
    - 매개변수가 나타내고 있는 날짜 이후 주어진 요일의 가장 빠른 날짜 반환
    (사용형식)
    NEXT_DAY(d1, c1)
    . d1 은 기준일자
    . c1 은 구하려는 요일을 표현하는 문자열(월요일,화요일...일요일)
    
    예)
    select next_day(to_date('20180705'),'화요일')from dual
    
    
    
    
    
    
 
 
 
 
 
 
 
 
 
 
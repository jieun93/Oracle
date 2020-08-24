2019-12-27-01)숫자함수
2)ROUND, TRUNC
    - 숫자자료의 반올림과 절삭 기능 수행
    (사용형식)
    ROUND(c, n),TRUNC(c, n)
    . c에 저장된 값을 소수점 이하인 경우 n+1자리에서 반올림(절삭)하여 n자리까지 반환
    . n이 음수인 경우 정수부분 n자리에서 반올림(절삭)하여 결과 반환
    
    
    update employees
        set salary = salary+(salary*0.13);
        
    예)사원테이블(employees)에서 사원들의 급여를 주급으로 계산하여 결과를 출력하시오.
        단 월급여액은 소숫점 2자리에서 반올림하시오.
        Alias는 
        
        select employee_id as 사원번호, 
                emp_name as 사원명, 
                salary as 급여,
                round(salary/4,1) as 주급액1,
                round(salary/4,0) as 주급액2,
                round(salary/4) as 주급액3,
                round(salary/4,-1) as 주급액
             
       from employees;   
             
    문제] 사원테이블에서 보너스를 계사하여 수령액을 계산하시오.
            보너스 = 급여 * 영업실적(commission_pct)
            수령액 = 급여 + 보너스 이며 정수부분만 나타내시오.
            Alias는 사원번호, 사원명, 급여, 영업실적, 보너스, 수령액
            
            
            select employee_id as 사원번호,
                    emp_name as 사원명,
                    salary as 급여,
                    commission_pct as 영업실적,
                    nvl(salary*commission_pct,0) as 보너스,--영업이 아닌사람은 null처리되는것을 막기위해 nvl를 사용한다.
                    round(salary+nvl(salary*commission_pct,0)) as 수령액
                    
           from employees;
                    
             
             예)사원테이블에서 부서별/*그룹*/ 사원들의 평균급여를 소수점 2자리까지 계산하여 출력하시오.
             (부서번호 순으로)/*기술순서는 그룸->오더,오더바이는 가장마지막에 넣어야 하는 항목*/
             Alias는 부서번호, 평균급여
             
             select department_id as 부서번호,
                    round(avg(salary)) as 평균급여1,
                    trunc/*소수점 제로를 쓴거랑 동일,정수부분만 출력시 사용*/(avg(salary)) as 평균급여2
             from employees
             group by  department_id
            -- order by department_id;
            -- order by 평균급여 또는 [select절의 컬럼명|컬럼 index] desc;
             
             order by 2 desc;
             
             
             
             예)사원테이블에서 부서별 사원들의 평균급여를 소수점 2자리까지 계산하여 출력하시오.
             (부서번호 순으로)
              Alias는 부서번호, 부서명, 평균급여
              
              
         select a.department_id as 부서번호,
                b.department_name as 부서명,
                round(avg(a.salary)) as 평균급여1,
                trunc(avg(a.salary)) as 평균급여2
        from employees a, departments b
        where a.department_id=b.department_id
        group by  a.department_id,b.department_name;
        
        (테이블 별칭)
        
        
        
 4)FLOOR, CEIL
 - 가까운 정수값을 반환 받을 때 사용
    (1)FLOOR(n)
        . n과 같거나 작은수 중 n 에 가장 가까운 정수 
    (2)CEIL(n) 
        . n과 같거나 큰수 중 n 에 가장 가까운 정수
        
    SELECT  FLOOR(10.4),
            FLOOR(10),
            FLOOR(-10.4),
            CEIL(10.4),
            CEIL(10),
            CEIL(-10.4)
    FROM DUAL;        
    
    
   5) MOD, REMAINDER
    - 나머지를 반환
    - MOD(c, n), REMINDER(c, n)
        . C의 값을 n으로 나눈 나머지 반환
        . MOD : c - (n*floor(c/n))/*나머지값을구하는거*/
        . REMAINDER : c-(n*ROUND(c/n))/**/
    예) 13을 3으로 나눈 나머지
        MOD(13,3) : 13 - 3*floor(13/3)
                  = 13 - 3*floor(4.33333)
                  = 13 - 3 * 4 = 13 - 12 = 1
                                    
       REMAINDER(13,3) : 13 -3 * ROUND(13/3)
                    = 13 - 3 * ROUND(4.333333)
                    = 1
   예) 14를 3으로 나눈 나머지
      MOD(14,3) : 14 - 3*floor(14/3)
                  = 14 - 3*floor(4.66666)
                  = 14 - 3 * 4 => 14 - 12 => 2
                                    
       REMAINDER(14,3) : 14 -3 * ROUND(14/3)
                    = 14 - 3 * ROUND(4.6666666)= 14-3*5
                    = -1
                    
                    
                    
    SELECT MOD(113,21), REMAINDER (113,21),
           MOD(149,23), REMAINDER (149,23)
    FROM DUAL;
    
    
    SELECT CASE WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=0 THEN'일요일'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=1 THEN'월요일'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=2 THEN'화요일'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=3 THEN'수요일'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=4 THEN'목요일'
                WHEN TRUNC( MOD(SYSDATE-TO_DATE('00010101','YYYYMMDD'),7)-1)=5 THEN'금요일'
                ELSE '토요일' END "요일"
                
       FROM DUAL;
       
       SELECT (SYSDATE- TO_DATE('00010101','YYYYMMDD')) FROM DUAL;
       
       
   6)WIDTH_BUCKET
    - 설정된 구간에 정의된 값이 속한구간의 INDEX 값을 반환
    (사용형식)
    WIDTH_BUCKET(c, min, max,n)
    . c : 비교대상의 값 또는 값이 저장된 컬럼명
    . min : 구간의 하한 값
    . max : 구간의 상한 값
    . n : 구간의 개수
  
   예)
   select width_bucket(10, 0, 100, 10) from dual;
                
   예) 회원테이블에서 마일리지를 1-10000사이를 10개의 구간으로 나누고
      각 회원이 보유한 마일리지에  따라 등급을 부여하시오. 단 많은 마일리지 부터 등급을 부여하시오.
      (ex) 8000포인트는 3 등급, 5 포인트는 10등급....)
      Alias는 회원번호, 회원명, 마일리지, 등급
      
      select  mem_id as 회원번호,
              mem_name as 회원명, 
              mem_mileage as 마일리지,
              10-width_bucket (mem_mileage, 0,10000,5) as 등급1,
              width_bucket (mem_mileage, 10000,1,5) as 등급2
     from member;
     
     
     
     예) 사원테이블에서 사원들의 급여를 3개의 등급으로 구분하고 
        등급에 따라 1등급이면 '저 임금군'
                  2등급이면 '평균적 임금군'
                  3등급이면 ' 고 임금군'을 비고난에 출력하는 쿼리 작성
         Alias는 사원번호, 사원명, 직책코드, 급여, 등급, 비고이며
         임금의 하한값은 2000, 상한값은 30000이다.
      
       select employee_id as  사원번호,
              emp_name as 사원명, 
              job_id as 직책코드, 
              salary as 급여,
              width_bucket (salary,2000,30000,3)||'등급' as 등급,
              case when  width_bucket (salary,2000,20000,3) =1 then '저 임금군'
                   when  width_bucket (salary,2000,20000,3) =2 then '평균적 임금군'
                   else '고 임금군' end as 비고
              from employees;     
    
    
    
    
    
    
2019-12-23-02)함수(function)
/*함수는 반드시 반환값이있다.select절에서사용할수있다.*/
    - 함수가 사용된 위치에 결과 값을 반환(select, where, having 절에 사용가능)
    - 시스템에서 제공하는 함수
    - 문자열 함수 , 숫자함수, 날짜형함수, 집계함수, 변환함수 등이 존재
    
    1. 문자형 함수
      1) '||' : 문자열 결합 연산자
        -java의 '+'(문자열)와 동일
        (사용형식)
        c1 || c2
        . 'c1'과 'c2'는 문자열자료 또는 문자열 자료를 저장하고 있는 컬럼명
        . 같은 기능을 수행하는 함수로는 concat(c1,c2)가 제공
        . 'c1' 과 'c2'를 결합하여 새로운 문자열 반환
        
        
        예) 회원테이블의 자료를 이용하여 다음과 같은 결과를 출력하도록 query를 작성하시오.
        (출력 예)
        김은대 회원님의 마일리지는 1000점입니다.
        
        select  mem_name || '회원님의 마일리지는' ||mem_mileage||'점입니다.'
            from member;
            
    2) concat 
        - 두개만 사용가능
        - 문자열 결합 함수
        - '||'와 같은 기능
        (사용형식)
        concat (c1, c2)
            . c1과 c2를 결합하여 새로운 문자열 반환
            
    예)회원테이블에서 마일리지가 3000이상인 남성회원의 자료를 조회하시오.
     Alias는 회원번호, 회원명, 주민번호, 마일리지(주민번호는: '123456-2345678')
        주민번호 결합에 concat함수를 사용하시오.
        
        select mem_id as 회원번호,
                mem_name as 회원명,
                concat(mem_regno1,concat('-', mem_regno2)) as 주민번호,
                --mem_regno1 ||'-'|| mem_regno2 as 주민번호,
                mem_mileage as 마일리지
                
                from member
               where mem_mileage >= 3000 and (mem_regno2 like'1%' or mem_regno2 like'3%') ;
                
    3) lower(c1)/*소문자*/,upper(c1)/*대문자*/,initcap(c1)/*단어가시작되는 첫글자만 대문자로 나오는거*/
        - 'lower(c1)': c1의 모든 문자를 소문자로 변환
        - 'upper(c1)' :c1의 모든 문자를 대문자로 변환
        - 'initcap(c1)' : c1의 단어 첫 글자만대 문자로 변환

예) 사원테이블(employees)의 사원명을 소문자로 변경하시오.
    Alias는 사원번호(employee_id), 사원명(emp_name), 부서번호(department_id) 이다.
    
    select employees_id as 사원번호, 
            lower(emp_name) as "사원명(소)",
            upper(emp_name) as "사원명(대)",
            initcap(emp_name) as "사원명(initcap)",
            department_id as 부서번호


    from employees;

select mem_id, mem_name, mem_mileage
    from member
    where UPPER(mem_id) < 'F001';




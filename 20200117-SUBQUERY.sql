2020-01-17-01)SUBQUERY
 - QUERY안에 포함된 또 다른 쿼리
 - 최종결과를 출력하기 위한 쿼리(밖깥쪽 쿼리0를 메인 쿼리라 함
 - 서브쿼리는 SELECT,WHERE, FROM 절에 위치할 수 있음(특히 FROM 절에 나오는
  서브쿼리를 IN-LINE SUBQUERY라 하며 자체적으로 실행 가능해야 함
 - 서브쿼리는 '()'안에 기술되며 각 절에서 맨 먼저 실행됨
 - 서브쿼리의 분류는
  .메인쿼리와의 관련성(조인) 여부에 따라 연관성 있는 서브쿼리, 연관성 없는 서브쿼리로 분류
  .반환되는 결과가 하나의 행/열, 다수의 행/열에 따라 분류
 - 서브쿼리가 연산자와 함께 사용되는 경우 반드시 연산자 오른쪽에 기술 
  
  1)연관성 없는 서브쿼리
  .메인쿼리에 참여하는 테이블과 서브쿼리에 사용된 테이블이 조인으로 연결되지 않은 서브쿼리
  
  예) 사원테이블에서 전체 사원의 평균 급여보다 더 많은 급여를 받는 사원들을 조회하시오.
  Alias는 사원번호, 사원명, 부서명, 급여
 
 (1)메인쿼리-원테이블에서 전체 사원의 사원번호,사원명,부서명,급여조회
          -(조건) 사원의 평균 급여보다 더 많은 급여를  받는
          select  a.employees_id as 사원번호,
                  a.emp_name as 사원명,
                  b.department_name as 부서명,
                  a.salary as 급여
          from employees a, departments b
          where a.department_id=b.departmenr_id --조인조건
  
  (2)서브쿼리-사원의 평균급여
  select avg(salary) from employees;
  
3)(결합)
  select  a.employee_id as 사원번호,
          a.emp_name as 사원명,
          b.department_name as 부서명,                 
          a.salary as 급여
          from employees a, departments b
          where a.department_id=b.department_id --조인조건
          and a.salary >=(select avg(salary)
                            from employees);
                            
 **in-line subquery 로 구현       
  select  a.employee_id as 사원번호,
          a.emp_name as 사원명,
          b.department_name as 부서명,                 
          round(c.savg) as  평균급여,
          a.salary as 급여
 from employees a, departments b,(select avg(salary) as savg
                                            from employees)c
 where a.department_id=b.department_id  --조인조건
  and a.salary >=c.savg;
  
            
 예) 사원테이블에서 각 사원의 부서가 상위부서가 없는 부서에 속한 사원수를 조회하시오.
1)메인쿼리 - 사원테이블에서 사원수를 조회
               - (조건): 사원들의 부서가 상위부서가 없는 부서
      select count(*)
        from employees
       where department_id = (상위부서가 없는 부서)
       
2)서브쿼리 -상위부서가 없는 부서          
  select   department_id   
    from   departments
   where   parent_id is null;
                    
 3) 결합                   
select count(*)
from employees
where department_id=(select   department_id   
                     from   departments
                     where   parent_id is null);
 
  예) 사원테이블에서 각 사원의 부서가 상위부서가 10부서에 속한 사원수를 조회하시오.    

(in 연산자를 사용한경우)
select count(*)
from employees
where department_id in (select  department_id   
                       from   departments
                      where   parent_id = 10); 
                

(any, some 연산자를 사용한경우)
select count(*)
from employees
where department_id =any/*=some*/  (select  department_id   
                       from   departments
                      where   parent_id = 10); 
                      
                      
                      
 예) 사원테이블에서 각 사원의 부서가 상위부서가 90부서에 속한 사원수를 조회하시오.                     

(exists 연산자를 사용한경우)--관련성있는 서브쿼리(셀프조인)
select count(*)
  from employees b
 where  exists  (select *    
                  from  employees a
                  where a.department_id in (select department_id
                                            from departments
                                            where parent_id = 90)
                      and a.employee_id=b.employee_id);  --조인
                      
  --select 1 from cart;                    
        
   예) 장바구니테이블에서 2005년 6월에 판매된 판매정보를 조회하시오.
        단, 조인을 사용하지 말것
        Alias는 회원명, 상품명, 판매수량
        
        select (select mem_name
                    from member
                    where mem_id=cart_member) as 회원명, 
                    (select prod_name
                      from prod
                      where prod_id = cart_prod) as 상품명,
                      cart_qty as 판매수량
        from cart
        where cart_no like '200506%';
        
        
   /*과제*/ 예) 사원테이블(employees)에서 각 사원의 부서코드를 기준으로 부서별 평균임금을 구하고
        자기가 속한 부서의 평균임금보다 많은 임금을 받는 사원을 조회하시오.
        select (select 
        
        
        
        
        
        
        
            
            
            
            
            
            
            
            
            
            
            
            
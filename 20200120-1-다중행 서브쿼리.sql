2020-01-20-01)다중행 서브쿼리(행의 갯수가 한개이상)

예)상품테이블에서 상품의 분류코드가 'p201'(여성캐주얼)의 단가보다
    더 큰 단가를 가지고 있는 상품을 조회하시오.
    Alias는 상품코드, 상품명, 분류코드, 분류명, 판매가격이다.
    
    (단일행)-- 분류테이블,상품테이블
    select a.prod_id as 상품코드, 
           a.prod_name as 상품명,
           b.lprod_gu as 분류코드,--a.prod_lgu와 같음
           b.lprod_nm as 분류명,
           a.prod_price as 판매가격
     from prod a, lprod b
     where a.prod_lgu=lprod_gu
     --단순조인
     and a.prod_price >=all (select prod_price--최저가격
                                from prod
                              where prod_lgu='P201');
     
     (서브쿼리)
     select min(prod_price)--최저가격
      from prod
      where prod_lgu='P201';
      
      
      (숙제)
      각 부서별 평균급여를 계산하고 자기 소속 부서의 평균 급여보다 더 많은 급여를 받는 사원정보 조회
      Alias는 사원번호, 사원명, 소속부서명, 급여
      
      (메인)
      select a.employee_id as 사원번호,
            a.emp_name as 사원명, 
            b.department_name as 소속부서명,
            round(e.sal) as 평균급여,
            a.salary as 급여
        from employees a, departments b,(select department_id,
                                            round(avg(salary)) as sal
                                            from employees
                                            group by department_id) e
      where a.department_id=b.department_id
        and a.department_id=e.department_id --사원이 속한 평균급여 꺼내온거
        and a.salary>=e.sal --사원이 받고 있는 봉급하고  평균급여하고 비교
        order by 3;
      
    
            
      
      
      
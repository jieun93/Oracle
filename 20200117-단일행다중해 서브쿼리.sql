2020-01-17-02)단일행/다중해 서브쿼리
 - 서브쿼리의 결과가 하나의 행으로 반환되는 서브쿼리
 -관계 연산자(=,>,<,>=,<=,!=)가 사용
 
 예)사원테이블에서 50번 부서에 속한 사원의 최대 급여보다 더 많은 급여를 받는 사원의
 사원번호, 부서명, 직책명, 급여를 출력하시오.
 
 메인쿼리 사원의 사원번호, 부서명, 직책명, 급여를 출력하시오.
 메인쿼리의 조건 50번 부서에 속한 사원
 
 select a.employee_id as 사원번호,
        a.emp_name as 사원명,
        b.department_name as 부서명,
        c.job_title as 직책명,
        a.salary as 급여
   from employees a , departments b, jobs c
   where a.department_id = b.department_id --조인조건//부서명
    and a.job_id=c.job_id --조인조건//직책명
   -- and a.salary >=(50번부서에 속한 사원 중의 최대급여)
    and  a.salary >=(select max(salary)
                    from employees
                     where department_id =50);
    
    (2)서브쿼리-50번 부서에 속한 사원 중 최대급여
    select max(salary)
    from employees
    where department_id >=50;
    
 예) 2005년 5월 장바구니테이블에서 최대구매수량의 회원정보를 조회하시오.
 subquery 적용, 회원번호,회원명,상품명--(1)
 subquery 적용, 회원번호,회원명,상품명,최대구매수량--(2)
 
 select  c.cart_member as 회원번호,
         a.mem_name as  회원명,
         b.prod_name as 상품명,
         d.mqty as 최대구매수량
   from  member a,prod b, cart c,(select max(cart_qty) as mqty
                                   from cart
                                   where cart_no like '200505%') d
   where a.mem_id = c.cart_member 
     and c.cart_prod=b.prod_id
     and c.cart_qty>=d.mqty;
     
     2)서브쿼리
     select max(cart_qty)
     from cart
     where cart_no like '200505%;'
     
     
     예) 2005년 5월에 모든 회원별  구매수량합, 구매금액합을 구하시오.
      단,  ansi outer join을 사용하지 말것,
          구매액 기준 상위 5명만 조회할 것,
          Alias는 회원번호, 회원명, 구매수량, 구매금액
          
          select mem_id as 회원번호,
                 mem_name as 회원명,
                 cart_qyt as 구매수량,
                 b as  구매금액
          
         (예)2005년 5월 구매수량합을 구하고 상위 5명만 출력
        
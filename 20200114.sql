2020-01-14-01)null 관련함수
1) is null, is not null
 - 컬럼에 저장된 값이 null 값인지 여부를 판단
 - null은'='로 비교 불가능
 예)사원테이블에서 부서코드가 null인 사원을 조회하시오.
 select employee_id as 사원번호,
        emp_name as  사원명,
        department_id  as 부서코드,
        job_id as 직책코드,
        salary as 급여
   from employees 
   --where department_id = null;
   where department_id is null;
   
   예)사원테이블에서 commission_pct(영업실적)가 null이 아닌 사원을 조회하시오.
   select employee_id as  사원번호,
          emp_name as  사원명,
          department_id as  부서코드,
          commission_pct as 영업실적,
          salary as  급여
      from employees
      where commission_pct is not null;
      
      
    예) 사원테이블에서 영업실적에 따른 보너스를 계산하고 지급액을 조회하는
        쿼리를 작성하시오.
        지급액= 본봉 + 보너스
        보너스= 본봉*영업실적*50%
        
        select  employee_id as 사원번호,
                emp_name as  사원명,
                salary as 본급여,
                commission_pct as 영업실적,
                salary*commission_pct*0.5 as 보너스,
                salary+(salary*commission_pct*0.5) as 지급액
         from employees;  
         
 2)NVL
 - 매개변수로 정의된 컬럼 값이 'null'인지 판단하여 특정한(정의된) 값을 반환
 (사용형식)
 NVL(c,v)
 .'c'에 저장된 값이 'null'이면 'v' 값을 반환하고, 'null'이 아니면 'c'에 저장된
  값을 반환
  
         select employee_id as 사원번호,
                emp_name as  사원명,
                salary as 본급여,
                commission_pct as 영업실적,
                salary*nvl(commission_pct,0)*0.5 as 보너스,--값이 null인경우는 0을 줘야한다.
                salary+nvl((salary*commission_pct*0.5),0) as 지급액-- 컬럼값이 전체인 값에 nvl을 붙여도 된다.
         from employees;  
        
 3)NVL2
    .정의된 컬럼값의 'null'여부에 따라 서로 다른 값을 반환
    (사용형식)
    nvl2 (c,v1,v2)
    .'c'에 저장된 값이 'null'이 아니면 'v1'을 반환하고, 'null'이면 'v2'를 반환
    
    예) 상품테이블에서 상품의 색상(prod_color)이 'null'이면 '색상정보 없음'을 출력하시오,
    
    select  prod_id as 상품코드,
            prod_name as  상품명,
            prod_color as "상품의 색상"
    from    prod;
        
(NVL함수를 적용)
     select prod_id as 상품코드,
            prod_name as  상품명,
            nvl(prod_color,'색상정보 없음') as "상품의 색상"
    from    prod;
    
  update member
    set mem_like=null
  where mem_like='등산'
  
  예) 회원테이블에서 취미가 null이면 '취미없음',null이 아니면 '취미있음'을
        출력하여 회원정보를 조회하시오.
        
        select mem_id 회원번호,
               mem_name as  회원명,
               mem_like as 취미,
               nvl2(mem_like, '취미있음','취미없음')
          from member;
          
        
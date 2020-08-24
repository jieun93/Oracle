2020-01-02-02)집계함수(그룹함수)
    - 원본자료를 특정항목(컬럼)을 기준으로 그룹으로 묶어 집계처리를 수행
    - SUM, AVG, COUNT, MIN, MAX
    - 특정한 경우 (테이블 전체를 하나의 그룹으로 간주)를 제외하고 GROUP BY 가 사용되어야 함
    - 집계함수에 조건이 부여되면 WHERE절로 조건처리가 불가능하며 반드시 HAVING절로 처리해야 함
    - GROUP BY 다음에  기술되는 항목은 SELECT 절에서 집계함수를 제외한 모든 일반 항목(필수 기술)과 그룹이 필요한 일반 컬럼으로 구성
    - GROUP BY 다음에  기술되는 항목순으로 그룹이 다시 소그룹으로 묶임

1)SUM
    -특정 컬럼값의 합을 반환
    (사용형식)
    SUM(ci)
    .c1 컬럼의 합을 구하여 반환

예) 사원테이블에서 사원들의 급여 합을 구하시오.
    select department_id, 
          sum(salary) 
    from employees; -- 오류
    
 예) 사원테이블에서 부서별 사원들의 급여 합을 구하여 부서코드 순으로 출력하시오.   
   select department_id, 
          to_char(sum(salary),'$999,999') as 급여합
    from employees
    group by department_id
    order by 1;
    
 예)장바구니테이블에서 2005년 6월 상품별 판매수량합계를구하시오.
 Alias는 상품번호, 판매수량합
 
 select cart_prod as 상품번호,
        count(*) as 판매횟수,
        sum(cart_qty) as 판매수량합계
 from cart
 where substr(cart_no,1,6)='200506'
 group by cart_prod 
 order by 1;
  
  
  예) 매입테이블(buyprod)에서 2005년 4월 일자별 매입수량합과 매입금액합을 구하시오.
   Alias는 일자, 매입수량합, 매입금액합
   
    select buy_date as 일자,
           sum(buy_qty) as 매입수량합,
           sum(buy_qty * buy_cost) as 매입금액합
    from buyprod
    where buy_date between to_date('20050401') and to_date('20050430')
    group by buy_date
    order by 1;
   
   
   예) 회원테이블에서 모든 회원들의 마일리지 합을 구하시오.
  --  select sum(mem_mileage)
  --      from member;
   
   /*select mem_name,
            sum(mem_mileage)
    from member
    group by mem_name;*/
   
   
    예) 회원테이블에서 성별 회원들의 마일리지 합을 구하시오.
    
    select substr(mem_regno2,1,1),
            sum(mem_mileage)
     from   member
    group by  substr(mem_regno2,1,1);
       
   
   
   예) 회원테이블에서 성별 회원들의 마일리지 합을 구하시오.
    
    select case when (substr(mem_regno2,1,1)='1' or
                    substr(mem_regno2,1,1)='3' then '남성회원'
                when (substr(mem_regno2,1,1)='2' or
                    substr(mem_regno2,1,1)='4' then '여성회원'
        end as 성별,
        sum(mem_mileage)
     from   member
    group by  substr(mem_regno2,1,1)='1' or 
            substr(mem_regno2,1,1)='3' then '남성회원'
            
        end;
        
        
   예) 회원테이블에서 거주지별 회원의 마일리지 합을 구하시오.
   
   select substr(mem_add1,1,2) as 거주지,
            sum(mem_mileage) as 마일리지
      from member
      group by substr(mem_add1,1,2);
            
  예) 사원테이블에서 2005년 이후에 입사한 사원들에 대하여 부서별 급여 합계를 구하시오.
    
    select department_id as 부서,
          sum(salary) as 급여
     from employees
     where extract(year from hire_date)>=2005
     group by  department_id; 
     
     
   예) 장바구니테이블에서  2005년 5월 자료에서 제품별 판매수량합을 구하되 판매수량합계가 20개 이상인 제품만 조회하시오.
   
     select cart_prod as 제품코드,
            sum(cart_qty) as 판매수량합계
      from cart
      where cart_no like '200505%'/* substr(cart_no,1,6)='200505' */
      group by cart_prod
      having sum(cart_qty)>=20;
      
    
 2) count
 - 그룹 내의 행의 수(자료수)
 (사용형식)
 count(*|c1) 
 
   예)사원테이블에서 전체 사원수를 조회하시오.
   select count(*),
        count(employee_id),
        count(salary)
   from employees;      
   
   
   예)사원테이블에서 부서별 사원수와 급여합계를 조회하시오.
   select department_id as 부서코드,
          count(*) as  사원수, 
          sum(salary) as  급여합
   from  employees
   group by department_id  
   order by 1;   
   
   
   예)상품테이블에서 거래처별 거래상품의 수를 조회하시오.
      select  prod_buyer as 거래처,
             count(*) as 거래상품수
      from prod
      group by prod_buyer
      order by 2 desc;
   
   예) 회원테이블에서 거주지별 회원수를 조회하시오.
   
   select substr(mem_add1,1,2) as 거주지,
          count(*) as 회원수
   from  member
   group by substr(mem_add1,1,2)
   order by 1;
    
   
   
   예) 장바구니테이블에서 2005년 5~6월 회원별 구매회수를 조회하되 구매 횟수가 5회 이상인 회원만 조회하시오.
   
   select  cart_member as  회원,
          count(distinct cart_no) 구매회수
   from cart
   where  substr(cart_no,1,6)='200505' or substr(cart_no,1,6)='200506'
   -- where substr(cart_no,1,6) between '200505' and '200506'
   group by  cart_member
   having  count(distinct cart_no)>=3;

    
   예) 회원테이블에서 회원들의 취미(mem_like)별 회원수를 구하시오.
   select mem_like as 회원,
           count(*) as 회원수
   from member
   group by mem_like;
        
   예) 장바구니 테이블에서 2005년 5-6월 회원별, 제품별 구매횟수와 구매 수량 합을 구하시오.
       
   select cart_member as 회원,
          cart_prod as 제품,
          count(*) as  구매회수,
          sum(cart_qty) as  구매수량합
   from cart
   where  substr(cart_no,1,6)>='200505' 
   and substr(cart_no,1,6)>='200506'
   group by  cart_member, cart_prod
   order by 1;
   
   
 3) avg
    - 그룹으로 묶인 집단의 평균값
    (사용형식)
    avg(c1)
    .c1에저장된 값의 산술 평균 반환
    예) 사원테이블에서 부서별 평균 급여, 급여합계, 인원수를 조회하시오.
    --평균급여 = 급여합계 / 인원수
    select department_id as 부서코드,
            round(avg(salary)) as "평균급여(avg)",
            round(sum(salary)) as 급여합계,
            count(*) as 부서별인원수,
            sum(salary)/count(*) as "평균급여(계산)"
    from   employees
    group by department_id
    order by 1;
    
    
    예) kor_loan_status 테이블을 이용하여 각 시도별, 구분별 평균 대출잔액을 구하시오.
    select region as 시도,
           gubun as 대출구분,
           to_char(sum(loan_jan_amt),'9,999,999.9') as 대출잔액합계,
           to_char(avg(loan_jan_amt),'9,999,999.9') as 평균대출잔액
    from   kor_loan_status
    group by region,gubun;
    
    예) kor_loan_status 테이블을 이용하여 각 시도별, 구분별 대출 잔액 합계와
        평균 대출 잔액을 구하되 대출 잔액 합계가 20조원을 넘는 값만 조회하시오.
        
    select region as 시도,
           gubun as 대출구분,
           to_char(sum(loan_jan_amt),'9,999,999.9') as 대출잔액합계,
           to_char(avg(loan_jan_amt),'9,999,999.9') as 평균대출잔액
    from   kor_loan_status
    group by region,gubun
    having sum(loan_jan_amt)>=200000
    order by region;
           
     예) kor_loan_status 테이블을 이용하여 2012~2013년 각 시도별, 월별 대출 잔액 합계와
        평균 대출 잔액을 구하되 대출 잔액 합계가 5조원을 넘는 값만 조회하시오.
    select region as 시도별,
           substr(period,5,2) as 월별,
           sum(loan_jan_amt) as "대출잔액합계",
           avg(loan_jan_amt) as "평균대출잔액"
    from   kor_loan_status
    where substr(period,1,4) between '2012' and '2013'
    group by region,substr(period,5,2)
    having sum(loan_jan_amt)>=50000
    order by 1,2;
        
   
    예) 장바구니테이블과 회원테이블을  이용하여 2005년 4월 ~ 5월 사이 회원성별 매출금액합계,
        매출건수,평균매출액을 구하시오.
        
        select  case when substr(mem_regno2,1,1) ='1' or
                          substr(mem_regno2,1,1) ='3' then '남성' 
                     when substr(mem_regno2,1,1) ='2' or
                          substr(mem_regno2,1,1) ='4' then '여성'
                 end as  회원성별,
                sum(cart_qty*prod_price) as 매출금액합계,
                count(*) as 매출건수,
                round(avg(cart_qty*prod_price)) as 평균매출액
        from member, cart, prod
        where cart_member = mem_id--join조건
        and cart_prod = prod_id--join조건
        and  substr(cart_no,1,6) between '200504' and '200505'
        group by case when  substr(mem_regno2,1,1) ='1' or
                            substr(mem_regno2,1,1) ='3' then '남성' 
                      when  substr(mem_regno2,1,1) ='2' or
                            substr(mem_regno2,1,1) ='4' then '여성'
                 end;
                 
                 
    예)회원테이블에서 거주지별,직업별 마일리지합과 회원수,평균마일리지를 구하시오.
    
    select substr(mem_add1,1,2) as 거주지별,
           mem_job as 직업별,
           sum(mem_mileage) as 마일리지합,
           count(mem_id) as 회원수,
           round(avg(mem_mileage)) as 평균마일리지
     from member      
     group by substr(mem_add1,1,2),mem_job
     order by 1;
     
  4)MAX, MIN 
  -  매개변수로 제공되는 컬럼값 중 최대값(MAX),최소값(MIN)을 구하여 반환
  - 이들 함수를 사용하면 원본 테이블의 자료를 오름차순(MIN),내림차순(MAX)으로
    정렬한 후 첫번째 행의 값을 반환-PROCESS TIME이 다소 소요됨
    
예)사원테이블에서 각 부서별 가장 많은 급여와 가장 작은 급여를 구하시오.
 select department_id as 부서코드,
        count(*) as 사원수,
        max(salary) as 최대급여,
        min(salary) as 최소급여
  from employees
  group by department_id
  order by 1;
        
  
   
   
   
                                                                                                                                                                                                                                                                                      
        
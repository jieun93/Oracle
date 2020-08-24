2020-01-13)ROLLUP과CUBE
 GROUP BY절에 사용하며 중간 집계를 구할때 사용
 
 1)ROLLUP
  (사용형식)
  GROUP BY [컬럼명,..],ROLLUP(컬럼명 [,컬럼명....]),[컬럼명,..]
  
  .반드시 GROUP BY 절안에 기술
  .ROLLUP 안에 기술된 컬럼명의 순서(오른쪽->왼쪽)에 대한 집계
  .ROLLUP 안에 기술된 컬럼명이 N개일 때 N+1개의 집계 반환
  
  
  예)KOR_LOAN_STATUS에서 지역별, 년도별, 대출액 합계를 구하시오.
    (GROUP BY절만 사용)
    
    SELECT REGION AS 지역별, 
           SUBSTR(PERIOD,1,4) AS 년도,
           SUM(LOAN_JAN_AMT) 
       FROM KOR_LOAN_STATUS 
       GROUP BY REGION,SUBSTR(PERIOD,1,4)
       ORDER BY 1;
       
       
       
       
       (ROLLUP 사용)
      SELECT REGION AS 지역별, 
           SUBSTR(PERIOD,1,4) AS 년도,
           GUBUN AS 대출구분,
           SUM(LOAN_JAN_AMT) 
       FROM KOR_LOAN_STATUS 
       GROUP BY ROLLUP(REGION,SUBSTR(PERIOD,1,4),GUBUN)
       ORDER BY 1;
       
   예) 매입테이블(BUYPROD)을 이용하여 2005년도 월별, 분류별 매입합계를 구하되 월별 합계와 전체 합계도 구하시오.
  SELECT EXTRACT(MONTH FROM BUY_DATE) AS 월별,
         SUBSTR(BUY_PROD,1,4) AS 분류,
         SUM(BUY_COST) AS 매입합계
  FROM   BUYPROD
  WHERE  EXTRACT(YEAR FROM BUY_DATE) = 2005
  GROUP BY ROLLUP(EXTRACT(MONTH FROM BUY_DATE),SUBSTR(BUY_PROD,1,4));
      
  2)cube
  rollup보다 다양한 집계의 종류를 반환
 cube 다음 기술된 컬럼명의 수가 n개일때 2^n가지 종류의 집계를 반환
 
 예) KOR_LOAN_STATUS에서 지역별, 년도별, 구분별 대출액 합계를 구하시오.
 (rollup 사용)
 select region as  지역별,
        substr(period,1,4) as 년도,
        gubun as 구분,
        sum(loan_jan_amt) as 대출잔액합계
   from kor_loan_status
   group by gubun, rollup(region, substr(period,1,4))
   order by 1;
   
   (cube 사용)
 select region as  지역별,
        substr(period,1,4) as 년도,
        gubun as 구분,
        sum(loan_jan_amt) as 대출잔액합계
   from kor_loan_status
   group by cube(region, substr(period,1,4),gubun)
   order by 1;
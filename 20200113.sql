2020-01-13)ROLLUP��CUBE
 GROUP BY���� ����ϸ� �߰� ���踦 ���Ҷ� ���
 
 1)ROLLUP
  (�������)
  GROUP BY [�÷���,..],ROLLUP(�÷��� [,�÷���....]),[�÷���,..]
  
  .�ݵ�� GROUP BY ���ȿ� ���
  .ROLLUP �ȿ� ����� �÷����� ����(������->����)�� ���� ����
  .ROLLUP �ȿ� ����� �÷����� N���� �� N+1���� ���� ��ȯ
  
  
  ��)KOR_LOAN_STATUS���� ������, �⵵��, ����� �հ踦 ���Ͻÿ�.
    (GROUP BY���� ���)
    
    SELECT REGION AS ������, 
           SUBSTR(PERIOD,1,4) AS �⵵,
           SUM(LOAN_JAN_AMT) 
       FROM KOR_LOAN_STATUS 
       GROUP BY REGION,SUBSTR(PERIOD,1,4)
       ORDER BY 1;
       
       
       
       
       (ROLLUP ���)
      SELECT REGION AS ������, 
           SUBSTR(PERIOD,1,4) AS �⵵,
           GUBUN AS ���ⱸ��,
           SUM(LOAN_JAN_AMT) 
       FROM KOR_LOAN_STATUS 
       GROUP BY ROLLUP(REGION,SUBSTR(PERIOD,1,4),GUBUN)
       ORDER BY 1;
       
   ��) �������̺�(BUYPROD)�� �̿��Ͽ� 2005�⵵ ����, �з��� �����հ踦 ���ϵ� ���� �հ�� ��ü �հ赵 ���Ͻÿ�.
  SELECT EXTRACT(MONTH FROM BUY_DATE) AS ����,
         SUBSTR(BUY_PROD,1,4) AS �з�,
         SUM(BUY_COST) AS �����հ�
  FROM   BUYPROD
  WHERE  EXTRACT(YEAR FROM BUY_DATE) = 2005
  GROUP BY ROLLUP(EXTRACT(MONTH FROM BUY_DATE),SUBSTR(BUY_PROD,1,4));
      
  2)cube
  rollup���� �پ��� ������ ������ ��ȯ
 cube ���� ����� �÷����� ���� n���϶� 2^n���� ������ ���踦 ��ȯ
 
 ��) KOR_LOAN_STATUS���� ������, �⵵��, ���к� ����� �հ踦 ���Ͻÿ�.
 (rollup ���)
 select region as  ������,
        substr(period,1,4) as �⵵,
        gubun as ����,
        sum(loan_jan_amt) as �����ܾ��հ�
   from kor_loan_status
   group by gubun, rollup(region, substr(period,1,4))
   order by 1;
   
   (cube ���)
 select region as  ������,
        substr(period,1,4) as �⵵,
        gubun as ����,
        sum(loan_jan_amt) as �����ܾ��հ�
   from kor_loan_status
   group by cube(region, substr(period,1,4),gubun)
   order by 1;
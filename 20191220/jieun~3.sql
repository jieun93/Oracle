2019-12-19-04)SELECT 문
-자료 조회에 사용
-관계형 데이터베이스 쿼리명령 중 가장 많이 사용
 
 (사용형식)
 SELECT [DISTINCT]컬럼명 [ [AS] ["] 별칭 ["]],
                    :
        컬럼명 [ [AS] ["] 별칭 ["]] 
   FROM 테이블명 [별칭]
  [WHERE 조건
    [AND  조건,...]]
  [GROUP BY 컬럼명[,컬럼명,...]]/*집계함수가정해져야한다.집계함수와셀렉트절이쓰이면무조건 그룹바이를써야한다.5개의함수자체에조건이 부여될때 */
  [HAVING 조건 ....]
  [ODER BY 컬럼명 | 컬럼인덱스 [DESC|ASC],...]/*정렬시킬때*/
 

  4657854*423123
  
  SELECT   4657854*423123 FROM DUAL; /*SELECT문은 반드시 FROM까지 써야 한다.*/
  
    
  -'DISTINCT'는 중복된 값을 제거함.
  
  -컬럼의 별칭 --컬럼마다 별칭을 부여할 수 있다.
    .컬럼명 대신 참조하는  경우 (서브쿼리에서 주로 사용)
    .출력에서 제목 출력
    
    SELECT MEM_NAME AS"회원이름",
       CASE WHEN SUBSTR(MEM_REGNO2,1,1)='1'THEN '남자회원'
          ELSE '여자회원' END CASE,
      MEM_MILEAGE AS 마일리지 
      
      FROM MEMBER;
    
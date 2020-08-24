2019-12-23-01)
1)between연산자
    예)상품테이블(PROD)에서 상품의 분류가 'P102'에서 'P302'에 속한 상품을 조회하시오.
        Alias는 상품번호(PROD_ID), 상품명(PROD_NAME), 분류코드(PROD_LGU), 거래처코드(POD_BUYER)
        
      SELECT PROD_ID AS 상품번호, 
               PROD_NAME AS 상품명,
               PROD_LGU AS 분류코드,
               PROD_BUYER AS 거래처코드
        FROM PROD
        WHERE PROD_LGU >='P102' AND PROD_LGU<='P302';
               
   (BETWEEN 연산자사용)
     SELECT PROD_ID AS 상품번호, 
               PROD_NAME AS 상품명,
               PROD_LGU AS 분류코드,
               PROD_BUYER AS 거래처코드
        FROM PROD
        WHERE PROD_LGU BETWEEN'P102' AND 'P302';
         
         
         2)LIKE 연산자
         - 와일드카드('%','_')를 사용하는 패턴을 비교
         (사용형식)
         컬럼명 LIKE 패턴문자열 
         . '%' : '%'가 사용된 위치에서 모든 문자열과 대응
            EX) '박%' =>'박'으로 시작되는 문자열은 다 참이다.
                '%박' =>'박'으로 끝나는 문자열은 다 참이다.
                '%가%'=> 중간에 '가'들어가며 참이 되어진다.
                
                
        예) 회워테이블에서 '김'씨 성을 가진 회원을 검색하시오.
         Alias는 회원번호, 회워명, 직업, 마일리지
         
        SELECT MEM_ID AS 회원번호,
               MEM_NAME AS 회원명,
               MEM_JOB AS 직업,
               MEM_MILEAGE AS 마일리지
                
        FROM MEMBER
        WHERE MEM_NAME LIKE '김%';
        /*LIKE를 많이 쓰면 안된다,문자열을 조회할때쓴다.*/
        
        예)회원테이블에서 주소지가 '서울'인 회원을 조회하시오.
          Alias는 회원번호, 회원명, 주소, 직업, 마일리지
          
          SELECT MEM_ID AS 회원번호,
                MEM_NAME AS 회원명,
                MEM_ADD1 || /*더하기연산자와같다*/' ' || MEM_ADD2 AS 주소,
                MEM_JOB AS 직업,
                MEM_MILEAGE AS 마일리지
                
                FROM MEMBER
                WHERE MEM_ADD1 LIKE '충남%';
        
        예) 회원테이블에서 여성회원을 조회하시오.
        Alias는 회원번호, 회원명, 주민번호, 마일리지
                성별 컬럼에는 '여성회원'을 출력
        
        SELECT MEM_ID AS 회원번호,
                MEM_NAME AS  회원명,
                MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
                '여성회원' AS 성별,
                MEM_MILEAGE AS 마일리지
                
                FROM MEMBER
                WHERE MEM_REGNO2 LIKE '2%'
                OR MEM_REGNO2 LIKE'4%';
                
        **'m001'회원의주민번호를 '010315-4555555'로 변경하시오.
        
        update member
            set mem_regno1='000319',
                mem_regno2='4110222'
            where mem_id='x001';
            
            commit;
            
            SELECT MEM_ID AS 회원번호,
                MEM_NAME AS  회원명,
                MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
                '여성회원' AS 성별,
                MEM_MILEAGE AS 마일리지
                
                FROM MEMBER
                WHERE MEM_REGNO2 LIKE '2%'
                OR MEM_REGNO2 LIKE'4%';
                
                예) 회원테이블에서12월에 생일이 있는 회원을 조회하여 회원이 갖고 있는 마일리지의 10%를 추가 지급하시오.
                    생일은 주민번호 앞 자리로 조회.
                    
                단,Alias는 회원번호, 이름, 생년월일, 추가지급 마일리지, 마일리지 합계
                
                SELECT MEM_ID AS 회원번호,
                    MEM_NAME AS 이름,
                    MEM_BIR AS 생년월일,
                    MEM_MILEAGE*0.1 AS 추가지급마일리지,
                    MEM_MILEAGE+(MEM_MILEAGE*0.1 ) AS 마일리지합계
                
                FROM MEMBER
                WHERE SUBSTR(MEM_REGNO1,3,2)='12';
                
    .'_': '_'는 사용된 위치에서 하나의 문자열과 대응
        EX) '_길동'==>성씨가 한글자이고 이름이 '길동'인 사람을 조회
        
    예) 회원테이블에서12월에 생일이 있는 회원을 조회하여 회원이 갖고 있는 마일리지의 10%를 추가 지급하시오.
                    생일은 주민번호 앞 자리로 조회.
                    
                단,Alias는 회원번호, 이름, 생년월일, 추가지급 마일리지, 마일리지 합계     
        
     SELECT MEM_ID AS 회원번호,
                    MEM_NAME AS 이름,
                    MEM_REGNO1 AS 생년월일,
                    MEM_MILEAGE*0.1 AS 추가지급마일리지,
                    MEM_MILEAGE+(MEM_MILEAGE*0.1 ) AS 마일리지합계
                
                FROM MEMBER
            WHERE MEM_REGNO1 NOT LIKE '__12%';    
        
        
        
        
        
        
        
        
        
2019-12-19-02)자료 수정
 - UPDATE 문으로 지원
 (사용형식)
 
 UPDATE 테이블명
   SET 컬럼명=값,
       컬럼명=값,...
 [WHERE 조건];--모든절에서쓸수있다 WHERE 절이 생략되면 다 변경된다.
 
 
 예)상품테이블에서'무선광마우스'(P10101)의판매가를 20000원으로 수정하시오.

 UPDATE GOODS
   SET  GPRICE = 20000
 WHERE GNAME LIKE '무선%';  
   
   SELECT * FROM GOODS;
   
ROLLBACK;
 
 
   거래처번호 : 'A102'
        거래처명 : '주식회사 A2M'
        거래처주소 : '대전시 유성구 대덕대로 123 테크노 4로 67'
        대표자명 : 
   
   INSERT INTO ACUSTOMER VALUES('A102','주식회사 A2M','대전시 유성구 대덕대로 123 테크노 4로 67','');
    SELECT * FROM ACUSTOMER; 
    
    COMMIT
    
    
     거래처번호 : 'A202'
        거래처명 : '(주) 와토시스'
        거래처주소 : '대전시 대덕구 법동 123-45'
        대표자명 : 
    
   
   INSERT INTO  ACUSTOMER (ACUSTOMID,ACUSTNAME,ACUSADDR)
    VALUES ('A202','(주) 와토시스', '대전시 대덕구 법동 123-45');
                  
      SELECT * FROM ACUSTOMER; 
    
    
     거래처번호 : 'A203'
        거래처명 : '(주)소프트 상추'
        거래처주소 : 
        대표자명 : '김상추'
        
        INSERT INTO ACUSTOMER(ACUSTOMID,ACUSTNAME,ACEONAME) VALUES ('A203', '(주)소프트 상추','김상추');
       SELECT * FROM ACUSTOMER; 
       
   상품번호 : 'P10101'
   상품명 : '무선 광 마우스'
   가격 : 15000원
   거래처 : 주식회사 A2M
   
    INSERT INTO GOODS(GID,GNAME,GPRICE,ACUSTOMID) 
      VALUES('P10101','무선 광 마우스',15000,'A102');
      
      SELECT * FROM GOODS;
   COMMIT   
      
   상품번호 : 'P10201'
   상품명 : 'MS OFFICES 2018'
   가격 : 35000원
   거래처 : (주)소프트 상추
   
   INSERT INTO GOODS(GID,GNAME,GPRICE,ACUSTOMID)
    VALUES('P10201','MS OFFICES 2018',35000,'A203');
   
    SELECT * FROM GOODS;
   
    COMMIT--고정시키는거 자료가 날아가지 않도록
    
    
    
    예제)회원테이블 (MEMBER)에서 직업(MEM_JOB)이 '학생'인 회원의 마일리지를 모두 3000으로
        변경하시오.
        
        SELECT MEM_NAME,MEM_MILEAGE,MEM_PASS
          FROM MEMBER
          WHERE MEM_JOB='학생';
        
        UPDATE MEMBER 
         SET MEM_MILEAGE = 3000,
             MEM_PASS='AAA'
         WHERE MEM_JOB='학생';
         
         ROLLBACK;
         
         
         
         
         
        
    
      
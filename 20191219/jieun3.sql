2019-12-19-01)자료 입력
 - INSERT 문으로 지원
  (사용형식)
  INSERT INTO 테이블명 [ (컬럼명,컬럼명,...)] VALUES (값,값,...);
  .'(컬럼명,컬럼명,...)' 은 생략 가능한 생략하면 테이블에 존재하는 모든 칼럼에 적용될 값을 VALUES 절에서 기술 해야함.
  .'(컬럼명,컬럼명,...)'이 생략되면 값 (데이터)을 기술 하는 순서는 테이블 내의  컬럼순서와 일치해야 함.
  .'(컬럼명,컬럼명,...)'이 기술 되면 기술된 순서에 마추어 해당 컬럼에 저장될  값만 기술 가능. 
    단, 컬럼이 NOT NULL로 기술되어 있으면 생략할 수 없다.
   
   
   
  예) 다음 주어진 자료를 거래처테이블(ACUSTOMER)에 저장하는 쿼리 작성
        [자료]
        거래처번호 : 'A101'
        거래처명 : '삼보컴퓨터 주식회사'
        거래처주소 : '서울시 영등포구 당산2동 123-4567'
        대표자명 : '이삼보'
        
 INSERT INTO ACUSTOMER(ACUSTOMID,ACUSTNAME,ACUSADDR,ACEONAME)
   VALUES ('A101','삼보컴퓨터 주식회사','서울시 영등포구 당산2동 123-4567','이삼보');
             
   SELECT * FROM ACUSTOMER;      
        
        거래처번호 : 'A102'
        거래처명 : '주식회사 A2M'
        거래처주소 : '대전시 유성구 대덕대로 123 테크노 4로 67'
        대표자명 : 
   
   INSERT INTO ACUSTOMER VALUES('A102','주식회사 A2M','대전시 유성구 대덕대로 123 테크노 4로 67','');
    SELECT * FROM ACUSTOMER; 
    
    
    
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
       
  문제]상품테이블(GOODS)에 다음자료를 입력하시오.
   [자료]
   상품번호 : 'P10101'
   상품명 : '무선 광 마우스'
   가격 : 15000원
   거래처 : 주식회사 A2M
   
 INSERT INTO GOODS(GID,GNAME,GPRICE,ACUSTOMID) 
      VALUES('P10101','무선 광 마우스',15000,'A102');
      
      SELECT * FROM GOODS;
   
   
   
   상품번호 : 'P10201'
   상품명 : 'MS OFFICES 2018'
   가격 : 35000원
   거래처 : (주)소프트 상추
   
   INSERT INTO GOODS(GID,GNAME,GPRICE,ACUSTOMID)
   
    VALUES('P10201','MS OFFICES 2018',35000,'A203');
    SELECT * FROM GOODS;
    
 ** 상품테이블에서 무선광마우스를 납품한 회사명과 대표자를 조회하시오.
 SELECT B.ACUSTNAME AS 회사명,
        B.ACEONAME AS 대표자
  FROM GOODS A, ACUSTOMER B
  WHERE A.ACUSTOMID=B.ACUSTOMID
    AND A.GNAME LIKE '무선%';
    
    
    
    
 
  
  
  
  
  
  
  
  
  
      
      
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
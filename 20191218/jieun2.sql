2019-12-18-2)테이블 생성 명령
- create 문에 의해 테이블 객체 생성
- 테이블은 행과 열로 구성 (열은 하나이상 존재해야 한다./행은존재하지않아도상관없음)
- 테이블 스페이스에서 테이블명은 유일해야 함
- 테이블이 다르면 동일한 컬러명 사용 가능

(사용형식)
    create table 테이블명(필수기재)(
    컬럼명  데이터타입[(크기)]  [default(기본으로 저장되어지는 값) expr] [nullㅣnot null],
                                    :
    컬럼명  데이터타입[(크기)]  [default expr] [nullㅣnot null],
    
    **암기해야함** 파란글씨는 고정되어 사용되는 예약어/기본키가여러항목으로만들어지면','로 설정
    
    [constraint 기본키설정명(중복사용x)  primary key (컬럼명[,컬럼명...]),
     constraint 외래키설정명(중복사용x)  foreign key (컬럼명[,컬럼명...]),
        references 외부테이블명 (컬럼명[,컬러명...]),
                                :
    constraint 외래키설정명  foreign key (컬럼명[,컬럼명...]),
      references 외부테이블명 (컬럼명[,컬러명...])),
 
예) ABC 쇼핑몰의 요구사항 분석

    1) 상품은 [상품번호],상품명,가격,거래처 번호 정보를 가지고 있음(GOODS)
        - 상품번호 : 고정길이 문자열 6자리,(GID)
        - 상품명 : 가변길이 문자열 50자리(GNAME)
        - 가격 : 숫자 7자리 (GPRICE)
        - 거래처번호 : 고정길이 문자열 4자리 (CUSTOMER)
        
    2) 회원은 [회원번호],회원명,주소,전화번호를  가지고 있음 (CUSTOMER)
        -회원번호 : 고정길이 문자열 4자리 (CUSID)
        -회원명 : 가변길이 문자열 30 (CUNAME)
        -주소 : 가변길이 문자열 100 (CUSADDR)
        -전화번호 : 가변길이 문자열 30 (CUSTELNO)
    
    3) 거래처는 [거래처번호],거래처명,주소,대표자명을 가지고 있음 (ACUSTOMER)
     - 거래처 번호 : 고정길이 문자열 4자리  (ACUSTOMID)
     - 거래처명 : 가변길이 문자열 50 (ACUSTNAME)
     - 주소 : 가변길이 문자열 100 (ACUSADDR)
     - 대표자명 : 가변길이 문자열 30 (ACEONAME)
    
    4) 장바구니는 [회원번호,상품번호],날짜,수량으로 구성 (SHCART)
        -날짜 :SHDATE
        -수량 (SHQTY)
    
    5) 매입은 [거래처번호,상품번호],날짜,수량으로 구성(PUCH)
        -날짜 (PUDATE)
        -수량 (PUQTY)
        
        /* 오라클 주석 
        */
    -- 오라클주석
    
    위의 요구사항을 토대로 각각 테이블을 생성하시오
    
    
    **거래처 테이블 생성

CREATE TABLE ACUSTOMER(
    ACUSTOMID CHAR(4) NOT NULL,--기본키
    ACUSTNAME VARCHAR2(50) NOT NULL,
    ACUSADDR VARCHAR2(100),
    ACEONAME VARCHAR2(30),
    
    CONSTRAINT pk_acustomer PRIMARY KEY(ACUSTOMID));
    
--상품테이블 생성

CREATE TABLE GOODS(
  GID CHAR(6) NOT NULL,--기본키
  GNAME VARCHAR2(50) NOT NULL,
  GPRICE NUMBER(7) NOT NULL,
  ACUSTOMID CHAR(4) NOT NULL,--외래키
  
 CONSTRAINT pk_goods PRIMARY KEY(GID),
 CONSTRAINT fk_goods_acustomer FOREIGN KEY(ACUSTOMID)
  REFERENCES ACUSTOMER(ACUSTOMID));
  
  
  DROP TABLE GOODS;
  
  ---회원테이블생성
  
  CREATE TABLE CUSTOMER(
     CUSID CHAR (4) NOT NULL,--기본키
     CUNAME  VARCHAR2(30) NOT NULL,
     CUSADDR VARCHAR2(100) NOT NULL,
     CUSTELNO NUMBER(30 )NOT NULL,
     
     CONSTRAINT pk_CUSTOMER PRIMARY KEY( CUSID));
     
 ---장바구니 테이블 생성
 
  CREATE TABLE SHCART(
    CUSID CHAR (4) NOT NULL,--외래키&기본키
    GID CHAR(6) NOT NULL,-외래키&기본키
    SHDATE  DATE NOT NULL,
    SHQTV  NUMBER(3)  DEFAULT 0 ,
     
     CONSTRAINT pk_SHCART PRIMARY KEY (CUSID,GID),
     
     CONSTRAINT fk_SHCART_CUSTOMER FOREIGN KEY(CUSID)
      REFERENCES CUSTOMER(CUSID),
      
      CONSTRAINT fk_SHCART_goods FOREIGN KEY(GID)
            REFERENCES GOODS(GID));
            
            
-----매입테이블생성

CREATE TABLE  PUCH(
  ACUSTOMID CHAR(4) NOT NULL,
  GID CHAR(6) NOT NULL,
  PUDATE DATE DEFFAULT,
  PUQTY  NUMBER(3)NKTNUL,
  
   CONSTRAINT pk_PUCH PRIMARY KEY (ACUSTOMID,GID),
   
    CONSTRAINT fk_PUCH_ACUSTOMER FOREIGN KEY(ACUSTOMID)
      REFERENCES ACUSTOMER(ACUSTOMID),
      
    CONSTRAINT fk_PUCH_GOODS FOREIGN KEY(GID)
      REFERENCES GOODS(GID));
      
      

      
   
  
 
            
            
            
            
      
  
  
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
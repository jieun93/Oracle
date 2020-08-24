2019-12-17)자료형
1. 문자자료형
   - 문자열 자료를 저장하기 위한 자료형
   - ' '로 묶어 표현
   - char, nchar, varchar, varchar2, long, clob
   - 한글 한글자는 3byte임
   1)char
   . 고정길이 문자열을 저장
   . 최대 2000 byte 까지 저장 가능
   . 기억공간이 남으면 남는 기억공간(오른쪽)은 공백 처리
   (사용형식)
   컬럼명 CHAR(크기[BYTEㅣCHAR])
    -'[BYTEㅣCHAR]'는 생략 가능, 생략하면 BYTE로 간주됨
    -한글을 저장할 때 2000 BYTE 를 초과하는 자료를 저장할수없음
    예)
    COL1 CHAR(50) => COL1의 기억공간은 50 BYTE
    NAME CHAR(20 BYTE) => NAME 기억장소(항목명,컬럼명)는 20 BYTE
    NAME CHAR(20 CHAR) => 한글은 60 BYTE/영문자는 20BYTE 저장되어진다.
    
    CREATE TABLE TEMP01(
      COL1 CHAR(20),
      COL2 CHAR(20 BYTE),
      COL3 CHAR(20 CHAR));
      
      
      INSERT INTO TEMP01(COL1,COL2,COL3) VALUES('ABCDEFG','대한민국','대한민국페루칠레,몽골,하노이,베트남!');
      
      SELECT * FROM TEMP01;
      
      SELECT LENGTHB(COL1), LENGTHB(COL2),LENGTHB(COL3)  FROM TEMP01;
      
      
      
    2)VARCHAR2
    .가변길이 문자열 저장
    .최대 4000 BYTE 까지 저장 가능
    .문자자료를 기억공간 왼쪽부터 저장하고 남는 기억공간은 잘라냄
    (사용형식)
    컬럼명 VARCHAR2(크기 [BYTEㅣCHAR])
    -'[BYTEㅣCHAR]'가 생략되면 BYTE로 간주
    -전체 크기 4000BYTE를초과할수없음
    예)
    COL1 VARCHAR2(20)=> 최대 20 BYTE 확보
    
    CREATE TABLE TEMP02(
      COL1 VARCHAR2(20),
      COL2 VARCHAR2(20 BYTE),
      COL3 VARCHAR2(20 CHAR));
      
      INSERT INTO TEMP02  VALUES('IL POSTINO','대전시','대전시 중구 대흥동 500번지 영민빌');
      INSERT INTO TEMP02  VALUES('PERSIMON','데이터베이스','대전시 중구 대흥동');
      
      SELECT * FROM TEMP02;
      SELECT * FROM TEMP01;
    
    SELECT LENGTHB(COL1),LENGTHB(COL2),LENGTHB(COL3) FROM TEMP02;
    
    
    
    3)varchar
    . varchar2와 동일한 형식으로 자료저장
    . Oracle에서 varchar2사용을 권고
    
    4)long
    . 가변길이 데이터 타입
    . 최대 2GB까지 사용 가능
    . 한 테이블에 하나의 항목만 long 타입으로 정의
    . 오라클에서 지원이 중단(clob로 대치)
    (사용형식)
    컬럼명 long
    
    예)
    create table temp03(
        coll long,
        col2 varchar2(4000));
        
        insert into temp03(col1,col2) values('boyhood','테이블 생성 예제');
        
        select * from temp03;
        
2.숫자자료형
-number 자료형이 존재
-실수, 정수 모두 표현가능함
(사용형식)
컬럼명 number[(정밀도(전체자리수)[,스케일(소수점이하의자리수)])]
**정밀도>스케일 경우
.표현 범위 :  1.0e(지수)-30 ~ 9.9999...99e125(소숫점이하는 38자리)
.스케일이 음수이면 정수부분의 스케일이 가르키는 자리수에 반올림
컬럼명 number 
컬럼명 number(50)
컬럼명 number(10,3) =>정수부문 7자리,소숫점이하3자리
컬럼명(*.3) 소수부분만 3자리,정수부문은 오라클 표현 범위내

예)
입력값              정의              기억되는 값
7,123,456.87      number            7,123,456.87
7,123,456.87      number(*,1)       7,123,456.9
7,123,456.87     number()           7,123,457
7,123,456.87     number(10)         7,123,457
7,123,456.87       number(6)        오류
7,123,456.87      number(9,-2)     7,123,500

        
    
    
   
2019-12-18
 ** 스케일>정밀도
 .정밀도는 0이 아닌 유효 숫자 자리수 의미
 .스케일-정밀도 값은 소숫점 이하에 존재해야 하는 '0'의 갯수를 의미
 ---------------------------------------------------------------
    입력값                 선언              저장되는 값
----------------------------------------------------------------
    1.234             number(4,5)            오류
    1.23              number(3,5)            오류
    0.01234           number(4,5)           0.01234  (5-4=1 영의 자리수 1개)
    0.0012345         number(3,5)           0.00123   (5-3=2 /유효자리수 3개여야 하고 소수점이하 전체 자리수는 5개숫자가 있어야 한다.)
-------------------------------------------------------------------------------------------------------------------------


3. 날짜 형 type (덧셈(앞으로의날짜)과 뺄셈(이전의 날짜)의대상이된다.)
 - date, timestamp,
 1)date
 .기본 날짜 자료형 (7 byte)
 .년 월 일 시 분 초의 값 저장
 .+,- 의 연산 가능
 (사용 형식 )
 컬러명  date
  - 시스템이 제공하는 날짜 정보는 sysdate  함수 이용,
  - 일반자료(숫자,문자열)를 날짜형으로 변환하기 위해서 to_date 함수가 제공 됨
  
  예)
  create table temp04(
    col1 date,
    col2 date);
  
  
  insert into temp04(col1, col2) values(sysdate, sysdate+20);
  
  select * from temp04;
  
  select to_char(col1,'yyyy-mm-dd hh24:mi:ss') from temp04;
  
  2)timestamp
  .오라클 버전 9i 이후 제공
  .10억분의 1초까지 제공 
  .timestamp, timestamp with time zone,timestamp with local time zone
  (1)timestamp
    -시간대(time zone)와 상관없이 날짜 시간 정보 저장
  (2)timestamp with time zone
   -시간대(time zone)와 날짜 시간 정보 저장
   (3)timestamp with local time zone
     -서버가 위칳한 지역의 시간대(time zone)와 날짜 시간 정보 저장
    (사용형식)
    컬럼명 timestamp[timestamp with time zoneㅣtimestamp with local time zone]
    
    예)
    create table temp05 (
    col1 date,
    col2 timestamp,
    col3 timestamp with time zone,
    col4 timestamp with local time zone);
    
    insert into temp05 ( col1, col2, col3, col4)
     values (sysdate,sysdate,sysdate,sysdate);
     
     select * from temp05;
     
     
    
  
  
  
  
  
  
 
 
 - 
    
 
 
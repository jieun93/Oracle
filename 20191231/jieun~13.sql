2019-12-31-02)변환함수
- 데이터의 형을 사용된위치에서 임시로 형 변환
- 연속적으로 함수를 변환하지는 않는다.
- cast, TO_DATE, to_char, to_number(문자열을 숫자로 바꿔주는것)

1)CAST
    -주어진 자료를 정의된 타입으로 형변환
    (사용형식)
    CAST(EXPR AS 타입)
    .'EXPR'로 정의된 자료를 '타입'으로 변환
    예)
    SELECT CAST (1234 AS CHAR(8)) FROM DUAL;
    
    예) 사원테이블에서 사원명을 CHAR(50)으로 변환하여 출력하시오.
    Alias 는 사원번호, 사원명, 전화번호이다.
    
    select employee_id||' '||emp_name||' '||phone_number,   
           employee_id||' '||cast(emp_name as char(30))||' '||phone_number
      from employees;        
    
    
    예)장바구니 테이블(cart)에서 장바구니번호에 날짜를 추출한 후 결제 마감일(3일 후)을 조회하시오
        (2005년 4월 1 ~ 10일 자료만 검색)
        Alias는 회원번호, 장바구니번호, 구매일, 결재종료일
        
        select cart_member as 회원번호, 
               cart_no as 장바구니번호, 
               cast(substr(cart_no,1,8) as date) as  구매일,/*to_date(substr(cart_no,1,8)) as 구매일*/
               cast(substr(cart_no,1,8) as date) + 3 as  결재종료일
         from cart
         where substr(cart_no,1,8 )>='20050401' and substr(cart_no,1,8 )<='20050410';
       --  where substr(cart_no,1,8 )between '20050401' and '20050410';
    
  2)to_char
  - 숫자, 문자열, 날짜 형식의 자료를 문자열 자료로 변환
  - 형식 문자열을 지정하여 format된 형식의 결과를 반환
  (사용형식)
 to_char(c1 [,fmt])
    .'fmt'는 출력하고자 하느 형식을 지정하는 형식지정 문자열
    .c1이 문자열인 경우 char, clob 타입을 varchar2 형식으로 변환
    
    
   ** 날짜 형식 지정 문자열
   ----------------------------------------------------
    형식문자열                          의 미                           
   ----------------------------------------------------    
   AD,CC,BC                           기원전/후
   YYYY,YYY,YY,Y                      년도
   Q                                  분기
   MONTH, MON,MM,RM                   월
   W, WW, IW                          주
   DD,DDD,J                           일
   DAY, DY, D                         요일
   AM, PM, A.M.,P.M.                  오전/오후
   HH, HH12,HH24                      시간 
   MI                                분
   SS,SSSSS                          초
   "  "                              사용자정의
   -----------------------------------------------------
    
    
    SELECT TO_CHAR(SYSDATE,'HH"시" MI"분"' )FROM DUAL;
    
    
    
    
    
    
    
    
    
    
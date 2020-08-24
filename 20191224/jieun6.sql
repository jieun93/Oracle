2019-12-24 3) LPAD,RPAD
-주어진 공간에 특정 문자(열)을 채움
(사용형식)
LPAD(c1, n [,c2])
RPAD(c1, n [,c2]) 
    . 'n'으로 지정된 길이에 c1을 채우고 남는 공간은 c2를 채워 반환
    . LPAD는 오른쪽부터 채움(왼쪽에 C2를 채움)
    . RPAD는 왼쪽부터 채움(오른쪽에 C2를 채움)
    . c2가 생략되면 공백 처리 됨
    . 기억장소의 크기 'n'이 c1보다 작은 경우 c1은 잘려 기억됨
    
예)
select LPAD('123',10,'*') from dual;
select LPAD('123',10) from dual;
select LPAD('12345678',5,'#') AS "컬럼" from dual;
select RPAD('12345678',5,'#') from dual;

예)장바구니 테이블(CART)에서 수량(cart_qty)를 5자리에 출력하되 오른쪽에 빈공간을 채우시오.
    단, 2005년 5월 판매정보만 조회하시오.
    Alias는 회원번호, 장바구니번호, 수량이다.
    
select cart_member as 회원번호,
        mem_name as 회원명,
        cart_no as 장바구니번호, 
        rpad(cart_qty,6) as 수량
        
    from cart, member
    where cart_no like '200505%'
        and cart_member= mem_id;
    
 4) LTRIM, RTRIM, TRIM
 - 문자열 좌,우에 발생됨 무효의 공백 제거에 주로 사용
 (사용형식)
 LRTIM(c1 [,c2])
 RTRIM(c1 [,c2])
 TRIM(c)
    - LRTIM, RTRIM 에서 c2가 기술되면 c1에서 c2를 찾아 제거
    - c2가 생략되면 공백을 제거
    - trim 은 양쪽 모두의 공백 제거
    - 데이터 내부의 공백은 함수 연산에 제외
    
예)
select ltrim('abccacd','a')from dual;
--맨 처음 만나는 a만 지운다.
select ltrim('  abcc  acd')from dual;
--왼쪽에 발생된 공백만 지운다.중간에 발생된 공백은 지울 수 없다.
--varchar2는 공백이 생기지 않는다.

5) SUBSTR
 - 부분 문자열을 추출하여반환
 (사용형식)
 SUBSTR(c1, m [,n])
    .주어진 문자열 c1에서 m번째에서 n개만큼의 문자를 추출하여 반환
    . 'n'이 생략되거나 'n'의 값이 문자열의 갯수보다 큰 경우 m 번째 이후의 모든 문자열 추출
    .m이 음수이면 뒤쪽부터(오른쪽) 처리 
    
    
  select substr('무궁화 꽃이 피었습니다', 2,3)as "컬럼" from dual;
                 1 2 34 56 78 9101112 
    select substr('무궁화 꽃이 피었습니다', 10,5)as "컬럼" from dual;
    select substr('무궁화 꽃이 피었습니다', 10) as "컬럼" from dual;
    select substr('무궁화 꽃이 피었습니다', -8,2) as "컬럼" from dual;
    
    
    
    예) 장바구니테이블(cart)에서 2005년 4월 판매가 발생된 날짜를 중복되지 않게 조회하시오.
    Alias는 판매일이다
    
    select distinct/*중복제거*/ substr(cart_no,1,8) 
        from cart
        where cart_no like '200504%';
    
        order by 1;
    
    
    예) 상품테이블에서 제품명에 '여성'으로 시작하는 제품을 조회하시오.
        Alias는 제품코드, 제품명, 매입가격, 거래처코드
        단, like연산자를 사용하지 말것
        
        select  prod_id as 제품코드,
                prod_name as 제품명,
                to_char(prod_cost,'9,999,990') as 매입가격,
                prod_buyer as 거래처코드
                
                from prod
                where substr (prod_name,1,2)='여성'; 
    
    
    
    
    
    
    
        
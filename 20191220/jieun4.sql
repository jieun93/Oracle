2019-12-20-01)select 문 
 - select 절에서 컬럼명 대신 '*'/*all이라는 뜻*/를 사용하면 모든 컬럼을 조회
 - where절이 생략되면 테이블 내의 모든 행을 조회
 예) 회원테이블(member)의 모든 회원의 모든 자료를 조회하시오.
 select * from member;
 
 예) 회원테이블(member)에서 회원번호, 회원명, 주소, 마일리지를 조회하시오.
 select mem_id as 회원번호, 
        mem_name as 회원명, 
        mem_add1 ||' '||mem_add2 as "주  소",
        mem_mileage  마일리지
    from member;
    
    예) 회원테이블(member)에서 거주지가 대전인회원의 회원번호, 회원명, 주소, 마일리지를 조회하시오.
    
  select mem_id as 회원번호, 
        mem_name as 회원명, 
        mem_add1 ||' '||mem_add2 as "주  소",
        mem_mileage  마일리지
    from member
    where mem_add1 like '대전%';
    
    예)회원테이블(member)에서 거주도시를 조회
    
    select distinct substr(mem_add1,1,2)
        from member;
        
   예) 상품테이블(prod)에서 거래처코드를 중복되지 않게 조회하시오.
   select prod_buyer as 거래처코드/**거래처코드별칭은 프롬,웨어절에서 사용x*/
    from prod ;
    
    예) 상품테이블(prod)에서 거래처코드를 중복되지 않게 조회하시오.
          select distinct prod_buyer as 거래처코드/**거래처코드별칭은 프롬,웨어절에서 사용x*/
    from prod 
    order by 1 desc; /*asc 는 큰값에서 작은값,desc 작은값에서 큰값*/
    
    
    1) where 절
    - 부여된 조건을 기술할때 사용한다.
    (사용형식)
    where  컬럼명 연산자 expr[and|or] [컬럼명 연산자 expr....]
    .'연산자' : 관계연산자 (>, <, =, >=, <=, !=(같지않다)(<>)
    
    예) 회원테이블에서 마일리지가 3000이상인 ㅎ회원을 조회하시오.
       Alias는 회원번호, 회원명, 직업, 마일리지
      
      select  mem_id as 회원번호, 
              mem_name as 회원명,
              mem_job as 직업, 
              mem_mileage as 마일리지
              
       from member
       where  mem_mileage>=3000;
    
    
       예) 회원테이블에서 마일리지가 3000이상인 ㅎ회원을 조회하되 마일리지가 큰사람부터 출력하시오.
       Alias는 회원번호, 회원명, 직업, 마일리지
       
      select  mem_id as 회원번호, --1
              mem_name as 회원명,--2
              mem_job as 직업, --3
              mem_mileage as 마일리지--4
              
       from member
       where  mem_mileage>=3000
       order by 4 /*mem_mileage*/ desc, 2;/*이름을기준으로 정렬*/;  /*오라클은 1부터 카운팅*/
       
       
       예)회원테이블에서 12월이 생일인 회원을 조회하시오.
       Alias는 회원번호, 회원명, 생년월일
       
       select  mem_id as 회원번호, 
              mem_name as 회원명, 
               mem_bir as 생년월일
           
           from member
           
           where extract(month from mem_bir) = 12;
           
        예)상품테이블에서 판매가가 10만원대인 상품을 조회하시오.
        Alias는 상품벊호, 상품명, 판매가
        
        select prod_id as 상품번호,
              prod_name as 상품명,
              prod_price as 판매가
            
              from prod
              where  prod_price>= 100000 and prod_price <= 199999;
             -- where not prod_price>= 100000 and prod_price <= 199999;
              --not를 사용하면 not을 제외한 나머지가 산출

       --이외범위지정방법
       --where prod_price>= 100000 and prod_price <= 199999;
       --where prod_price>= 100000 and prod_price <200000;
       --where prod_price between 100000 and 199999;      
              
              
              예) 상품테이블에서  거래처코드가  p10201 이거나 p30203인 상품정보를 조회하시오.
              Alias는 상품번호, 상품명, 매입가, 거래처 코드
              
              select prod_id as 상품번호,--띄어쓰기X,띄어쓰려면 " " 사용해야한다.
                     prod_name as 상품명,--띄어쓰기X,띄어쓰려면 " " 사용해야한다.
                     prod_cost as 매입가,--띄어쓰기X,띄어쓰려면 " " 사용해야한다.
                     prod_buyer as 거래처코드--띄어쓰기X,띄어쓰려면 " " 사용해야한다.
                                         
                    from prod 
                  where  prod_buyer = 'P10201' or  prod_buyer = 'P30203';  
                  /*비교하는 연산자에서는 데이터타입을 일치시켜야 한다.*/
                  
                  
                  
     2)논리연산자
     - and, or, not
     - and : 논리곱
     조건 1 and 조건 2 : '조건1'과 '조건2'가 참인경우만 전체 결과가 참
     - or : 논리합
     조건 1 or 조건 2 : '조건1'과 '조건2'이 중에서 하나라도 참이면 전체 결과가 참
     - not : 논리 부정
      not(!) 조건 :'조건'의 결과의 반대 값을 반환
     -수행 순서: /*1*/not->/*2*/and->/*3*/or /*무조건 순서대로 되야한다*/
     
     age >= 20 or age < 30 and gender='여자'
     
     3)기타연산자(in, any, some, all, EXISTS, between, like ...)
     (1)IN 연산자
     .주어진 자료 중 어느하나와 일치하면 전체 결과가 참을 반환
     (사용형식)
     컬럼명 IN(값1, 값2,....)
     - OR 연산자로 치환 가능
     
     
     예) 상품테이블에서 상품분류코드가 'P101', 'P201', 'P301'에 속한 자료를 조회하시오.
        Alias는 상품코드, 상품명, 분류코드, 판매가격이다.
        
        (OR 연산자 사용)
        SELECT PROD_ID AS 상품코드,
               PROD_NAME AS 상품명,
               PROD_LGU AS 분류코드,
               PROD_PRICE AS 판매가격
               
         FROM PROD
        
        WHERE PROD_LGU='P101' OR PROD_LGU='P201' OR PROD_LGU='P301';
        
        
        (IN 연산자 사용)/*관계연산자 사용X*/
        SELECT PROD_ID AS 상품코드,
               PROD_NAME AS 상품명,
               PROD_LGU AS 분류코드,
               PROD_PRICE AS 판매가격
               
         FROM PROD
        
        WHERE PROD_LGU IN ('P101','P201','P301');
    
    **IN, AND, SOME, ALL 연산자는 Subquery 와 자주 사용됨
    - IN 다음'( )'의 값이 미 확정인 경우
    
    예)상품테이블에서 사용된 분류코드와 분류명을 출력하시오.
   
            
     (2)ANY 연산자
     . 기능은 IN과 같다, 다만 사용형식이 다름
     (사용형식)
     컬럼명 관계연사자 ANY (값1, 값2,...)
     - IN 연산자를 ANY 로 변환하면 '=ANY'이다
     
       예) 상품테이블에서 상품분류코드가 'P101', 'P201', 'P301'에 속한 자료를 조회하시오.
        Alias는 상품코드, 상품명, 분류코드, 판매가격이다.
        
    (ANY 연산자 사용)/*관계연산자 사용O*/
    SELECT PROD_ID AS 상품코드,
               PROD_NAME AS 상품명,
               PROD_LGU AS 분류코드,
               PROD_PRICE AS 판매가격
               
         FROM PROD
        
        --WHERE PROD_LGU = ANY ('P101','P201','P301');    
        --WHERE PROD_LGU > ANY ('P101','P201','P301');/*P101보다 큰자료 출력*/         
              WHERE PROD_LGU > 'P101';
              
     (3) BETWEEN 연산자
     .범위를 지정할 때 사용
     . AND 연산자로 치환 가능
     (사용형식)
     컬럼명 BETWEEN 값1  AND 값2
     -'값1'에서 '값2' 범위를 지정
     
     
     예)회원테이블에서 나이가 40대인 회원을 조회하시오.
     Alias는 회원번호, 회원명, 나이, 생년월일
     
     (and연산자 이용 )
              
       select mem_id as 회원번호, 
             mem_name as 회원명,
            extract(year from sysdate) -extract(year from mem_bir) as 나이,
            -- round(sysdate-mem_bir)/365) as 나이, 
             mem_bir as 생년월일
       from member
       
       where extract(year from sysdate) -extract(year from mem_bir) >=40;
    
    
    
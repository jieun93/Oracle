2019-12-26-02) 숫자함수
1)수학적 함수
  -ABS, SIGN, POWER, SQRT,  
  (1)ABS(n)
   - n의 절대값을 반환
   (2)SIGN (n)
   - n의 부호에 따라 음수이면 -1, 양수이면 1,0 이면 0을 반환
   - 부호를 판단해준다.
   (3)POWER(e,y) 
   - e에 y승(e의 y번 거듭 곱한) 값 반환
   (4)SQRT(n)
   - n의 평방근 값 반환
   
   
   예) 회원테이블에서 회원의 나이가 50세 이상인 회원정보를 조회하시오.
   Alias는 회원번호, 회원명,주민번호,나이
   단, 나이는 주민번호를 이용하여 구하고 50세 이상인 회원의 구별은 sign함수를 사용하시오.
   
   select mem_id as 회원번호,
          mem_name as 회원명,
          mem_regno1 ||'-'||mem_regno2 as 주민번호,
          case when substr(mem_regno1,1,1)='0' then
            extract(year from sysdate)- ('20'||substr(mem_regno1,1,2))
        else 
             extract(year from sysdate)-('19'||substr(mem_regno1,1,2))
             end as 나이
             from member;
   
  예) 상품테이블에서 상품의 판매가가 10만원 초과이면 '고가상품',10만원이면 '적정상품',10만원 미만이면'저가상품'이라고 비고난에 출력하시오.
   
    select prod_id  상품번호,
            prod_name 상품이름,
            prod_price 판매가격,
            case when sign(prod_price-100000)=0 then '적정상품'
                 when sign(prod_price-100000)=1 then '고가상품'
            else '저가상품' end as "비고"
   
   from prod;
   
   
   
   예)20MB는 몇 byte인지 구하세요.(2의 10승 byte = 1KB, 2의 10승 KB는 1MB)
    => 1MB = (2의 10 X 2의 10) byte = > 2의 (10+10)승
    
    select to_char(20*power(2,20),'99,999,990')||'byte' from dual;

2) GREATEST, LEAST
    -주어진 값 중 제일 큰값과 제일 작은 값을 반환/*값을 정확하게 알고 있을때 사용*/
    (사용형식)
    .GREATEST(m1,m2,m3......) - 나열된 m1,m2,m3...중 가장 큰 값
    .LEAST(m1,m2,m3......) - 나열된 m1,m2,m3...중 가장 작은 값
    ** 하나의 컬럼에 저장된 값 중 최대/최소 값을 구할 때 => min(c), max(c) 사용
    
 예)
 select greatest('100','나','가')from dual;--'나'가 제일 큰값이다.
 
 예) 회원테이블에서 회원들이 보유하고 있는 마일리지를 조회하여 2000보다 작으면 2000으로
    변경하는 쿼리를 작성하시오.
    (마일리지가 2000 이하인 회원)
    
    select mem_name, mem_mileage
        from member
        where mem_mileage<2000;
        
    (2000미만인 회원의 마일리지 변경)
    select mem_name, mem_mileage
        from member
        where mem_mileage<2000;
        
        select mem_id, mem_name, greatest(mem_mileage, 2000)
        from member;
        
 
   
   
   
   
   
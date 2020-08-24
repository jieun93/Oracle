2020-01-02-01) 숫자변환함수
1)to_number
    - 숫자로 변환 가능한 문자열을 숫자형 자료로 변환
    (사용형식)
    to-number(c1 [,fmt])
    .'fnt'는 to_char의 숫자 변환 문자열과 동일
    .'c1'은 숫자변환 가능한 문자열
    
    예)
    select to_number('1234','0000')
    --,
        --    to_number(sysdate)
            --,
            --to_number('p101')
    from dual;
    
    
    select to_char(to_date(substr(cart_no,5,4),'mmdd'),'mm"월" dd"일"') as 판매일
    from cart;
    
 2) to_date
    - 날짜형식의 문자열을 date 형으로 변환
    (사용형식)
    .c1은 날짜로 변환 가능한 문자열
    .'fmt'는 to_char 함수의 날짜변환 문자열과 동일
    
    예) 
    select to_date('20201031'),
           to_date('20201031','yyyy/mm/dd'),
           to_char(to_date(20201031121231,'yyyymmddhh24miss'),'yyyy/mm/ddhh24:mi:ss'),
           to_date('20201129')
    from dual;
     
    ROLLBACK;
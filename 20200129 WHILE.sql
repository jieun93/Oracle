2020-01-29-03)
2)while 문
 - 조건을 부여하여 조건이 만족되면 반복을 수행하는 명령구조
 - 고급언어의 while문과 같은 기능 수행
 (사용형식)
 while 조건 loop
    명령문(들);
        :
 end loop;
 
 
 
 
예) 2005년 5월 상품별 입고수량을 출력하는 커서를 작성하시오.
     
     
     (상품별 입고수량을 출력)
 
  declare
      v_prod buyprod.buy_prod%type;
      v_prod_name  prod.prod_name%type;                                                    
      v_qty number:=0;
      v_res varchar2(100);
      
    cursor cur_buyprod_01
     is
    select buy_prod, prod_name, sum(buy_qty)
        from buyprod, prod
        where buy_date between '20050501' and '20050531'
        and buy_prod=prod_id
        group by buy_prod, prod_name
       order by 1;
    begin
    open cur_buyprod_01;
    dbms_output.put_line('------------------------------------------------------------------');
    dbms_output.put_line('상품코드                    상품명                      상품수량      ');
    dbms_output.put_line('------------------------------------------------------------------');
    fetch cur_buyprod_01 into v_prod, v_prod_name, v_qty;
    while cur_buyprod_01%found loop
       v_res := lpad(v_prod, 13, ' ')|| '   ' || rpad(v_prod_name, 40, ' ') || lpad(v_qty, 5, ' ');
       dbms_output.put_line(v_res);
        fetch cur_buyprod_01 into v_prod, v_prod_name, v_qty;
    end loop;
    
    close cur_buyprod_01;
end;

예) 키보드로 회원의 직업을 입력받아 해당직업을 가지고 있는 회원의 회원번호, 회원명, 마일리지를 출력하고
 맨 끝에 마일리지 합계를 출력하는 익명블록 작성(while 문 사용)

ACCEPT P_JOB PROMPT '회원 직업명:'
DECLARE
 V_MEM_ID MEMBER.MEM_ID%TYPE;
 V_MEM MEMBER.
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
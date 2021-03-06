2020-01-29-02)CURSOR
 - SELECT 문에 의해 영향 받은 행들의 집합
 - 커서는 묵시적커서(IMPLICITE CURSOR)와 명시적커서(EXPLICITE CURSOR)가 존재
 (1) 묵시적 커서
  - 시스템에 의해 자동으로 생성되는 커서
  - 커서 생성시 OPEN되고 생성이 완료되면 자동으로 CLOSE됨
  - 커서 속성
  ----------------------------------------------------------------------
      커서 속성                               내용
  ----------------------------------------------------------------------
     SQL%OPEN                    커서가 열린 상태이면 참(TRUE),
                                 묵시적 커서는 항상 FALSE임
    SQL%NOTFOUND                 커서내에 자료가 있으면 FALSE, 없으면 TRUE 
    SQL%FOUND                    커서내에 자료가 있으면 TRUE, 없으면 FALSE
    SQL%ROWCOUNT                 커서내의 자료의 수 (행의 수)
 ----------------------------------------------------------------------
 
 DECLARE
  V_ID EMPLOYEES.DEPARTMENT_ID%TYPE:=50;
BEGIN
  UPDATE EMPLOYEES
     SET SALARY = 5000
   WHERE DEPARTMENT_ID=V_ID;
   
  DBMS_OUTPUT.PUT_LINE('갱신된 레코드 수 : '||SQL%ROWCOUNT);
END;

ROLLBACK;
 SELECT * FROM LPROD;
 
 (2) 명시적 커서
    - 이름이 부여된 커서
    - 선언부 또는 FOR 문의 HEADER에서 정의
    (사용형식)
    CURSOR 커서명[(매개변수,매개변수,....])
    IS 
      SELECT 문;
     
 **커서사용  PROCESS
 i) 커서 정의
 ii) 커서 open
    . 커서를 사용하려면 반드시 사용 전 해당 커서를 open해야 함
     (사용형식)
     open 커서명[(매개변수, 매개변수, ....)];
 iii) fetch
 .open된 커서의 각 행의 값을 읽어옴
 .frtch문ㅇ느 반복문 안에 기술
 (사용형식)
 loop
  fetch 커서명 into 변수명,변수명,...
  exit when 커서명 %notfound;
   [명령문;]
   end loop;
   
 iv) 커서 close
    .사용이 종료된 커서는 반드시 닫아야 함
    (사용형식)
    close 커서명;
    
    예)장바구니 테이블에서 2005년 5월3일 판매정보를 출력하는 익명블록을 작성
     단 , 커서 사용
     
    declare
   
    v_member cart.cart_member%type;
    v_prod cart.cart_prod%type;
    v_qty cart.cart_qty%type;
    v_sum number := 0;
    
    cursor cur_cart_01(cp_date varchar2)
    is
        select cart_member, cart_prod, cart_qty 
          from cart
         where substr(cart_no, 1, 8) = cp_date;
    begin
      open cur_cart_01('20050503');
    
    loop
        fetch cur_cart_01 into v_member, v_prod, v_qty; --fetch 커서 정의문의 셀렉트절에 의존한다.
          exit when cur_cart_01%notfound;
          v_sum := v_sum + v_qty;
          
          dbms_output.put_line(v_member || ', ' || v_prod || ', ' ||v_qty);
    end loop;
    dbms_output.put_line('-----------------------------');
    dbms_output.put_line('전체 판매수량 : ' || v_sum);
    dbms_output.put_line('판매건수 : ' ||cur_cart_01%rowcount);
    
    close cur_cart_01;
end;
     
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
      dbms_output.put_line
      ('------------------------------------------------------------------');
    dbms_output.put_line('상품코드             상품명            상품수량      ');
     dbms_output.put_line
      ('------------------------------------------------------------------');
       loop
        fetch cur_buyprod_01 into v_prod, v_prod_name, v_qty;
          exit when cur_buyprod_01%notfound;
          
          v_res := lpad(v_prod, 13, ' ')|| '   ' || rpad(v_prod_name, 40, ' ') || lpad(v_qty, 5, ' ');
          dbms_output.put_line(v_res);
    end loop;
    
    close cur_buyprod_01;
end;
     
     
     
     
 
     
     
     
     
     
     
     
     
     
     
     
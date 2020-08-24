2020-01-29-01)반복문  view를 도출되어 있는 자료를 조작하기 위해 목적으로 사용하는게 반복문
1)LOOP문
 - 반복구조의 기본적인 형식 제공
 - java의 do 문과 비슷한 기능
 (사용형식)
 LOOP
   명령문(들);
   [EXIT WHEN  조건;]
   END LOOP;
   .'조건'이 참이면 반복을 벗어남
   
   예) 1~100까지 홀수의 합
   
   DECLARE
    V_CNT NUMBER:=0;
    V_RES NUMBER:=0;
   BEGIN
   LOOP
   V_CNT:=V_CNT+1;
   EXIT WHEN V_CNT>100;
   IF MOD (V_CNT,2)<>0 THEN
      V_RES:=V_RES+V_CNT;
   END IF;
   END LOOP;
   
   DBMS_OUTPUT.PUT_LINE('홀수의 합 = '||V_RES);
   END;
   
   
   예) 구구단의 5단을 출력해보자.
   DECLARE
    V_CNT NUMBER:=1;
    V_RES NUMBER:=0;
   BEGIN
   LOOP
    V_RES:=V_CNT*5;
    EXIT WHEN V_CNT>9;
    DBMS_OUTPUT.PUT_LINE(5||'*'||V_CNT||' = '||V_RES);
    DBMS_OUTPUT.PUT_LINE(5||'*'||V_CNT||' = '||V_RES);
    V_CNT:=V_CNT+1;
    END LOOP;
   END;
   
   예) 첫날에 100원, 2일 부터 전날에 2배씩 저축할때 최초로 300만원을 넘는 날까지 경과된
       일수와 그떄까지 저축한 금액을 LOOP문을 이용하여 구하시오.
       
   declare
    v_days number := 1; -- 날 수
    v_amt number := 100; -- 해당 날짜에 저축할 금액
    v_sum number := 0; -- 전체 저축한 금액 합계
  begin
    loop
    v_sum := v_sum + v_amt ;
    exit when v_sum > 3000000;
    v_amt := v_amt * 2;
    v_days := v_days + 1;
  end loop;
   dbms_output.put_line('날수 : ' || v_days);
   dbms_output.put_line('금액 : ' || v_sum);
end;
   
   
   
   
   
   
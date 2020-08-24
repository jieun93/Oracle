2020-01-29-02)CURSOR
 - SELECT ���� ���� ���� ���� ����� ����
 - Ŀ���� ������Ŀ��(IMPLICITE CURSOR)�� �����Ŀ��(EXPLICITE CURSOR)�� ����
 (1) ������ Ŀ��
  - �ý��ۿ� ���� �ڵ����� �����Ǵ� Ŀ��
  - Ŀ�� ������ OPEN�ǰ� ������ �Ϸ�Ǹ� �ڵ����� CLOSE��
  - Ŀ�� �Ӽ�
  ----------------------------------------------------------------------
      Ŀ�� �Ӽ�                               ����
  ----------------------------------------------------------------------
     SQL%OPEN                    Ŀ���� ���� �����̸� ��(TRUE),
                                 ������ Ŀ���� �׻� FALSE��
    SQL%NOTFOUND                 Ŀ������ �ڷᰡ ������ FALSE, ������ TRUE 
    SQL%FOUND                    Ŀ������ �ڷᰡ ������ TRUE, ������ FALSE
    SQL%ROWCOUNT                 Ŀ������ �ڷ��� �� (���� ��)
 ----------------------------------------------------------------------
 
 DECLARE
  V_ID EMPLOYEES.DEPARTMENT_ID%TYPE:=50;
BEGIN
  UPDATE EMPLOYEES
     SET SALARY = 5000
   WHERE DEPARTMENT_ID=V_ID;
   
  DBMS_OUTPUT.PUT_LINE('���ŵ� ���ڵ� �� : '||SQL%ROWCOUNT);
END;

ROLLBACK;
 SELECT * FROM LPROD;
 
 (2) ����� Ŀ��
    - �̸��� �ο��� Ŀ��
    - ����� �Ǵ� FOR ���� HEADER���� ����
    (�������)
    CURSOR Ŀ����[(�Ű�����,�Ű�����,....])
    IS 
      SELECT ��;
     
 **Ŀ�����  PROCESS
 i) Ŀ�� ����
 ii) Ŀ�� open
    . Ŀ���� ����Ϸ��� �ݵ�� ��� �� �ش� Ŀ���� open�ؾ� ��
     (�������)
     open Ŀ����[(�Ű�����, �Ű�����, ....)];
 iii) fetch
 .open�� Ŀ���� �� ���� ���� �о��
 .frtch������ �ݺ��� �ȿ� ���
 (�������)
 loop
  fetch Ŀ���� into ������,������,...
  exit when Ŀ���� %notfound;
   [��ɹ�;]
   end loop;
   
 iv) Ŀ�� close
    .����� ����� Ŀ���� �ݵ�� �ݾƾ� ��
    (�������)
    close Ŀ����;
    
    ��)��ٱ��� ���̺��� 2005�� 5��3�� �Ǹ������� ����ϴ� �͸����� �ۼ�
     �� , Ŀ�� ���
     
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
        fetch cur_cart_01 into v_member, v_prod, v_qty; --fetch Ŀ�� ���ǹ��� ����Ʈ���� �����Ѵ�.
          exit when cur_cart_01%notfound;
          v_sum := v_sum + v_qty;
          
          dbms_output.put_line(v_member || ', ' || v_prod || ', ' ||v_qty);
    end loop;
    dbms_output.put_line('-----------------------------');
    dbms_output.put_line('��ü �Ǹż��� : ' || v_sum);
    dbms_output.put_line('�ǸŰǼ� : ' ||cur_cart_01%rowcount);
    
    close cur_cart_01;
end;
     
     ��) 2005�� 5�� ��ǰ�� �԰������ ����ϴ� Ŀ���� �ۼ��Ͻÿ�.
     
     
     (��ǰ�� �԰������ ���)
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
    dbms_output.put_line('��ǰ�ڵ�             ��ǰ��            ��ǰ����      ');
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
     
     
     
     
 
     
     
     
     
     
     
     
     
     
     
     
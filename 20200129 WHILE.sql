2020-01-29-03)
2)while ��
 - ������ �ο��Ͽ� ������ �����Ǹ� �ݺ��� �����ϴ� ��ɱ���
 - ��޾���� while���� ���� ��� ����
 (�������)
 while ���� loop
    ��ɹ�(��);
        :
 end loop;
 
 
 
 
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
    dbms_output.put_line('------------------------------------------------------------------');
    dbms_output.put_line('��ǰ�ڵ�                    ��ǰ��                      ��ǰ����      ');
    dbms_output.put_line('------------------------------------------------------------------');
    fetch cur_buyprod_01 into v_prod, v_prod_name, v_qty;
    while cur_buyprod_01%found loop
       v_res := lpad(v_prod, 13, ' ')|| '   ' || rpad(v_prod_name, 40, ' ') || lpad(v_qty, 5, ' ');
       dbms_output.put_line(v_res);
        fetch cur_buyprod_01 into v_prod, v_prod_name, v_qty;
    end loop;
    
    close cur_buyprod_01;
end;

��) Ű����� ȸ���� ������ �Է¹޾� �ش������� ������ �ִ� ȸ���� ȸ����ȣ, ȸ����, ���ϸ����� ����ϰ�
 �� ���� ���ϸ��� �հ踦 ����ϴ� �͸��� �ۼ�(while �� ���)

ACCEPT P_JOB PROMPT 'ȸ�� ������:'
DECLARE
 V_MEM_ID MEMBER.MEM_ID%TYPE;
 V_MEM MEMBER.
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
2020-01-29-01)�ݺ���  view�� ����Ǿ� �ִ� �ڷḦ �����ϱ� ���� �������� ����ϴ°� �ݺ���
1)LOOP��
 - �ݺ������� �⺻���� ���� ����
 - java�� do ���� ����� ���
 (�������)
 LOOP
   ��ɹ�(��);
   [EXIT WHEN  ����;]
   END LOOP;
   .'����'�� ���̸� �ݺ��� ���
   
   ��) 1~100���� Ȧ���� ��
   
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
   
   DBMS_OUTPUT.PUT_LINE('Ȧ���� �� = '||V_RES);
   END;
   
   
   ��) �������� 5���� ����غ���.
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
   
   ��) ù���� 100��, 2�� ���� ������ 2�辿 �����Ҷ� ���ʷ� 300������ �Ѵ� ������ �����
       �ϼ��� �׋����� ������ �ݾ��� LOOP���� �̿��Ͽ� ���Ͻÿ�.
       
   declare
    v_days number := 1; -- �� ��
    v_amt number := 100; -- �ش� ��¥�� ������ �ݾ�
    v_sum number := 0; -- ��ü ������ �ݾ� �հ�
  begin
    loop
    v_sum := v_sum + v_amt ;
    exit when v_sum > 3000000;
    v_amt := v_amt * 2;
    v_days := v_days + 1;
  end loop;
   dbms_output.put_line('���� : ' || v_days);
   dbms_output.put_line('�ݾ� : ' || v_sum);
end;
   
   
   
   
   
   
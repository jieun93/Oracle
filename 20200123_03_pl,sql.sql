2020-01-23-03)PL/SQL(Procedual Language SQL)
  - ǥ�� SQL�� ������ ����, ��, �б�, �ݺ� ���� ����� �߰��� SQL
  - block������ �����Ǿ� ���ȭ, ĸ��ȭ ��ɵ� ����
  - dbms �� �̸� �������Ͽ� �����ϰ� ����� ȣ���ϱ� ������ ���� ó���ӵ�
  - ���� � ǥ���� ����
  - �� dbms�� ���� ������ �������
  - Anonymous block, stored procedure, user function, package, trigger
  1) Anonymous block(�͸���)--�̸� ����x, ���� �� �� ����, ������� �ʴ´�.
    . �⺻��� ���� 
    . �̸��� ���� ���
    (����)
  DECLARE
    ����� - ����(V_), ���(C_�̸�), Ŀ�� ���� /�Ű����� (P_)
  BEGIN 
    ����� - �����Ͻ� ������ �����ϴ� QUERY
    
    [EXCEPTION
        ����ó�� ����]--���� ����
        
 END;--������ �κ�       
  -- �Ǵ�  /; �� ������ ��쵵 ����  
     
     
     DECLARE
      v_num number:=10000;
      v_message varchar2(50);
   begin
      v_message:='���� ù��° PL/SQL ���';
      
      DBMS_OUTPUT.PUT_LINE(V_MESSAGE||' '||V_NUM);
      END;
    -- ��,�ҹ��� ���� ���Ѵ�.
    
    ACCEPT V_NAME PROMPT '�� �̸� : '
    DECLARE
      V_MESS VARCHAR2(100);
      V_ADD VARCHAR2(70):='������ �߱� ���ﵿ';
    BEGIN
      V_MESS:= '&V_NAME'||',  '||V_ADD;
      DBMS_OUTPUT.PUT_LINE(V_MESS);
   END;   
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
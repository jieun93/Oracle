2019-12-19-02)�ڷ� ����
 - UPDATE ������ ����
 (�������)
 
 UPDATE ���̺��
   SET �÷���=��,
       �÷���=��,...
 [WHERE ����];--��������������ִ� WHERE ���� �����Ǹ� �� ����ȴ�.
 
 
 ��)��ǰ���̺���'���������콺'(P10101)���ǸŰ��� 20000������ �����Ͻÿ�.

 UPDATE GOODS
   SET  GPRICE = 20000
 WHERE GNAME LIKE '����%';  
   
   SELECT * FROM GOODS;
   
ROLLBACK;
 
 
   �ŷ�ó��ȣ : 'A102'
        �ŷ�ó�� : '�ֽ�ȸ�� A2M'
        �ŷ�ó�ּ� : '������ ������ ������ 123 ��ũ�� 4�� 67'
        ��ǥ�ڸ� : 
   
   INSERT INTO ACUSTOMER VALUES('A102','�ֽ�ȸ�� A2M','������ ������ ������ 123 ��ũ�� 4�� 67','');
    SELECT * FROM ACUSTOMER; 
    
    COMMIT
    
    
     �ŷ�ó��ȣ : 'A202'
        �ŷ�ó�� : '(��) ����ý�'
        �ŷ�ó�ּ� : '������ ����� ���� 123-45'
        ��ǥ�ڸ� : 
    
   
   INSERT INTO  ACUSTOMER (ACUSTOMID,ACUSTNAME,ACUSADDR)
    VALUES ('A202','(��) ����ý�', '������ ����� ���� 123-45');
                  
      SELECT * FROM ACUSTOMER; 
    
    
     �ŷ�ó��ȣ : 'A203'
        �ŷ�ó�� : '(��)����Ʈ ����'
        �ŷ�ó�ּ� : 
        ��ǥ�ڸ� : '�����'
        
        INSERT INTO ACUSTOMER(ACUSTOMID,ACUSTNAME,ACEONAME) VALUES ('A203', '(��)����Ʈ ����','�����');
       SELECT * FROM ACUSTOMER; 
       
   ��ǰ��ȣ : 'P10101'
   ��ǰ�� : '���� �� ���콺'
   ���� : 15000��
   �ŷ�ó : �ֽ�ȸ�� A2M
   
    INSERT INTO GOODS(GID,GNAME,GPRICE,ACUSTOMID) 
      VALUES('P10101','���� �� ���콺',15000,'A102');
      
      SELECT * FROM GOODS;
   COMMIT   
      
   ��ǰ��ȣ : 'P10201'
   ��ǰ�� : 'MS OFFICES 2018'
   ���� : 35000��
   �ŷ�ó : (��)����Ʈ ����
   
   INSERT INTO GOODS(GID,GNAME,GPRICE,ACUSTOMID)
    VALUES('P10201','MS OFFICES 2018',35000,'A203');
   
    SELECT * FROM GOODS;
   
    COMMIT--������Ű�°� �ڷᰡ ���ư��� �ʵ���
    
    
    
    ����)ȸ�����̺� (MEMBER)���� ����(MEM_JOB)�� '�л�'�� ȸ���� ���ϸ����� ��� 3000����
        �����Ͻÿ�.
        
        SELECT MEM_NAME,MEM_MILEAGE,MEM_PASS
          FROM MEMBER
          WHERE MEM_JOB='�л�';
        
        UPDATE MEMBER 
         SET MEM_MILEAGE = 3000,
             MEM_PASS='AAA'
         WHERE MEM_JOB='�л�';
         
         ROLLBACK;
         
         
         
         
         
        
    
      
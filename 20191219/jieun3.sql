2019-12-19-01)�ڷ� �Է�
 - INSERT ������ ����
  (�������)
  INSERT INTO ���̺�� [ (�÷���,�÷���,...)] VALUES (��,��,...);
  .'(�÷���,�÷���,...)' �� ���� ������ �����ϸ� ���̺� �����ϴ� ��� Į���� ����� ���� VALUES ������ ��� �ؾ���.
  .'(�÷���,�÷���,...)'�� �����Ǹ� �� (������)�� ��� �ϴ� ������ ���̺� ����  �÷������� ��ġ�ؾ� ��.
  .'(�÷���,�÷���,...)'�� ��� �Ǹ� ����� ������ ���߾� �ش� �÷��� �����  ���� ��� ����. 
    ��, �÷��� NOT NULL�� ����Ǿ� ������ ������ �� ����.
   
   
   
  ��) ���� �־��� �ڷḦ �ŷ�ó���̺�(ACUSTOMER)�� �����ϴ� ���� �ۼ�
        [�ڷ�]
        �ŷ�ó��ȣ : 'A101'
        �ŷ�ó�� : '�ﺸ��ǻ�� �ֽ�ȸ��'
        �ŷ�ó�ּ� : '����� �������� ���2�� 123-4567'
        ��ǥ�ڸ� : '�̻ﺸ'
        
 INSERT INTO ACUSTOMER(ACUSTOMID,ACUSTNAME,ACUSADDR,ACEONAME)
   VALUES ('A101','�ﺸ��ǻ�� �ֽ�ȸ��','����� �������� ���2�� 123-4567','�̻ﺸ');
             
   SELECT * FROM ACUSTOMER;      
        
        �ŷ�ó��ȣ : 'A102'
        �ŷ�ó�� : '�ֽ�ȸ�� A2M'
        �ŷ�ó�ּ� : '������ ������ ������ 123 ��ũ�� 4�� 67'
        ��ǥ�ڸ� : 
   
   INSERT INTO ACUSTOMER VALUES('A102','�ֽ�ȸ�� A2M','������ ������ ������ 123 ��ũ�� 4�� 67','');
    SELECT * FROM ACUSTOMER; 
    
    
    
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
       
  ����]��ǰ���̺�(GOODS)�� �����ڷḦ �Է��Ͻÿ�.
   [�ڷ�]
   ��ǰ��ȣ : 'P10101'
   ��ǰ�� : '���� �� ���콺'
   ���� : 15000��
   �ŷ�ó : �ֽ�ȸ�� A2M
   
 INSERT INTO GOODS(GID,GNAME,GPRICE,ACUSTOMID) 
      VALUES('P10101','���� �� ���콺',15000,'A102');
      
      SELECT * FROM GOODS;
   
   
   
   ��ǰ��ȣ : 'P10201'
   ��ǰ�� : 'MS OFFICES 2018'
   ���� : 35000��
   �ŷ�ó : (��)����Ʈ ����
   
   INSERT INTO GOODS(GID,GNAME,GPRICE,ACUSTOMID)
   
    VALUES('P10201','MS OFFICES 2018',35000,'A203');
    SELECT * FROM GOODS;
    
 ** ��ǰ���̺��� ���������콺�� ��ǰ�� ȸ���� ��ǥ�ڸ� ��ȸ�Ͻÿ�.
 SELECT B.ACUSTNAME AS ȸ���,
        B.ACEONAME AS ��ǥ��
  FROM GOODS A, ACUSTOMER B
  WHERE A.ACUSTOMID=B.ACUSTOMID
    AND A.GNAME LIKE '����%';
    
    
    
    
 
  
  
  
  
  
  
  
  
  
      
      
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
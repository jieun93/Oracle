2019-12-18-2)���̺� ���� ���
- create ���� ���� ���̺� ��ü ����
- ���̺��� ��� ���� ���� (���� �ϳ��̻� �����ؾ� �Ѵ�./�������������ʾƵ��������)
- ���̺� �����̽����� ���̺���� �����ؾ� ��
- ���̺��� �ٸ��� ������ �÷��� ��� ����

(�������)
    create table ���̺��(�ʼ�����)(
    �÷���  ������Ÿ��[(ũ��)]  [default(�⺻���� ����Ǿ����� ��) expr] [null��not null],
                                    :
    �÷���  ������Ÿ��[(ũ��)]  [default expr] [null��not null],
    
    **�ϱ��ؾ���** �Ķ��۾��� �����Ǿ� ���Ǵ� �����/�⺻Ű�������׸����θ��������','�� ����
    
    [constraint �⺻Ű������(�ߺ����x)  primary key (�÷���[,�÷���...]),
     constraint �ܷ�Ű������(�ߺ����x)  foreign key (�÷���[,�÷���...]),
        references �ܺ����̺�� (�÷���[,�÷���...]),
                                :
    constraint �ܷ�Ű������  foreign key (�÷���[,�÷���...]),
      references �ܺ����̺�� (�÷���[,�÷���...])),
 
��) ABC ���θ��� �䱸���� �м�

    1) ��ǰ�� [��ǰ��ȣ],��ǰ��,����,�ŷ�ó ��ȣ ������ ������ ����(GOODS)
        - ��ǰ��ȣ : �������� ���ڿ� 6�ڸ�,(GID)
        - ��ǰ�� : �������� ���ڿ� 50�ڸ�(GNAME)
        - ���� : ���� 7�ڸ� (GPRICE)
        - �ŷ�ó��ȣ : �������� ���ڿ� 4�ڸ� (CUSTOMER)
        
    2) ȸ���� [ȸ����ȣ],ȸ����,�ּ�,��ȭ��ȣ��  ������ ���� (CUSTOMER)
        -ȸ����ȣ : �������� ���ڿ� 4�ڸ� (CUSID)
        -ȸ���� : �������� ���ڿ� 30 (CUNAME)
        -�ּ� : �������� ���ڿ� 100 (CUSADDR)
        -��ȭ��ȣ : �������� ���ڿ� 30 (CUSTELNO)
    
    3) �ŷ�ó�� [�ŷ�ó��ȣ],�ŷ�ó��,�ּ�,��ǥ�ڸ��� ������ ���� (ACUSTOMER)
     - �ŷ�ó ��ȣ : �������� ���ڿ� 4�ڸ�  (ACUSTOMID)
     - �ŷ�ó�� : �������� ���ڿ� 50 (ACUSTNAME)
     - �ּ� : �������� ���ڿ� 100 (ACUSADDR)
     - ��ǥ�ڸ� : �������� ���ڿ� 30 (ACEONAME)
    
    4) ��ٱ��ϴ� [ȸ����ȣ,��ǰ��ȣ],��¥,�������� ���� (SHCART)
        -��¥ :SHDATE
        -���� (SHQTY)
    
    5) ������ [�ŷ�ó��ȣ,��ǰ��ȣ],��¥,�������� ����(PUCH)
        -��¥ (PUDATE)
        -���� (PUQTY)
        
        /* ����Ŭ �ּ� 
        */
    -- ����Ŭ�ּ�
    
    ���� �䱸������ ���� ���� ���̺��� �����Ͻÿ�
    
    
    **�ŷ�ó ���̺� ����

CREATE TABLE ACUSTOMER(
    ACUSTOMID CHAR(4) NOT NULL,--�⺻Ű
    ACUSTNAME VARCHAR2(50) NOT NULL,
    ACUSADDR VARCHAR2(100),
    ACEONAME VARCHAR2(30),
    
    CONSTRAINT pk_acustomer PRIMARY KEY(ACUSTOMID));
    
--��ǰ���̺� ����

CREATE TABLE GOODS(
  GID CHAR(6) NOT NULL,--�⺻Ű
  GNAME VARCHAR2(50) NOT NULL,
  GPRICE NUMBER(7) NOT NULL,
  ACUSTOMID CHAR(4) NOT NULL,--�ܷ�Ű
  
 CONSTRAINT pk_goods PRIMARY KEY(GID),
 CONSTRAINT fk_goods_acustomer FOREIGN KEY(ACUSTOMID)
  REFERENCES ACUSTOMER(ACUSTOMID));
  
  
  DROP TABLE GOODS;
  
  ---ȸ�����̺����
  
  CREATE TABLE CUSTOMER(
     CUSID CHAR (4) NOT NULL,--�⺻Ű
     CUNAME  VARCHAR2(30) NOT NULL,
     CUSADDR VARCHAR2(100) NOT NULL,
     CUSTELNO NUMBER(30 )NOT NULL,
     
     CONSTRAINT pk_CUSTOMER PRIMARY KEY( CUSID));
     
 ---��ٱ��� ���̺� ����
 
  CREATE TABLE SHCART(
    CUSID CHAR (4) NOT NULL,--�ܷ�Ű&�⺻Ű
    GID CHAR(6) NOT NULL,-�ܷ�Ű&�⺻Ű
    SHDATE  DATE NOT NULL,
    SHQTV  NUMBER(3)  DEFAULT 0 ,
     
     CONSTRAINT pk_SHCART PRIMARY KEY (CUSID,GID),
     
     CONSTRAINT fk_SHCART_CUSTOMER FOREIGN KEY(CUSID)
      REFERENCES CUSTOMER(CUSID),
      
      CONSTRAINT fk_SHCART_goods FOREIGN KEY(GID)
            REFERENCES GOODS(GID));
            
            
-----�������̺����

CREATE TABLE  PUCH(
  ACUSTOMID CHAR(4) NOT NULL,
  GID CHAR(6) NOT NULL,
  PUDATE DATE DEFFAULT,
  PUQTY  NUMBER(3)NKTNUL,
  
   CONSTRAINT pk_PUCH PRIMARY KEY (ACUSTOMID,GID),
   
    CONSTRAINT fk_PUCH_ACUSTOMER FOREIGN KEY(ACUSTOMID)
      REFERENCES ACUSTOMER(ACUSTOMID),
      
    CONSTRAINT fk_PUCH_GOODS FOREIGN KEY(GID)
      REFERENCES GOODS(GID));
      
      

      
   
  
 
            
            
            
            
      
  
  
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
2019-12-17)�ڷ���
1. �����ڷ���
   - ���ڿ� �ڷḦ �����ϱ� ���� �ڷ���
   - ' '�� ���� ǥ��
   - char, nchar, varchar, varchar2, long, clob
   - �ѱ� �ѱ��ڴ� 3byte��
   1)char
   . �������� ���ڿ��� ����
   . �ִ� 2000 byte ���� ���� ����
   . �������� ������ ���� ������(������)�� ���� ó��
   (�������)
   �÷��� CHAR(ũ��[BYTE��CHAR])
    -'[BYTE��CHAR]'�� ���� ����, �����ϸ� BYTE�� ���ֵ�
    -�ѱ��� ������ �� 2000 BYTE �� �ʰ��ϴ� �ڷḦ �����Ҽ�����
    ��)
    COL1 CHAR(50) => COL1�� �������� 50 BYTE
    NAME CHAR(20 BYTE) => NAME ������(�׸��,�÷���)�� 20 BYTE
    NAME CHAR(20 CHAR) => �ѱ��� 60 BYTE/�����ڴ� 20BYTE ����Ǿ�����.
    
    CREATE TABLE TEMP01(
      COL1 CHAR(20),
      COL2 CHAR(20 BYTE),
      COL3 CHAR(20 CHAR));
      
      
      INSERT INTO TEMP01(COL1,COL2,COL3) VALUES('ABCDEFG','���ѹα�','���ѹα����ĥ��,����,�ϳ���,��Ʈ��!');
      
      SELECT * FROM TEMP01;
      
      SELECT LENGTHB(COL1), LENGTHB(COL2),LENGTHB(COL3)  FROM TEMP01;
      
      
      
    2)VARCHAR2
    .�������� ���ڿ� ����
    .�ִ� 4000 BYTE ���� ���� ����
    .�����ڷḦ ������ ���ʺ��� �����ϰ� ���� �������� �߶�
    (�������)
    �÷��� VARCHAR2(ũ�� [BYTE��CHAR])
    -'[BYTE��CHAR]'�� �����Ǹ� BYTE�� ����
    -��ü ũ�� 4000BYTE���ʰ��Ҽ�����
    ��)
    COL1 VARCHAR2(20)=> �ִ� 20 BYTE Ȯ��
    
    CREATE TABLE TEMP02(
      COL1 VARCHAR2(20),
      COL2 VARCHAR2(20 BYTE),
      COL3 VARCHAR2(20 CHAR));
      
      INSERT INTO TEMP02  VALUES('IL POSTINO','������','������ �߱� ���ﵿ 500���� ���κ�');
      INSERT INTO TEMP02  VALUES('PERSIMON','�����ͺ��̽�','������ �߱� ���ﵿ');
      
      SELECT * FROM TEMP02;
      SELECT * FROM TEMP01;
    
    SELECT LENGTHB(COL1),LENGTHB(COL2),LENGTHB(COL3) FROM TEMP02;
    
    
    
    3)varchar
    . varchar2�� ������ �������� �ڷ�����
    . Oracle���� varchar2����� �ǰ�
    
    4)long
    . �������� ������ Ÿ��
    . �ִ� 2GB���� ��� ����
    . �� ���̺� �ϳ��� �׸� long Ÿ������ ����
    . ����Ŭ���� ������ �ߴ�(clob�� ��ġ)
    (�������)
    �÷��� long
    
    ��)
    create table temp03(
        coll long,
        col2 varchar2(4000));
        
        insert into temp03(col1,col2) values('boyhood','���̺� ���� ����');
        
        select * from temp03;
        
2.�����ڷ���
-number �ڷ����� ����
-�Ǽ�, ���� ��� ǥ��������
(�������)
�÷��� number[(���е�(��ü�ڸ���)[,������(�Ҽ����������ڸ���)])]
**���е�>������ ���
.ǥ�� ���� :  1.0e(����)-30 ~ 9.9999...99e125(�Ҽ������ϴ� 38�ڸ�)
.�������� �����̸� �����κ��� �������� ����Ű�� �ڸ����� �ݿø�
�÷��� number 
�÷��� number(50)
�÷��� number(10,3) =>�����ι� 7�ڸ�,�Ҽ�������3�ڸ�
�÷���(*.3) �Ҽ��κи� 3�ڸ�,�����ι��� ����Ŭ ǥ�� ������

��)
�Է°�              ����              ���Ǵ� ��
7,123,456.87      number            7,123,456.87
7,123,456.87      number(*,1)       7,123,456.9
7,123,456.87     number()           7,123,457
7,123,456.87     number(10)         7,123,457
7,123,456.87       number(6)        ����
7,123,456.87      number(9,-2)     7,123,500

        
    
    
   
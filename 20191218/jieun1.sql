2019-12-18
 ** ������>���е�
 .���е��� 0�� �ƴ� ��ȿ ���� �ڸ��� �ǹ�
 .������-���е� ���� �Ҽ��� ���Ͽ� �����ؾ� �ϴ� '0'�� ������ �ǹ�
 ---------------------------------------------------------------
    �Է°�                 ����              ����Ǵ� ��
----------------------------------------------------------------
    1.234             number(4,5)            ����
    1.23              number(3,5)            ����
    0.01234           number(4,5)           0.01234  (5-4=1 ���� �ڸ��� 1��)
    0.0012345         number(3,5)           0.00123   (5-3=2 /��ȿ�ڸ��� 3������ �ϰ� �Ҽ������� ��ü �ڸ����� 5�����ڰ� �־�� �Ѵ�.)
-------------------------------------------------------------------------------------------------------------------------


3. ��¥ �� type (����(�������ǳ�¥)�� ����(������ ��¥)�Ǵ���̵ȴ�.)
 - date, timestamp,
 1)date
 .�⺻ ��¥ �ڷ��� (7 byte)
 .�� �� �� �� �� ���� �� ����
 .+,- �� ���� ����
 (��� ���� )
 �÷���  date
  - �ý����� �����ϴ� ��¥ ������ sysdate  �Լ� �̿�,
  - �Ϲ��ڷ�(����,���ڿ�)�� ��¥������ ��ȯ�ϱ� ���ؼ� to_date �Լ��� ���� ��
  
  ��)
  create table temp04(
    col1 date,
    col2 date);
  
  
  insert into temp04(col1, col2) values(sysdate, sysdate+20);
  
  select * from temp04;
  
  select to_char(col1,'yyyy-mm-dd hh24:mi:ss') from temp04;
  
  2)timestamp
  .����Ŭ ���� 9i ���� ����
  .10����� 1�ʱ��� ���� 
  .timestamp, timestamp with time zone,timestamp with local time zone
  (1)timestamp
    -�ð���(time zone)�� ������� ��¥ �ð� ���� ����
  (2)timestamp with time zone
   -�ð���(time zone)�� ��¥ �ð� ���� ����
   (3)timestamp with local time zone
     -������ ������ ������ �ð���(time zone)�� ��¥ �ð� ���� ����
    (�������)
    �÷��� timestamp[timestamp with time zone��timestamp with local time zone]
    
    ��)
    create table temp05 (
    col1 date,
    col2 timestamp,
    col3 timestamp with time zone,
    col4 timestamp with local time zone);
    
    insert into temp05 ( col1, col2, col3, col4)
     values (sysdate,sysdate,sysdate,sysdate);
     
     select * from temp05;
     
     
    
  
  
  
  
  
  
 
 
 - 
    
 
 
2020-01-22-03)sequence ��ü
 - �ڵ������� ����, �����ϴ� ���� ��ȯ�ϴ� ��ü
 - ���̺� ���������� �����ǹǷ� ���� ���̺��� ��� ����
 - ���̺� ����� ������ pk�� ���� ��� ����ϰų�
 ��������� �����Ǵ� ���� �ʿ��� ��� ���
 - �ٸ� dbms������ �÷��� ������ Ÿ�� �� number ���� �Ӽ����� �����Ǵ� ��찡 ����
 
 (�������)
 create sequence �������� --������ ��ü�� ����Ϸ��� 
    [start with n] --�����ϴ� ��
    [increment by n]--�����ϴ� ��
    [maxvalue n| nomaxvalue]--
    [minvalue n| nominvalue]--������ �Ǹ� 1�� �Ǿ�����.
    [cycle | nocycle]-- ó������ max���� ���°� /nocycle : �⺻��
    [order | noorder]-- ��� 
   
   
   **�ǻ��÷�(Pseudo Column)- ������ �÷�
---------------------------------------------------------------------
   Pseudo Column                             ����                  
---------------------------------------------------------------------
��������.nextval                            '��������'��ü�� ���� ��
��������.currval                            '��������'��ü�� ���� ��
---------------------------------------------------------------------
 ��������ü�� ������ �� �ݵ�� ù��° �������  ��������.nextval�� ���Ǿ�� ��
 
 .select���� select ��, insert�� subquerydml select��, values ��,
 update���� set ������ ���
 
 delete lprod
 where lprod_id>6; 
 
 select * from lprod;
 

 
 ��) lprod���̺� ���� �ڷḦ �����Ͻÿ�. ��, lprod_id�� �������� �̿��Ͻÿ�.
 ----------------------------------------
  lprod_id   lprod_gu         lprod_nm
 ----------------------------------------
    7         p401             ����/cd
    8         p402             ����
    9         p403             ��ȭ
 ----------------------------------------
 
 
 
 (1) ������ ����
 create sequence seq_lprod
  start with  7;
  
  drop sequence seq_lprod; --�����ϴ°�
  select seq_lprod.currval from dual;
  select seq_lprod.nextval from dual;
 
 (2) insert ��
 insert into lprod
 values(seq_lprod.nextval,'p401','����/cd');
 
  insert into lprod
 values(seq_lprod.nextval,'p402','����');
 
  insert into lprod
 values(seq_lprod.nextval,'p403','��ȭ');
 
 
 
 
 
 
 
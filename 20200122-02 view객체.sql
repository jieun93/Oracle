2020-01-22-02)view ��ü
- ������ ���̺�
- ��� ���̺��̳� �Ǵٸ� �並 ������� ����
-(���)
    .���� ���̺� �л�Ǿ� ����� ������ �ϳ��� ����� ��ȯ �� ��
    .������ �����̳� ����, ���������� ����ϴ� ������ ���� �ݺ�
    .Ư�� ���̺��� ������ �ٸ� ����ڿ��� �������� ���ƾ� �ϴ� ���(����)
    (�������)
    
    create view [or replace] [force| noforce] view �� �̸�[(�÷�����Ʈ)]
    as
     select ��
     [with check option [constraint ����]]
     [with read only];
     
     
     .(�÷�����Ʈ) : �����Ǵ� �信 �ο��� �÷���, �����ϸ� �������̺�(��)�� �÷����� ���
     . or replace : �����Ϸ��� ��� ������ �̸��� �䰡 �̹� �����ϸ� ������ �並 ��ġ
     .force| noforce : default�� noforce,������ �Ǵ� ���̺��� ��� �並 
                        ������ų �� force�ɼ� ���
     .with check option : ���� ������ ���� select���� where�� ������  ������Ű��
                            ���ϴ� �����͸� �信  �����ϰų� ���� ������ �������� ���ϵ��� ��. 
     .with read only  : �б� ���� �� ����                   
    
    ��) ȸ�����̺��� ���ϸ����� 3000�̻��� ȸ�� ȸ����ȣ, ȸ����, ���ϸ���, ������ ��ȸ�Ͽ�
        view_mem_01 �̸��� view�� �����Ͻÿ�.
    create or replace view view_mem_01
    as
        select mem_id as ȸ����ȣ,
              mem_name as ȸ����,
              mem_mileage as  ���ϸ���,
              mem_job as ����
         from member
         where mem_mileage>=3000;         
       
      select * from view_mem_01;
      
     ������  s001 ������ 3200 �������� ���ϸ�����  �ٲٷ��� ��
      
      update view_mem_01
         set ���ϸ���=55000
       where ȸ����ȣ='s001';--�������� ���ϸ����� �信�� ã�Ƽ� 55000���� �ٲ�
       
       select mem_id,mem_name,mem_mileage
         from member
        where mem_id='s001';
       --��� ���̺��� ���������� ���ϸ����� ����Ȱ� Ȯ���ϴ� ��
    
     create or replace view view_lprod_01/*�� �̸� �ٲ���*/(id,gubun,name)
      as 
           select * from lprod
            where lprod_id>=5;
          
          WITH READ ONLY;  
            
            
            select * from view_lprod_01;
  -----------------------------------------------------------------------------          
 (12�� ������깰 �� �����ϴ� ��)
            insert into view_lprod_01(ID,GUBUN,NAME)
                values(12,'P504','������깰')
                
              SELECT * FROM LPROD; 
  ---------------------------------------------------------------------------------
  ( ���̵� 11�� ���� ���� ����)
  DELETE VIEW_LPROD_01
  WHERE ID=11;
   
    
    
 (with check option)
     create or replace view view_mem_01
    as
        select mem_id as ȸ����ȣ,
              mem_name as ȸ����,
              mem_mileage as  ���ϸ���,
              mem_job as ����
         from member
         where mem_mileage>=3000 
        
       with check option;
    
    select * from view_mem_01;
    
    
    (1) view_mem_id ���� ȸ����ȣ'v001' ȸ��(������)�� ���ϸ����� 5000���� ����
    
    update view_mem_01
         set ���ϸ���=50000
       where ȸ����ȣ='v001';
       
  select * from view_mem_01; --�ٲ�� Ȯ���ϴ� ��
    
    
     (2) view_mem_id ���� ȸ����ȣ'v001' ȸ��(������)�� ���ϸ����� 500���� ����
     update view_mem_01
         set ���ϸ���=500 -- �����߻�
       where ȸ����ȣ='v001';
       
  select * from view_mem_01; 
  
  
 ------------------------------------------------------------------------ 
  
  create or replace view view_lprod_01/*�� �̸� �ٲ���*/(id,gubun,name)
      as 
           select * from lprod
            where lprod_id>=5
          
          WITH READ ONLY     --�ΰ� ���û�� �Ұ���
          with check option; 
            
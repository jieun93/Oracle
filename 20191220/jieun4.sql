2019-12-20-01)select �� 
 - select ������ �÷��� ��� '*'/*all�̶�� ��*/�� ����ϸ� ��� �÷��� ��ȸ
 - where���� �����Ǹ� ���̺� ���� ��� ���� ��ȸ
 ��) ȸ�����̺�(member)�� ��� ȸ���� ��� �ڷḦ ��ȸ�Ͻÿ�.
 select * from member;
 
 ��) ȸ�����̺�(member)���� ȸ����ȣ, ȸ����, �ּ�, ���ϸ����� ��ȸ�Ͻÿ�.
 select mem_id as ȸ����ȣ, 
        mem_name as ȸ����, 
        mem_add1 ||' '||mem_add2 as "��  ��",
        mem_mileage  ���ϸ���
    from member;
    
    ��) ȸ�����̺�(member)���� �������� ������ȸ���� ȸ����ȣ, ȸ����, �ּ�, ���ϸ����� ��ȸ�Ͻÿ�.
    
  select mem_id as ȸ����ȣ, 
        mem_name as ȸ����, 
        mem_add1 ||' '||mem_add2 as "��  ��",
        mem_mileage  ���ϸ���
    from member
    where mem_add1 like '����%';
    
    ��)ȸ�����̺�(member)���� ���ֵ��ø� ��ȸ
    
    select distinct substr(mem_add1,1,2)
        from member;
        
   ��) ��ǰ���̺�(prod)���� �ŷ�ó�ڵ带 �ߺ����� �ʰ� ��ȸ�Ͻÿ�.
   select prod_buyer as �ŷ�ó�ڵ�/**�ŷ�ó�ڵ庰Ī�� ����,���������� ���x*/
    from prod ;
    
    ��) ��ǰ���̺�(prod)���� �ŷ�ó�ڵ带 �ߺ����� �ʰ� ��ȸ�Ͻÿ�.
          select distinct prod_buyer as �ŷ�ó�ڵ�/**�ŷ�ó�ڵ庰Ī�� ����,���������� ���x*/
    from prod 
    order by 1 desc; /*asc �� ū������ ������,desc ���������� ū��*/
    
    
    1) where ��
    - �ο��� ������ ����Ҷ� ����Ѵ�.
    (�������)
    where  �÷��� ������ expr[and|or] [�÷��� ������ expr....]
    .'������' : ���迬���� (>, <, =, >=, <=, !=(�����ʴ�)(<>)
    
    ��) ȸ�����̺��� ���ϸ����� 3000�̻��� ��ȸ���� ��ȸ�Ͻÿ�.
       Alias�� ȸ����ȣ, ȸ����, ����, ���ϸ���
      
      select  mem_id as ȸ����ȣ, 
              mem_name as ȸ����,
              mem_job as ����, 
              mem_mileage as ���ϸ���
              
       from member
       where  mem_mileage>=3000;
    
    
       ��) ȸ�����̺��� ���ϸ����� 3000�̻��� ��ȸ���� ��ȸ�ϵ� ���ϸ����� ū������� ����Ͻÿ�.
       Alias�� ȸ����ȣ, ȸ����, ����, ���ϸ���
       
      select  mem_id as ȸ����ȣ, --1
              mem_name as ȸ����,--2
              mem_job as ����, --3
              mem_mileage as ���ϸ���--4
              
       from member
       where  mem_mileage>=3000
       order by 4 /*mem_mileage*/ desc, 2;/*�̸����������� ����*/;  /*����Ŭ�� 1���� ī����*/
       
       
       ��)ȸ�����̺��� 12���� ������ ȸ���� ��ȸ�Ͻÿ�.
       Alias�� ȸ����ȣ, ȸ����, �������
       
       select  mem_id as ȸ����ȣ, 
              mem_name as ȸ����, 
               mem_bir as �������
           
           from member
           
           where extract(month from mem_bir) = 12;
           
        ��)��ǰ���̺��� �ǸŰ��� 10�������� ��ǰ�� ��ȸ�Ͻÿ�.
        Alias�� ��ǰ��ȣ, ��ǰ��, �ǸŰ�
        
        select prod_id as ��ǰ��ȣ,
              prod_name as ��ǰ��,
              prod_price as �ǸŰ�
            
              from prod
              where  prod_price>= 100000 and prod_price <= 199999;
             -- where not prod_price>= 100000 and prod_price <= 199999;
              --not�� ����ϸ� not�� ������ �������� ����

       --�ܹ̿����������
       --where prod_price>= 100000 and prod_price <= 199999;
       --where prod_price>= 100000 and prod_price <200000;
       --where prod_price between 100000 and 199999;      
              
              
              ��) ��ǰ���̺���  �ŷ�ó�ڵ尡  p10201 �̰ų� p30203�� ��ǰ������ ��ȸ�Ͻÿ�.
              Alias�� ��ǰ��ȣ, ��ǰ��, ���԰�, �ŷ�ó �ڵ�
              
              select prod_id as ��ǰ��ȣ,--����X,������ " " ����ؾ��Ѵ�.
                     prod_name as ��ǰ��,--����X,������ " " ����ؾ��Ѵ�.
                     prod_cost as ���԰�,--����X,������ " " ����ؾ��Ѵ�.
                     prod_buyer as �ŷ�ó�ڵ�--����X,������ " " ����ؾ��Ѵ�.
                                         
                    from prod 
                  where  prod_buyer = 'P10201' or  prod_buyer = 'P30203';  
                  /*���ϴ� �����ڿ����� ������Ÿ���� ��ġ���Ѿ� �Ѵ�.*/
                  
                  
                  
     2)��������
     - and, or, not
     - and : ����
     ���� 1 and ���� 2 : '����1'�� '����2'�� ���ΰ�츸 ��ü ����� ��
     - or : ����
     ���� 1 or ���� 2 : '����1'�� '����2'�� �߿��� �ϳ��� ���̸� ��ü ����� ��
     - not : �� ����
      not(!) ���� :'����'�� ����� �ݴ� ���� ��ȯ
     -���� ����: /*1*/not->/*2*/and->/*3*/or /*������ ������� �Ǿ��Ѵ�*/
     
     age >= 20 or age < 30 and gender='����'
     
     3)��Ÿ������(in, any, some, all, EXISTS, between, like ...)
     (1)IN ������
     .�־��� �ڷ� �� ����ϳ��� ��ġ�ϸ� ��ü ����� ���� ��ȯ
     (�������)
     �÷��� IN(��1, ��2,....)
     - OR �����ڷ� ġȯ ����
     
     
     ��) ��ǰ���̺��� ��ǰ�з��ڵ尡 'P101', 'P201', 'P301'�� ���� �ڷḦ ��ȸ�Ͻÿ�.
        Alias�� ��ǰ�ڵ�, ��ǰ��, �з��ڵ�, �ǸŰ����̴�.
        
        (OR ������ ���)
        SELECT PROD_ID AS ��ǰ�ڵ�,
               PROD_NAME AS ��ǰ��,
               PROD_LGU AS �з��ڵ�,
               PROD_PRICE AS �ǸŰ���
               
         FROM PROD
        
        WHERE PROD_LGU='P101' OR PROD_LGU='P201' OR PROD_LGU='P301';
        
        
        (IN ������ ���)/*���迬���� ���X*/
        SELECT PROD_ID AS ��ǰ�ڵ�,
               PROD_NAME AS ��ǰ��,
               PROD_LGU AS �з��ڵ�,
               PROD_PRICE AS �ǸŰ���
               
         FROM PROD
        
        WHERE PROD_LGU IN ('P101','P201','P301');
    
    **IN, AND, SOME, ALL �����ڴ� Subquery �� ���� ����
    - IN ����'( )'�� ���� �� Ȯ���� ���
    
    ��)��ǰ���̺��� ���� �з��ڵ�� �з����� ����Ͻÿ�.
   
            
     (2)ANY ������
     . ����� IN�� ����, �ٸ� ��������� �ٸ�
     (�������)
     �÷��� ���迬���� ANY (��1, ��2,...)
     - IN �����ڸ� ANY �� ��ȯ�ϸ� '=ANY'�̴�
     
       ��) ��ǰ���̺��� ��ǰ�з��ڵ尡 'P101', 'P201', 'P301'�� ���� �ڷḦ ��ȸ�Ͻÿ�.
        Alias�� ��ǰ�ڵ�, ��ǰ��, �з��ڵ�, �ǸŰ����̴�.
        
    (ANY ������ ���)/*���迬���� ���O*/
    SELECT PROD_ID AS ��ǰ�ڵ�,
               PROD_NAME AS ��ǰ��,
               PROD_LGU AS �з��ڵ�,
               PROD_PRICE AS �ǸŰ���
               
         FROM PROD
        
        --WHERE PROD_LGU = ANY ('P101','P201','P301');    
        --WHERE PROD_LGU > ANY ('P101','P201','P301');/*P101���� ū�ڷ� ���*/         
              WHERE PROD_LGU > 'P101';
              
     (3) BETWEEN ������
     .������ ������ �� ���
     . AND �����ڷ� ġȯ ����
     (�������)
     �÷��� BETWEEN ��1  AND ��2
     -'��1'���� '��2' ������ ����
     
     
     ��)ȸ�����̺��� ���̰� 40���� ȸ���� ��ȸ�Ͻÿ�.
     Alias�� ȸ����ȣ, ȸ����, ����, �������
     
     (and������ �̿� )
              
       select mem_id as ȸ����ȣ, 
             mem_name as ȸ����,
            extract(year from sysdate) -extract(year from mem_bir) as ����,
            -- round(sysdate-mem_bir)/365) as ����, 
             mem_bir as �������
       from member
       
       where extract(year from sysdate) -extract(year from mem_bir) >=40;
    
    
    
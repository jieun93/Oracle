2019-12-23-01)
1)between������
    ��)��ǰ���̺�(PROD)���� ��ǰ�� �з��� 'P102'���� 'P302'�� ���� ��ǰ�� ��ȸ�Ͻÿ�.
        Alias�� ��ǰ��ȣ(PROD_ID), ��ǰ��(PROD_NAME), �з��ڵ�(PROD_LGU), �ŷ�ó�ڵ�(POD_BUYER)
        
      SELECT PROD_ID AS ��ǰ��ȣ, 
               PROD_NAME AS ��ǰ��,
               PROD_LGU AS �з��ڵ�,
               PROD_BUYER AS �ŷ�ó�ڵ�
        FROM PROD
        WHERE PROD_LGU >='P102' AND PROD_LGU<='P302';
               
   (BETWEEN �����ڻ��)
     SELECT PROD_ID AS ��ǰ��ȣ, 
               PROD_NAME AS ��ǰ��,
               PROD_LGU AS �з��ڵ�,
               PROD_BUYER AS �ŷ�ó�ڵ�
        FROM PROD
        WHERE PROD_LGU BETWEEN'P102' AND 'P302';
         
         
         2)LIKE ������
         - ���ϵ�ī��('%','_')�� ����ϴ� ������ ��
         (�������)
         �÷��� LIKE ���Ϲ��ڿ� 
         . '%' : '%'�� ���� ��ġ���� ��� ���ڿ��� ����
            EX) '��%' =>'��'���� ���۵Ǵ� ���ڿ��� �� ���̴�.
                '%��' =>'��'���� ������ ���ڿ��� �� ���̴�.
                '%��%'=> �߰��� '��'���� ���� �Ǿ�����.
                
                
        ��) ȸ�����̺��� '��'�� ���� ���� ȸ���� �˻��Ͻÿ�.
         Alias�� ȸ����ȣ, ȸ����, ����, ���ϸ���
         
        SELECT MEM_ID AS ȸ����ȣ,
               MEM_NAME AS ȸ����,
               MEM_JOB AS ����,
               MEM_MILEAGE AS ���ϸ���
                
        FROM MEMBER
        WHERE MEM_NAME LIKE '��%';
        /*LIKE�� ���� ���� �ȵȴ�,���ڿ��� ��ȸ�Ҷ�����.*/
        
        ��)ȸ�����̺��� �ּ����� '����'�� ȸ���� ��ȸ�Ͻÿ�.
          Alias�� ȸ����ȣ, ȸ����, �ּ�, ����, ���ϸ���
          
          SELECT MEM_ID AS ȸ����ȣ,
                MEM_NAME AS ȸ����,
                MEM_ADD1 || /*���ϱ⿬���ڿͰ���*/' ' || MEM_ADD2 AS �ּ�,
                MEM_JOB AS ����,
                MEM_MILEAGE AS ���ϸ���
                
                FROM MEMBER
                WHERE MEM_ADD1 LIKE '�泲%';
        
        ��) ȸ�����̺��� ����ȸ���� ��ȸ�Ͻÿ�.
        Alias�� ȸ����ȣ, ȸ����, �ֹι�ȣ, ���ϸ���
                ���� �÷����� '����ȸ��'�� ���
        
        SELECT MEM_ID AS ȸ����ȣ,
                MEM_NAME AS  ȸ����,
                MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
                '����ȸ��' AS ����,
                MEM_MILEAGE AS ���ϸ���
                
                FROM MEMBER
                WHERE MEM_REGNO2 LIKE '2%'
                OR MEM_REGNO2 LIKE'4%';
                
        **'m001'ȸ�����ֹι�ȣ�� '010315-4555555'�� �����Ͻÿ�.
        
        update member
            set mem_regno1='000319',
                mem_regno2='4110222'
            where mem_id='x001';
            
            commit;
            
            SELECT MEM_ID AS ȸ����ȣ,
                MEM_NAME AS  ȸ����,
                MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
                '����ȸ��' AS ����,
                MEM_MILEAGE AS ���ϸ���
                
                FROM MEMBER
                WHERE MEM_REGNO2 LIKE '2%'
                OR MEM_REGNO2 LIKE'4%';
                
                ��) ȸ�����̺���12���� ������ �ִ� ȸ���� ��ȸ�Ͽ� ȸ���� ���� �ִ� ���ϸ����� 10%�� �߰� �����Ͻÿ�.
                    ������ �ֹι�ȣ �� �ڸ��� ��ȸ.
                    
                ��,Alias�� ȸ����ȣ, �̸�, �������, �߰����� ���ϸ���, ���ϸ��� �հ�
                
                SELECT MEM_ID AS ȸ����ȣ,
                    MEM_NAME AS �̸�,
                    MEM_BIR AS �������,
                    MEM_MILEAGE*0.1 AS �߰����޸��ϸ���,
                    MEM_MILEAGE+(MEM_MILEAGE*0.1 ) AS ���ϸ����հ�
                
                FROM MEMBER
                WHERE SUBSTR(MEM_REGNO1,3,2)='12';
                
    .'_': '_'�� ���� ��ġ���� �ϳ��� ���ڿ��� ����
        EX) '_�浿'==>������ �ѱ����̰� �̸��� '�浿'�� ����� ��ȸ
        
    ��) ȸ�����̺���12���� ������ �ִ� ȸ���� ��ȸ�Ͽ� ȸ���� ���� �ִ� ���ϸ����� 10%�� �߰� �����Ͻÿ�.
                    ������ �ֹι�ȣ �� �ڸ��� ��ȸ.
                    
                ��,Alias�� ȸ����ȣ, �̸�, �������, �߰����� ���ϸ���, ���ϸ��� �հ�     
        
     SELECT MEM_ID AS ȸ����ȣ,
                    MEM_NAME AS �̸�,
                    MEM_REGNO1 AS �������,
                    MEM_MILEAGE*0.1 AS �߰����޸��ϸ���,
                    MEM_MILEAGE+(MEM_MILEAGE*0.1 ) AS ���ϸ����հ�
                
                FROM MEMBER
            WHERE MEM_REGNO1 NOT LIKE '__12%';    
        
        
        
        
        
        
        
        
        
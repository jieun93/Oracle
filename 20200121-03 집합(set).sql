2020-01-21-01)����(set)
 - union, union all, intersect, minus
 - �� select ���� ���� �÷��� ���� ������ Ÿ���� ���� �ؾ���
 - ���� ����� �Ǿտ� ����� select ���� ������ ��
 - ��뷮 ������Ÿ��(blob, clob, bfile ��)�� ��� �Ұ�
 - order by ���� �� ������ query�������� ��� ����
 
 1)union, union all
    - �������� ����� ��ȯ
    - union�� �ߺ�����, union all�� �ߺ� ���
    
    ��) ȸ�����̺��� ������ �ڿ����̰ų� �ְ����� ������ ȸ�������� ���տ����ڸ� ����Ͽ� ��ȸ�Ͻÿ�.
    Alisa�� ȸ����ȣ, ȸ����, ���ϸ���, ����
    
 ------------------------------------------------------------------------
(������ �ڿ���)
select mem_id as ȸ����ȣ,
       mem_name as ȸ����,
       mem_mileage as ���ϸ���,
       mem_job as ����
    from member
    where mem_job='�ڿ���';
    -------------------------------------------------------------------
(�ְ����� ����)
select mem_id as ȸ����ȣ,
       mem_name as ȸ����,
       mem_mileage as ���ϸ���,
       mem_job as ����
    from member
    where mem_add1 like '����%';
  
  --------------------------------------------------------------------
 (union ���)
 select mem_id as ȸ����ȣ,
       mem_name as ȸ����,
       mem_mileage as ���ϸ���,
       mem_job as ����,
       substr(mem_add1,1,2) as  ������
    from member
    where mem_job='�ڿ���'
    
    union
    
    select mem_id as ȸ����ȣ,
       mem_name as ȸ����,
       mem_mileage as ���ϸ���,
       mem_job as ����,
       substr(mem_add1,1,2) as  ������
    from member
    where mem_add1 like '����%'
    order by 1;
    
---------------------------------------------------------    
    (or ������)
 select mem_id as ȸ����ȣ,
       mem_name as ȸ����,
       mem_mileage as ���ϸ���,
       mem_job as ����,
       substr(mem_add1,1,2) as  ������
    from member
    where mem_add1 like '����%'or mem_job='�ڿ���'
    order by 1;
    
 -----------------------------------------------------   
    union all 
    
 select mem_id as ȸ����ȣ,
       mem_name as ȸ����,
       mem_mileage as ���ϸ���,
       mem_job as ����,
       substr(mem_add1,1,2) as  ������
    from member
    where mem_add1 like '����%'
    order by 1;
    
   ----------------------------------------------------- 
    
��) 
    ������̺�, �μ����̺�,��å���̺���
    ���̺��̸�,���̺� ����, �ڷ���� ����ϴ� ������ �ۼ��Ͻÿ�.
    
    select 'EMPLOYEES' AS ���̺��,
            '������̺�' AS "���̺� ����",
            COUNT(*) AS �ڷ��
       FROM EMPLOYEES   
       
       UNION
       
    select 'DEPARTMENTS' AS ���̺��,
            '�μ����̺�' AS "���̺� ����",
            COUNT(*) AS �ڷ��
       FROM DEPARTMENTS
       
       UNION
     select 'JOBS' AS ���̺��,
            '��å���̺�' AS "���̺� ����",
            COUNT(*) AS �ڷ��
       FROM JOBS;   
       
       --�ߺ��� ���ϴ°� UNION
       ��) 2005�� 2���� ���ŵ� ��ǰ�� 2005�� 4���� ���ŵ� ��ǰ�� ��� ��ȸ�Ͻÿ�.
       Alias �� ��ǰ��ȣ, ��ǰ��, ���ż�����
       
       select buy_prod as ��ǰ��ȣ,
             prod_name as ��ǰ��,
             sum(buy_qty) as ���ż�����
          from buyprod, prod
          where buy_prod=prod_id
            and buy_date between '20050201' and '20050228'
            group by buy_prod,prod_name
            
            union all
            
             select buy_prod as ��ǰ��ȣ,
             prod_name as ��ǰ��,
             sum(buy_qty) as ���ż�����
          from buyprod, prod
          where buy_prod=prod_id
            and buy_date between '20050401' and '20050430'
            group by buy_prod,prod_name
            order by 1;
       
       
       ��) 2005�� 6�� ���������� ���������� �̿��Ͽ� ����/���� ���踦 ���Ͻÿ�.
        Alias�� ��ǰ��ȣ, ��ǰ��, ����, �����̴�.
       (����)
       select buy_prod as ��ǰ��ȣ,
             prod_name as  ��ǰ��,
             '����' as ����,
            sum(buy_qty) as ����
           from buyprod, prod
           where buy_prod=prod_id
            and buy_date between '20050601' and '20050630'
            group by buy_prod,prod_name;
            
            union all
            
            -- (����)
       select cart_prod as ��ǰ��ȣ,
             prod_name as  ��ǰ��,
             '����' as ����,
             sum(cart_qty) as ����
           from cart, prod
           where cart_prod=prod_id
            and cart_no like '200506%' 
            group by cart_prod,prod_name
            order by 1;
       
 2)intersect
 -������(����κ�)�� ��ȯ
 
 ��) 2005�� 4���� �Ǹŵ� ��ǰ�̸鼭 2005�� 5������ �Ǹŵ� ��ǰ�� ��� ��ȸ�Ͻÿ�.
 Alias�� ��ǰ��ȣ, ��ǰ��, �Ǹż�����
 
       select cart_prod as  ��ǰ��ȣ,
              prod_name as ��ǰ��,
          sum(cart_qty) as  �Ǹż�����
          from cart,prod
        where cart_no like '200504%'
           and cart_prod=prod_id
           group by cart_prod,prod_name
           
           intersect
           
           select cart_prod as  ��ǰ��ȣ,
              prod_name as ��ǰ��,
          sum(cart_qty) as  �Ǹż�����
          from cart,prod
        where cart_no like '200506%'
           and cart_prod=prod_id
           group by cart_prod,prod_name
           order by 1;
       
 3) minus
 -�������� ��ȯ
 - A minus B : A ����������� B���� ����� ������ ���� ��ȯ
 
 ��) 4���� �Ǹŵ� ��ǰ�� 6���� �Ǹŵ��� ���� ��ǰ������ ��ȸ
       
       select cart_prod as  ��ǰ��ȣ,
              prod_name as ��ǰ��,
        from cart,prod
        where cart_no like '200504%'
           and cart_prod=prod_id
                     
   minus
          
     select distinct cart_prod as  ��ǰ��ȣ,
                   prod_name as ��ǰ��,
           from cart,prod
        where cart_no like '200506%'
           and cart_prod=prod_id
           order by 1;
    
    
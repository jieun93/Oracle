2020-01-22-01) �ڷ� ����(delete)
(�������)
delete ���̺��
[where ����]
 - '����' �� ���������� ����ϴ� ��� in(exists)�����ڸ� ����Ͽ�
    �ټ����� ���� ����
 
 
 ��)
 select * from remain2
 where remain_j_00 <= 10;
 
 delete remain2;--�����ϴ� ���
 
 delete remain2
    where remain_j_00 <= 10;-- ���ǹ�
    
    rollback;
    
    ��) 2005�� 3�� �԰�� ��ǰ�ڵ忡 �ش��ϴ� ��ǰ������ remain2 ���̺��� �����Ͻÿ�.
    
        delete remain2
         where remain_prod in (��������) 
         
         (��������): 2005�� 3�� �԰�� ��ǰ�� ��ǰ�ڵ�
         select buy_prod
           from buyprod
           where buy_date between '20050301' and '20050331';
    (����) --���� in ������ ���
    delete remain2
     where remain_prod in (select buy_prod
                             from buyprod
                            where buy_date between '20050301' and '20050331');  
         ------6���� ���� ������
             rollback;
   (exists �����ڻ��) 
     delete remain2
     where exists (select 1
                    from buyprod
                   where buy_date between '20050301' and '20050331');  
      
      select count(*) from remain2;
      
      rollback;
      
      ��) ��ٱ������̺��� 2005�� 7�� 19�� �Ǹŵ� ��ǰ�� �ش� �ŷ�ó ������ �����Ͻÿ�.
      --���� ��� : �ŷ�ó ���̺�(buyer table)
      delete buyer a
      where  buyer_id in (select prod_buyer
                            from prod, cart
                           where prod_id=cart_prod
                             and cart_no like '20050719%')
                             
         rollback;                    
                             
      
      
    
                     
      
         

         
         
    
    
    
    
    
    
    
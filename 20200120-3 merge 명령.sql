2020-01-20-03)merge ���
- ������ ���Ͽ� ���ǿ� ��ġ�ϴ� �ڷᰡ ������ insert���� ���ǿ� ��ġ�ϴ� �ڷᰡ ������ update���� �����ϴ� ��ɹ�

(�������)
merge into ���̺��
    using (insert�� update�� �� ������ ��õ) on(update�� ����)
  when matched then
    UPDATE
        set �÷���1=��1 [, �÷���2=��2,.....]
    where ����
    
    when not matched then
        insert (�÷���1 [,�÷���2....]) value (��1 [,��2,...])
        where ����;
        
   ��) ��ǰ�з����̺� ���� �ڷḦ �߰� �Ǵ� �����Ͻÿ�.
   ����(lprod_id) : 7
   �з��ڵ�(lprod_gu) :'P401'
   �з���(lprod_nm) : 'DVD'
   
   update lprod
     set lprod_nm='DVD'
         lprod_id=11
     where lprod_gu'P401';
     
    rollback;
    
    
    merge into lprod a
        using dual on(lprod_gu='P401')
       when matched then 
       update
        set a.lprod_id=11,
            a.lprod_nm='DVD'
    when not matched then
     insert (a.lprod_id,a.lprod_nm,a.lprod_gu) values(11,'DVD','P401');
       

   ���� : 10
   �з��ڵ� :'P501'
   �з��� '�����'
   
   
   merge into lprod a
        using dual on(lprod_gu='P501')
       when matched then 
       update
        set a.lprod_id=10,
            a.lprod_nm='��깰'
    when not matched then
     insert (lprod_id,lprod_nm,lprod_gu) values(10,'��깰','P501');
     
     rollback;
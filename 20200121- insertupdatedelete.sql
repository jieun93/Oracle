2020-01-21-02)���������� �̿��� insert/update/delete

���������̺� ����
----------------------------------------------------------
�÷���         ������Ÿ��(ũ��)       nullable        key
----------------------------------------------------------
remain_year     char(4)              n.n           pk
remain_prod     varchar2(10)         n.n           pk/fk
remain_j_00     number(5)               --�������
remain_i        number(5)               --�԰����(buyprod)
remain_o        number(5)               --������(cart)
remain_j_99     number(5)               --�����(�������+�԰�-���),�⸻���
remain_date     date                    --�����Ǿ��� ��
----------------------------------------------------------
--create ��ü�� �����ϴ� ��ɾ�

create table remain(
    remain_year char(4) not null,
    remain_prod varchar2(10) not null,
    remain_j_00 number(5),
    remain_i    number(5),
    remain_o    number(5),              
    remain_j_99  number(5),            
    remain_date  date,   
    
 constraint pk_remain primary key(remain_year,remain_prod),
 constraint fk_remain foreign key(remain_prod)
    references prod(prod_id));
    
    
��)remain ���̺� ���� ���ǿ� �°� �ڷḦ �Է��Ͻÿ�.
    (����)
    - �⵵ :2005��
    - ��ǰ�ڵ� : ��ǰ���̺�(prod)�� ��ǰ�ڵ�
    - ������� : ��ǰ���̺�(prod)�� �������(prod_properstock)
    - �԰���� : 0
    - ������ : 0
    - �⸻��� :��ǰ���̺�(prod)�� �������(prod_properstock)
    - ó������: 2004�� 12�� 31��
    
    
    insert into remain(remain_year,remain_prod,remain_j_00,remain_i,
                        remain_o,remain_j_99,remain_date)
          select '2005',prod_id,prod_properstock,0,0,prod_properstock,'20041231'--���������� ��ȣ�� ���� �ʴ´�.�ι�° ���������� ��ȣ�� ���´�.
            from prod;
    
    **���������� �̿��� ���̺� ����
    create table remain2 as
      select * from remain;--���������� �̿�ɶ����� ��ȣ�� ���� �ʴ´�.
    --�⺻Ű �����̸��� ������ ���̾�� �Ѵ�.
    
2)���������� �̿��� data update

��) 2005�� 1�� 31���� �������� ��ǰ�� �԰������ ��ȸ�Ͽ� ��� �������̺��� �����Ͻÿ�.
    
    (��������): 2005�� 1�� ��ǰ�� �԰������ ��ȸ
    select buy_prod, sum(buy_qty)
      from buyprod
     where buy_date between'20050101' and '20050131'  
    group by buy_prod;
    
    (��������) : �������� ����� remain ���̺� ����
    update remain a
       set ( remain_i,remain_j_99,remain_date)=(--��������)
       
       (����)
       update remain a
       set (remain_i,remain_j_99,remain_date)=(
            select remain_i+b.iamt,
                   remain_j_00+remain_i+b.iamt-remain_o,
                   '20050331'
              from(select buy_prod, sum(buy_qty) as iamt
                     from buyprod
                    where buy_date between'20050201' and '20050331'  
                    group by buy_prod) b
              where a.remain_prod=b.buy_prod)
      where a.remain_prod in(select distinct buy_prod
                                from buyprod
                                where buy_date between '20050201' and '20050331');
            
  --  rollback;
  4��1�� ���� 4��30��  �⸻��� ���
   update remain a
       set (remain_o,remain_j_99,remain_date)
            =(select remain_o+b.oamt,
                   remain_j_00+remain_i-remain_o-b.oamt,
                   '20050430'
              from(select cart_prod, sum(cart_qty) as oamt
                     from cart
                    where cart_no like '200504%'  
                    group by cart_prod) b
              where a.remain_prod=b.cart_prod)
      where a.remain_prod in(select distinct cart_prod
                                from cart
                                where cart_no like '200504%' );
   rollback;
    commit;
    
    
    
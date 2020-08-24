2019-12-24 3) LPAD,RPAD
-�־��� ������ Ư�� ����(��)�� ä��
(�������)
LPAD(c1, n [,c2])
RPAD(c1, n [,c2]) 
    . 'n'���� ������ ���̿� c1�� ä��� ���� ������ c2�� ä�� ��ȯ
    . LPAD�� �����ʺ��� ä��(���ʿ� C2�� ä��)
    . RPAD�� ���ʺ��� ä��(�����ʿ� C2�� ä��)
    . c2�� �����Ǹ� ���� ó�� ��
    . �������� ũ�� 'n'�� c1���� ���� ��� c1�� �߷� ����
    
��)
select LPAD('123',10,'*') from dual;
select LPAD('123',10) from dual;
select LPAD('12345678',5,'#') AS "�÷�" from dual;
select RPAD('12345678',5,'#') from dual;

��)��ٱ��� ���̺�(CART)���� ����(cart_qty)�� 5�ڸ��� ����ϵ� �����ʿ� ������� ä��ÿ�.
    ��, 2005�� 5�� �Ǹ������� ��ȸ�Ͻÿ�.
    Alias�� ȸ����ȣ, ��ٱ��Ϲ�ȣ, �����̴�.
    
select cart_member as ȸ����ȣ,
        mem_name as ȸ����,
        cart_no as ��ٱ��Ϲ�ȣ, 
        rpad(cart_qty,6) as ����
        
    from cart, member
    where cart_no like '200505%'
        and cart_member= mem_id;
    
 4) LTRIM, RTRIM, TRIM
 - ���ڿ� ��,�쿡 �߻��� ��ȿ�� ���� ���ſ� �ַ� ���
 (�������)
 LRTIM(c1 [,c2])
 RTRIM(c1 [,c2])
 TRIM(c)
    - LRTIM, RTRIM ���� c2�� ����Ǹ� c1���� c2�� ã�� ����
    - c2�� �����Ǹ� ������ ����
    - trim �� ���� ����� ���� ����
    - ������ ������ ������ �Լ� ���꿡 ����
    
��)
select ltrim('abccacd','a')from dual;
--�� ó�� ������ a�� �����.
select ltrim('  abcc  acd')from dual;
--���ʿ� �߻��� ���鸸 �����.�߰��� �߻��� ������ ���� �� ����.
--varchar2�� ������ ������ �ʴ´�.

5) SUBSTR
 - �κ� ���ڿ��� �����Ͽ���ȯ
 (�������)
 SUBSTR(c1, m [,n])
    .�־��� ���ڿ� c1���� m��°���� n����ŭ�� ���ڸ� �����Ͽ� ��ȯ
    . 'n'�� �����ǰų� 'n'�� ���� ���ڿ��� �������� ū ��� m ��° ������ ��� ���ڿ� ����
    .m�� �����̸� ���ʺ���(������) ó�� 
    
    
  select substr('����ȭ ���� �Ǿ����ϴ�', 2,3)as "�÷�" from dual;
                 1 2 34 56 78 9101112 
    select substr('����ȭ ���� �Ǿ����ϴ�', 10,5)as "�÷�" from dual;
    select substr('����ȭ ���� �Ǿ����ϴ�', 10) as "�÷�" from dual;
    select substr('����ȭ ���� �Ǿ����ϴ�', -8,2) as "�÷�" from dual;
    
    
    
    ��) ��ٱ������̺�(cart)���� 2005�� 4�� �ǸŰ� �߻��� ��¥�� �ߺ����� �ʰ� ��ȸ�Ͻÿ�.
    Alias�� �Ǹ����̴�
    
    select distinct/*�ߺ�����*/ substr(cart_no,1,8) 
        from cart
        where cart_no like '200504%';
    
        order by 1;
    
    
    ��) ��ǰ���̺��� ��ǰ�� '����'���� �����ϴ� ��ǰ�� ��ȸ�Ͻÿ�.
        Alias�� ��ǰ�ڵ�, ��ǰ��, ���԰���, �ŷ�ó�ڵ�
        ��, like�����ڸ� ������� ����
        
        select  prod_id as ��ǰ�ڵ�,
                prod_name as ��ǰ��,
                to_char(prod_cost,'9,999,990') as ���԰���,
                prod_buyer as �ŷ�ó�ڵ�
                
                from prod
                where substr (prod_name,1,2)='����'; 
    
    
    
    
    
    
    
        
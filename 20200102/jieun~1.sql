2020-01-02-01) ���ں�ȯ�Լ�
1)to_number
    - ���ڷ� ��ȯ ������ ���ڿ��� ������ �ڷ�� ��ȯ
    (�������)
    to-number(c1 [,fmt])
    .'fnt'�� to_char�� ���� ��ȯ ���ڿ��� ����
    .'c1'�� ���ں�ȯ ������ ���ڿ�
    
    ��)
    select to_number('1234','0000')
    --,
        --    to_number(sysdate)
            --,
            --to_number('p101')
    from dual;
    
    
    select to_char(to_date(substr(cart_no,5,4),'mmdd'),'mm"��" dd"��"') as �Ǹ���
    from cart;
    
 2) to_date
    - ��¥������ ���ڿ��� date ������ ��ȯ
    (�������)
    .c1�� ��¥�� ��ȯ ������ ���ڿ�
    .'fmt'�� to_char �Լ��� ��¥��ȯ ���ڿ��� ����
    
    ��) 
    select to_date('20201031'),
           to_date('20201031','yyyy/mm/dd'),
           to_char(to_date(20201031121231,'yyyymmddhh24miss'),'yyyy/mm/ddhh24:mi:ss'),
           to_date('20201129')
    from dual;
     
    ROLLBACK;
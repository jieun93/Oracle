2019-12-26-02) �����Լ�
1)������ �Լ�
  -ABS, SIGN, POWER, SQRT,  
  (1)ABS(n)
   - n�� ���밪�� ��ȯ
   (2)SIGN (n)
   - n�� ��ȣ�� ���� �����̸� -1, ����̸� 1,0 �̸� 0�� ��ȯ
   - ��ȣ�� �Ǵ����ش�.
   (3)POWER(e,y) 
   - e�� y��(e�� y�� �ŵ� ����) �� ��ȯ
   (4)SQRT(n)
   - n�� ���� �� ��ȯ
   
   
   ��) ȸ�����̺��� ȸ���� ���̰� 50�� �̻��� ȸ�������� ��ȸ�Ͻÿ�.
   Alias�� ȸ����ȣ, ȸ����,�ֹι�ȣ,����
   ��, ���̴� �ֹι�ȣ�� �̿��Ͽ� ���ϰ� 50�� �̻��� ȸ���� ������ sign�Լ��� ����Ͻÿ�.
   
   select mem_id as ȸ����ȣ,
          mem_name as ȸ����,
          mem_regno1 ||'-'||mem_regno2 as �ֹι�ȣ,
          case when substr(mem_regno1,1,1)='0' then
            extract(year from sysdate)- ('20'||substr(mem_regno1,1,2))
        else 
             extract(year from sysdate)-('19'||substr(mem_regno1,1,2))
             end as ����
             from member;
   
  ��) ��ǰ���̺��� ��ǰ�� �ǸŰ��� 10���� �ʰ��̸� '����ǰ',10�����̸� '������ǰ',10���� �̸��̸�'������ǰ'�̶�� ����� ����Ͻÿ�.
   
    select prod_id  ��ǰ��ȣ,
            prod_name ��ǰ�̸�,
            prod_price �ǸŰ���,
            case when sign(prod_price-100000)=0 then '������ǰ'
                 when sign(prod_price-100000)=1 then '����ǰ'
            else '������ǰ' end as "���"
   
   from prod;
   
   
   
   ��)20MB�� �� byte���� ���ϼ���.(2�� 10�� byte = 1KB, 2�� 10�� KB�� 1MB)
    => 1MB = (2�� 10 X 2�� 10) byte = > 2�� (10+10)��
    
    select to_char(20*power(2,20),'99,999,990')||'byte' from dual;

2) GREATEST, LEAST
    -�־��� �� �� ���� ū���� ���� ���� ���� ��ȯ/*���� ��Ȯ�ϰ� �˰� ������ ���*/
    (�������)
    .GREATEST(m1,m2,m3......) - ������ m1,m2,m3...�� ���� ū ��
    .LEAST(m1,m2,m3......) - ������ m1,m2,m3...�� ���� ���� ��
    ** �ϳ��� �÷��� ����� �� �� �ִ�/�ּ� ���� ���� �� => min(c), max(c) ���
    
 ��)
 select greatest('100','��','��')from dual;--'��'�� ���� ū���̴�.
 
 ��) ȸ�����̺��� ȸ������ �����ϰ� �ִ� ���ϸ����� ��ȸ�Ͽ� 2000���� ������ 2000����
    �����ϴ� ������ �ۼ��Ͻÿ�.
    (���ϸ����� 2000 ������ ȸ��)
    
    select mem_name, mem_mileage
        from member
        where mem_mileage<2000;
        
    (2000�̸��� ȸ���� ���ϸ��� ����)
    select mem_name, mem_mileage
        from member
        where mem_mileage<2000;
        
        select mem_id, mem_name, greatest(mem_mileage, 2000)
        from member;
        
 
   
   
   
   
   
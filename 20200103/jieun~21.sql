2020-01-02-02)�����Լ�(�׷��Լ�)
    - �����ڷḦ Ư���׸�(�÷�)�� �������� �׷����� ���� ����ó���� ����
    - SUM, AVG, COUNT, MIN, MAX
    - Ư���� ��� (���̺� ��ü�� �ϳ��� �׷����� ����)�� �����ϰ� GROUP BY �� ���Ǿ�� ��
    - �����Լ��� ������ �ο��Ǹ� WHERE���� ����ó���� �Ұ����ϸ� �ݵ�� HAVING���� ó���ؾ� ��
    - GROUP BY ������  ����Ǵ� �׸��� SELECT ������ �����Լ��� ������ ��� �Ϲ� �׸�(�ʼ� ���)�� �׷��� �ʿ��� �Ϲ� �÷����� ����
    - GROUP BY ������  ����Ǵ� �׸������ �׷��� �ٽ� �ұ׷����� ����

1)SUM
    -Ư�� �÷����� ���� ��ȯ
    (�������)
    SUM(ci)
    .c1 �÷��� ���� ���Ͽ� ��ȯ

��) ������̺��� ������� �޿� ���� ���Ͻÿ�.
    select department_id, 
          sum(salary) 
    from employees; -- ����
    
 ��) ������̺��� �μ��� ������� �޿� ���� ���Ͽ� �μ��ڵ� ������ ����Ͻÿ�.   
   select department_id, 
          to_char(sum(salary),'$999,999') as �޿���
    from employees
    group by department_id
    order by 1;
    
 ��)��ٱ������̺��� 2005�� 6�� ��ǰ�� �Ǹż����հ踦���Ͻÿ�.
 Alias�� ��ǰ��ȣ, �Ǹż�����
 
 select cart_prod as ��ǰ��ȣ,
        count(*) as �Ǹ�Ƚ��,
        sum(cart_qty) as �Ǹż����հ�
 from cart
 where substr(cart_no,1,6)='200506'
 group by cart_prod 
 order by 1;
  
  
  ��) �������̺�(buyprod)���� 2005�� 4�� ���ں� ���Լ����հ� ���Աݾ����� ���Ͻÿ�.
   Alias�� ����, ���Լ�����, ���Աݾ���
   
    select buy_date as ����,
           sum(buy_qty) as ���Լ�����,
           sum(buy_qty * buy_cost) as ���Աݾ���
    from buyprod
    where buy_date between to_date('20050401') and to_date('20050430')
    group by buy_date
    order by 1;
   
   
   ��) ȸ�����̺��� ��� ȸ������ ���ϸ��� ���� ���Ͻÿ�.
  --  select sum(mem_mileage)
  --      from member;
   
   /*select mem_name,
            sum(mem_mileage)
    from member
    group by mem_name;*/
   
   
    ��) ȸ�����̺��� ���� ȸ������ ���ϸ��� ���� ���Ͻÿ�.
    
    select substr(mem_regno2,1,1),
            sum(mem_mileage)
     from   member
    group by  substr(mem_regno2,1,1);
       
   
   
   ��) ȸ�����̺��� ���� ȸ������ ���ϸ��� ���� ���Ͻÿ�.
    
    select case when (substr(mem_regno2,1,1)='1' or
                    substr(mem_regno2,1,1)='3' then '����ȸ��'
                when (substr(mem_regno2,1,1)='2' or
                    substr(mem_regno2,1,1)='4' then '����ȸ��'
        end as ����,
        sum(mem_mileage)
     from   member
    group by  substr(mem_regno2,1,1)='1' or 
            substr(mem_regno2,1,1)='3' then '����ȸ��'
            
        end;
        
        
   ��) ȸ�����̺��� �������� ȸ���� ���ϸ��� ���� ���Ͻÿ�.
   
   select substr(mem_add1,1,2) as ������,
            sum(mem_mileage) as ���ϸ���
      from member
      group by substr(mem_add1,1,2);
            
  ��) ������̺��� 2005�� ���Ŀ� �Ի��� ����鿡 ���Ͽ� �μ��� �޿� �հ踦 ���Ͻÿ�.
    
    select department_id as �μ�,
          sum(salary) as �޿�
     from employees
     where extract(year from hire_date)>=2005
     group by  department_id; 
     
     
   ��) ��ٱ������̺���  2005�� 5�� �ڷῡ�� ��ǰ�� �Ǹż������� ���ϵ� �Ǹż����հ谡 20�� �̻��� ��ǰ�� ��ȸ�Ͻÿ�.
   
     select cart_prod as ��ǰ�ڵ�,
            sum(cart_qty) as �Ǹż����հ�
      from cart
      where cart_no like '200505%'/* substr(cart_no,1,6)='200505' */
      group by cart_prod
      having sum(cart_qty)>=20;
      
    
 2) count
 - �׷� ���� ���� ��(�ڷ��)
 (�������)
 count(*|c1) 
 
   ��)������̺��� ��ü ������� ��ȸ�Ͻÿ�.
   select count(*),
        count(employee_id),
        count(salary)
   from employees;      
   
   
   ��)������̺��� �μ��� ������� �޿��հ踦 ��ȸ�Ͻÿ�.
   select department_id as �μ��ڵ�,
          count(*) as  �����, 
          sum(salary) as  �޿���
   from  employees
   group by department_id  
   order by 1;   
   
   
   ��)��ǰ���̺��� �ŷ�ó�� �ŷ���ǰ�� ���� ��ȸ�Ͻÿ�.
      select  prod_buyer as �ŷ�ó,
             count(*) as �ŷ���ǰ��
      from prod
      group by prod_buyer
      order by 2 desc;
   
   ��) ȸ�����̺��� �������� ȸ������ ��ȸ�Ͻÿ�.
   
   select substr(mem_add1,1,2) as ������,
          count(*) as ȸ����
   from  member
   group by substr(mem_add1,1,2)
   order by 1;
    
   
   
   ��) ��ٱ������̺��� 2005�� 5~6�� ȸ���� ����ȸ���� ��ȸ�ϵ� ���� Ƚ���� 5ȸ �̻��� ȸ���� ��ȸ�Ͻÿ�.
   
   select  cart_member as  ȸ��,
          count(distinct cart_no) ����ȸ��
   from cart
   where  substr(cart_no,1,6)='200505' or substr(cart_no,1,6)='200506'
   -- where substr(cart_no,1,6) between '200505' and '200506'
   group by  cart_member
   having  count(distinct cart_no)>=3;

    
   ��) ȸ�����̺��� ȸ������ ���(mem_like)�� ȸ������ ���Ͻÿ�.
   select mem_like as ȸ��,
           count(*) as ȸ����
   from member
   group by mem_like;
        
   ��) ��ٱ��� ���̺��� 2005�� 5-6�� ȸ����, ��ǰ�� ����Ƚ���� ���� ���� ���� ���Ͻÿ�.
       
   select cart_member as ȸ��,
          cart_prod as ��ǰ,
          count(*) as  ����ȸ��,
          sum(cart_qty) as  ���ż�����
   from cart
   where  substr(cart_no,1,6)>='200505' 
   and substr(cart_no,1,6)>='200506'
   group by  cart_member, cart_prod
   order by 1;
   
   
 3) avg
    - �׷����� ���� ������ ��հ�
    (�������)
    avg(c1)
    .c1������� ���� ��� ��� ��ȯ
    ��) ������̺��� �μ��� ��� �޿�, �޿��հ�, �ο����� ��ȸ�Ͻÿ�.
    --��ձ޿� = �޿��հ� / �ο���
    select department_id as �μ��ڵ�,
            round(avg(salary)) as "��ձ޿�(avg)",
            round(sum(salary)) as �޿��հ�,
            count(*) as �μ����ο���,
            sum(salary)/count(*) as "��ձ޿�(���)"
    from   employees
    group by department_id
    order by 1;
    
    
    ��) kor_loan_status ���̺��� �̿��Ͽ� �� �õ���, ���к� ��� �����ܾ��� ���Ͻÿ�.
    select region as �õ�,
           gubun as ���ⱸ��,
           to_char(sum(loan_jan_amt),'9,999,999.9') as �����ܾ��հ�,
           to_char(avg(loan_jan_amt),'9,999,999.9') as ��մ����ܾ�
    from   kor_loan_status
    group by region,gubun;
    
    ��) kor_loan_status ���̺��� �̿��Ͽ� �� �õ���, ���к� ���� �ܾ� �հ��
        ��� ���� �ܾ��� ���ϵ� ���� �ܾ� �հ谡 20������ �Ѵ� ���� ��ȸ�Ͻÿ�.
        
    select region as �õ�,
           gubun as ���ⱸ��,
           to_char(sum(loan_jan_amt),'9,999,999.9') as �����ܾ��հ�,
           to_char(avg(loan_jan_amt),'9,999,999.9') as ��մ����ܾ�
    from   kor_loan_status
    group by region,gubun
    having sum(loan_jan_amt)>=200000
    order by region;
           
     ��) kor_loan_status ���̺��� �̿��Ͽ� 2012~2013�� �� �õ���, ���� ���� �ܾ� �հ��
        ��� ���� �ܾ��� ���ϵ� ���� �ܾ� �հ谡 5������ �Ѵ� ���� ��ȸ�Ͻÿ�.
    select region as �õ���,
           substr(period,5,2) as ����,
           sum(loan_jan_amt) as "�����ܾ��հ�",
           avg(loan_jan_amt) as "��մ����ܾ�"
    from   kor_loan_status
    where substr(period,1,4) between '2012' and '2013'
    group by region,substr(period,5,2)
    having sum(loan_jan_amt)>=50000
    order by 1,2;
        
   
    ��) ��ٱ������̺�� ȸ�����̺���  �̿��Ͽ� 2005�� 4�� ~ 5�� ���� ȸ������ ����ݾ��հ�,
        ����Ǽ�,��ո������ ���Ͻÿ�.
        
        select  case when substr(mem_regno2,1,1) ='1' or
                          substr(mem_regno2,1,1) ='3' then '����' 
                     when substr(mem_regno2,1,1) ='2' or
                          substr(mem_regno2,1,1) ='4' then '����'
                 end as  ȸ������,
                sum(cart_qty*prod_price) as ����ݾ��հ�,
                count(*) as ����Ǽ�,
                round(avg(cart_qty*prod_price)) as ��ո����
        from member, cart, prod
        where cart_member = mem_id--join����
        and cart_prod = prod_id--join����
        and  substr(cart_no,1,6) between '200504' and '200505'
        group by case when  substr(mem_regno2,1,1) ='1' or
                            substr(mem_regno2,1,1) ='3' then '����' 
                      when  substr(mem_regno2,1,1) ='2' or
                            substr(mem_regno2,1,1) ='4' then '����'
                 end;
                 
                 
    ��)ȸ�����̺��� ��������,������ ���ϸ����հ� ȸ����,��ո��ϸ����� ���Ͻÿ�.
    
    select substr(mem_add1,1,2) as ��������,
           mem_job as ������,
           sum(mem_mileage) as ���ϸ�����,
           count(mem_id) as ȸ����,
           round(avg(mem_mileage)) as ��ո��ϸ���
     from member      
     group by substr(mem_add1,1,2),mem_job
     order by 1;
     
  4)MAX, MIN 
  -  �Ű������� �����Ǵ� �÷��� �� �ִ밪(MAX),�ּҰ�(MIN)�� ���Ͽ� ��ȯ
  - �̵� �Լ��� ����ϸ� ���� ���̺��� �ڷḦ ��������(MIN),��������(MAX)����
    ������ �� ù��° ���� ���� ��ȯ-PROCESS TIME�� �ټ� �ҿ��
    
��)������̺��� �� �μ��� ���� ���� �޿��� ���� ���� �޿��� ���Ͻÿ�.
 select department_id as �μ��ڵ�,
        count(*) as �����,
        max(salary) as �ִ�޿�,
        min(salary) as �ּұ޿�
  from employees
  group by department_id
  order by 1;
        
  
   
   
   
                                                                                                                                                                                                                                                                                      
        
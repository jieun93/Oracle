2019-12-26-01)���ڿ� �Լ�
6) REPLACE
    - �־��� ���ڿ� ���� Ư�� ����(���ڿ�)�� �ٸ� ��(���ڿ�)�� ġȯ
    - TRIM, LTRIM, RTRIM�� ���ڿ� ���ο� �����ϴ� ���� ���� ������ �������� ����
    - REPLACE�� �ܾ� ������ ���� ���� ����
    (�������)
    REPLACE(c1, c2 [,c3])
        . c1 ���ڿ����� ����(��) c2�� ã�� c3����(��)�� ġȯ
        . c3�� �����Ǹ� c2����(��)�� ������
        
        
        ��)
        select replace('����ȭ ���� �Ǿ����ϴ�','ȭ','��')from dual;
        select replace('����ȭ ���� �Ǿ����ϴ�','ȭ')from dual;
        select replace('����ȭ ����   �츮���� ���Դϴ�','  ',' ')from dual;
        select replace('����ȭ ����   �츮���� ���Դϴ�',' ')from dual;
        
        ����] ȸ�����̺���'��'�� ���� ���� ȸ���� '��'���� ��ȯ�Ͻÿ�.
         Alias�� ȸ����ȣ, ȸ���̸�,��ȭ��ȣ�̴�.
         
         select mem_id as ȸ����ȣ,
                replace (substr(mem_name,1,1),'��','��')|| substr(mem_name,2)as ȸ���̸�,
                mem_hp as ��ȭ��ȣ
                
            from member
            --    where substr(mem_name,1,1)='��'; 
            where mem_name like '��%';  
          
 7) TRANSLATE
    - �־��� ���ڿ��� �Ű������� �����Ǵ� ���ڿ��� ������ �����Ǵ� ���ڿ��� ġȯ
    (�������)
    TRANSLATE(c1,c2,c3)
    .�־��� ���ڿ� c1�� ���Ե� ���� �� �����Ǵ� c2�� ���ڷ� c3�� ���ڸ� ġȯ
    .c3���ڰ� c2 ���� ������ �ش� ���ڴ� ���ŵ�.
    
    select translate ('abcdefghij','9876543210','sql developer')from dual;
    select buyer_bankno,
         translate(buyer_bankno,'1234567890-','abcdefghij')
    from buyer;
                
                
        select buyer_bankno,
         translate(buyer_bankno,'1234567890-','1234567890')
    from buyer;        
                
    ��) ȸ�����̺��� ȸ���� ����ȭ��ȣ �� '-'�� ')'�� ġȯ�Ͻÿ�.
    select mem_hometel,
            replace(mem_hometel,'-',')'),
            translate(mem_hometel,'0123456789-','0123456789)')
        from member;
                
                
    ��) ȸ�����̺��� ȸ���� ����ȭ��ȣ �� '-' ���� �Ͻÿ�.
    select mem_hometel,
            replace(mem_hometel,'-'),
            translate(mem_hometel,'0123456789-','0123456789')
        from member;           
                
                
 8)LENGTH, LENGTHB/*����ִ�ĭ��������Ҷ�*/
  - ���ڿ��� ���Ե� ������ ��(LENGTH)�� ��ü ����(LENGTHB)�� ��ȯ
  (�������)
  LENGTH(c), LENGTHB(c)
    . �־��� ���ڿ� C�� ����� ���ڼ��� �������� ũ��(BYTE)���� ��ȯ
    
    ��)ȸ�����̺��� �ּ�(MEM_ADD1)�� ���ڼ��� �������� ũ�⸦ ��ȸ�Ͻÿ�.
    Alias�� ȸ���̸�, �ּ�, ���ڼ�, �������� ũ��
    
    select  mem_name as ȸ���̸�, 
            mem_add1 as �ּ�,
            length(mem_add1) as ���ڼ�, 
            lengthb(mem_add1) as "�������� ũ��"
    from member;
                
                
  9)INSTR
    - �־��� ���ڿ����� �Ű������� �����Ǵ� ����(��)�� ��ġ��(INDEX)��ȯ
    (�������)
    INTSTR(c1, c2 [m [,n]])
    . c1����(��)���� �� ó�� ������ c2����(��)�� ��ġ�� ��ȯ
    . m�� ������ġ(index)
    . n�� �ݺ��� Ƚ��(n��°)
    
    ��)
    select instr('banana','a',1,2)from dual;
    select instr('banana','a',3,2)from dual;
    
    ����] ��ǰ���̺��� �� ó�� ������ ������ ��ġ���� ��ȸ�Ͻÿ�.
    Alias�� ��ǰ��, ��ġ��
    select prod_name as ��ǰ��,
            instr(prod_name,' ') as ��ġ��
         from prod;   
         
         
         
         
         
         
         
         
         
         
         
2019-12-23-02)�Լ�(function)
/*�Լ��� �ݵ�� ��ȯ�����ִ�.select����������Ҽ��ִ�.*/
    - �Լ��� ���� ��ġ�� ��� ���� ��ȯ(select, where, having ���� ��밡��)
    - �ý��ۿ��� �����ϴ� �Լ�
    - ���ڿ� �Լ� , �����Լ�, ��¥���Լ�, �����Լ�, ��ȯ�Լ� ���� ����
    
    1. ������ �Լ�
      1) '||' : ���ڿ� ���� ������
        -java�� '+'(���ڿ�)�� ����
        (�������)
        c1 || c2
        . 'c1'�� 'c2'�� ���ڿ��ڷ� �Ǵ� ���ڿ� �ڷḦ �����ϰ� �ִ� �÷���
        . ���� ����� �����ϴ� �Լ��δ� concat(c1,c2)�� ����
        . 'c1' �� 'c2'�� �����Ͽ� ���ο� ���ڿ� ��ȯ
        
        
        ��) ȸ�����̺��� �ڷḦ �̿��Ͽ� ������ ���� ����� ����ϵ��� query�� �ۼ��Ͻÿ�.
        (��� ��)
        ������ ȸ������ ���ϸ����� 1000���Դϴ�.
        
        select  mem_name || 'ȸ������ ���ϸ�����' ||mem_mileage||'���Դϴ�.'
            from member;
            
    2) concat 
        - �ΰ��� ��밡��
        - ���ڿ� ���� �Լ�
        - '||'�� ���� ���
        (�������)
        concat (c1, c2)
            . c1�� c2�� �����Ͽ� ���ο� ���ڿ� ��ȯ
            
    ��)ȸ�����̺��� ���ϸ����� 3000�̻��� ����ȸ���� �ڷḦ ��ȸ�Ͻÿ�.
     Alias�� ȸ����ȣ, ȸ����, �ֹι�ȣ, ���ϸ���(�ֹι�ȣ��: '123456-2345678')
        �ֹι�ȣ ���տ� concat�Լ��� ����Ͻÿ�.
        
        select mem_id as ȸ����ȣ,
                mem_name as ȸ����,
                concat(mem_regno1,concat('-', mem_regno2)) as �ֹι�ȣ,
                --mem_regno1 ||'-'|| mem_regno2 as �ֹι�ȣ,
                mem_mileage as ���ϸ���
                
                from member
               where mem_mileage >= 3000 and (mem_regno2 like'1%' or mem_regno2 like'3%') ;
                
    3) lower(c1)/*�ҹ���*/,upper(c1)/*�빮��*/,initcap(c1)/*�ܾ���۵Ǵ� ù���ڸ� �빮�ڷ� �����°�*/
        - 'lower(c1)': c1�� ��� ���ڸ� �ҹ��ڷ� ��ȯ
        - 'upper(c1)' :c1�� ��� ���ڸ� �빮�ڷ� ��ȯ
        - 'initcap(c1)' : c1�� �ܾ� ù ���ڸ��� ���ڷ� ��ȯ

��) ������̺�(employees)�� ������� �ҹ��ڷ� �����Ͻÿ�.
    Alias�� �����ȣ(employee_id), �����(emp_name), �μ���ȣ(department_id) �̴�.
    
    select employees_id as �����ȣ, 
            lower(emp_name) as "�����(��)",
            upper(emp_name) as "�����(��)",
            initcap(emp_name) as "�����(initcap)",
            department_id as �μ���ȣ


    from employees;

select mem_id, mem_name, mem_mileage
    from member
    where UPPER(mem_id) < 'F001';




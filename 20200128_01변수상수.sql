2020-01-28-01)����/���
1)��������
   �ĺ��� [constant] /*��� ����°�*/ ������Ÿ�� [:= �ʱⰪ]; /*�Ҵ� ������  �ڹ��� '=' �ϰ� �����ϴ�.�����ϰ�� �ʱⰪ�� �� �־���� �Ѵ�.*/
  - 'constant' : �������
  - ������Ÿ�� : ǥ�� sql�� ������ Ÿ�԰� integer, boolean ���� ���
    .integer[binary_integer,pls-integer] : 
     2147483647~~~-21474832648���� ��� ����
    .boolean : ��(ture),����(���Τ�),null �� ó��
    .���ڵ� Ÿ��
   
    (1)%type :������ ������Ÿ��
    (�������)
    �ĺ��� ���̺��.�÷���%rowtype[:=�ʱⰪ];
    -'���̺��.�÷���'�� ������ Ÿ��/ũ���� ������ ����
   
    (2)%rowtype --��� ���� ó�� �Ҽ��ֵ��� ���������
    (�������)
    �ĺ��� ���̺��.�÷���%rowtype;
    -'���̺��'�� �౸���� ������ Ÿ��/ũ���� ������ ����
   
 ��) ȸ�����̺��� ���ϸ����� ���� ���� ������ ����ȸ���� ������ ��ȸ�ϴ� �͸� ����� �ۼ��Ͻÿ�.
  ��ȣ �̸� ���ϸ���
   select a.mem_id, a.mem_name, b.maxm
    from member a,(select  mem_id,
                           mem_mileage as maxm
                    from member
                    where (substr(mem_regno2,1,1)='1' or substr(mem_regno2,1,1)='3')--����ȸ���̶�� ����
                   -- and rownum = 1
                    order by 2 desc) b
  where a.mem_id=b.mem_id
  and rownum = 1;
    
   
   (�͸���)
   declare
      v_id member.mem_id%type;
      v_name member.mem_name%type;
      v_mile number:=0;
      v_res varchar2(100);
   begin   
       select a.mem_id, a.mem_name, b.maxm into v_id,v_name,v_mile --�ڵ����� �Ҵ��ϼ���.
    from member a,(select  mem_id,
                           mem_mileage as maxm
                    from member
                    where (substr(mem_regno2,1,1)='1' or substr(mem_regno2,1,1)='3')--����ȸ���̶�� ����
                   -- and rownum = 1
                    order by 2 desc) b
  where a.mem_id=b.mem_id
  and rownum = 1;
   
   v_res:=v_id||', '||v_name||', '||v_mile;
   
   dbms_output.put_line(v_res);
 end;
   
   ��) Ű����� �μ���ȣ�� �Է¹޾� �ش�μ��� �޿� �Ѿ��� ����ϴ� �͸��� �ۼ�
   
   (�μ��� �޿��Ѿ�)
   select a.department_id, b.department_name, sum(a.salary)
     from employees a, departments b
   where a.department_id = b.department_id
      and a.department_id = 50
   group by a.department_id,b.department_name
   order by 3 desc;
   
   (�͸���)-- accept : ��¹޴� Ű����
   accept p_id prompt '�μ���ȣ �Է�(10-110):' --�μ���ȣ�� Ű����κ��� �Է��� �޴°Ÿ� p_id(���ڿ�)�� �ִ´�.
   declare
    v_id employees.department_id%type;
    v_name departments.department_name%type;
    v_sal number(10):=0;
   begin
  v_id := to_number('&p_id');
    select b.department_name, sum(a.salary) into v_name,v_sal
     from employees a, departments b
   where a.department_id = b.department_id
      and a.department_id = v_id
   group by b.department_name
   order by 2 desc;
    
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line(' �μ��ڵ�       �μ���                �޿��Ѿ�');
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('   '||v_id||'        '||v_name||'        '||v_sal);
    
    exception -- Ư¡: Ŭ���� �̸��� ���.
     when others then
      dbms_output.put_line('�����߻� : '||sqlerrm);
 end;     
 
 2) ����� �ݺ���
 1)if��
  -�������α׷� ����� if���� ���� ����
 
 (�������)
 if ���� then
   ��ɹ�1;
   end if;
   
   if ���� then
    ��ɹ�1;
   else
    ��ɹ�2;
    end if;
    
*��ø if

   if ����1 then
    ��ɹ�1;
   elsif ����2 then
    ��ɹ�2;
     :
   end if;
 
   if ����1 then 
     if ����2 then
        ��ɹ�1;
       else 
        ��ɹ�2
   end if;
   else
   ��ɹ�3;
   end if;
   
   
   ��) ��ǰ�з����̺��� �з���ȣ 'p302' �ڷᰡ ������ �ڷḦ update�ϰ� 
        �ڷᰡ ������ ���� �ڷḦ insert �Ͻÿ�.
        [�ڷ�]
        lprod_id : 15
        lprod_gu :'p302'
        lprod_nm : 'ȭ��ǰ(������)'
        
        
        declare
          v_num number :=0;
        begin
         select count(*) into  v_num
         from lprod
         where lprod_gu='p302'
         
         
         if v_num=0 then
            insert into lprod values(15,'p302','ȭ��ǰ(������)');
         else
           update lprod
              set lprod_id = 15,
                  lprod_nm = 'ȭ��ǰ(������)'
             where lprod_gu ='p302';
         end if;
         commit;
           end;  
        
    
    select * from lprod where lprod_gu='p302';
   
   ��) ������ ��������� �Է� �޾� ������ ����ϴ� ��� �ۼ�
   
   accept p_bir prompt '��������� �Է�(yyyymmdd) : '
   declare
     v_days number := 0;
     v_rem number := 0;
     v_dow varchar2(20);
   begin
   v_days:=trunc(to_date('&p_bir')-to_date('00010101'))-1;
   v_rem:=mod(v_days,7);
   
   if v_rem=0 then
      v_dow:='��';
   elsif  v_rem=1 then
      v_dow:='��'; 
   elsif  v_rem=2 then
      v_dow:='ȭ'; 
   elsif  v_rem=3 then
      v_dow:='��'; 
   elsif  v_rem=4 then
      v_dow:='��'; 
   elsif  v_rem=5 then
      v_dow:='��';    
    else
      v_dow:='��'; 
 end if;
 
  dbms_output.put_line(to_date('&p_bir')||'�� '||v_dow||'������');
 end;
    
 2) case when then
  - java�� switch~case ���� ����
  (�������)
  case ����[����]
        when ��1 then
            ���1;
        when ��2 then
            ���2;
            :
            else
            ���n;
  end case;
  
  ��) ȸ�����̺��� ������ �ֺ��� ȸ������ ��տ����� ���Ͽ�
  10��~30�� : '���� ���ɴ� ����'
  40��~60�� : '��� ���ɴ� ����'
  70�� �̻� : '��� ���ɴ� ����'�� ����� ���
  alias�� ����, ��տ���, ���
  
  (������ �ֺ��� ȸ���� ��տ���)
elect distinct a.mem_job, b.ayear, case when b.ayear >= 10 and b.ayear <= 39 then
                                '���� ���ɴ� ����'
                                when b.ayear >= 40 and b.ayear <= 69 then
                                '��� ���ɴ� ����'
                                else
                                '��� ���ɴ� ����' end as ���
  from member a,(select mem_job,
                      avg(extract(year from sysdate) - extract(year from mem_bir)) as ayear
                 from member
                where mem_job = '�ֺ�'
                group by mem_job) b
 where a.mem_job = b.mem_job;
 
 (�͸���)
 /*declare
  v_years number(5,1) :=0; --�ʱⰪ 0
  v_job  varchar2(10) :='�ֺ�';
  v_mess varchar2(50);
 begin
  select avg(extract(year from sysdate) - extract(year from mem_bir)) into v_years
    from member
   where mem_job = '�ֺ�';
   
   case trunc(v_years/10) when 1 then v_mess:='���� ���ɴ� ����'; 
        when 2 then v_mess:='���� ���ɴ� ����'; 
        when 3 then v_mess:='���� ���ɴ� ����'; 
        when 4 then v_mess:='��� ���ɴ� ����'; 
        when 5 then v_mess:='��� ���ɴ� ����'; 
        when 6 then v_mess:='��� ���ɴ� ����'; 
        else  v_mess:='��� ���ɴ� ����';  
   end case;
   */
        
        case when v_years between 10 and 39 then v_mess :='���� ���ɴ� ����';
             when v_years between 40 and 69 then v_mess :='��� ���ɴ� ����';
             else v_mess :='��� ���ɴ� ����';
       end case;
      dbms_output.put_line(v_job||'ȸ���� ��� ���� : '||v_years||'�� : '||v_mess);
  end;    
                        
                        
                          
  
 
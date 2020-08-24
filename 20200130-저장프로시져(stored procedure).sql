2020-01-30-02)�������ν���(stored procedure)
  - ������ ����� ó�� ���
  - �̸� �����ϵǾ� ����
  - Ŭ���̾�Ʈ���� ó����ƾ ������� ����(����� ĸ��ȭ�� �ϰ��� ����)
  - ������ȣ �� �ϰ��� ���� ���
  - ��ȯ���� ����
  (�������)
  create [or replace] procedure ���ν��� �̸�[(
     ������ [in|out|inout] Ÿ�Ը�[:=[default] expr],...)]
  [is|as]
  begin
    ��ɹ�(��);
    
    [exception
      ����ó����;]
  end; 
  
��)2005�� 6�� 30�� �������� ��ٱ������̺��� 6�� �Ǹŵ� ��ǰ�� �Ǹż����� ���� ��
  ������ ���̺��� update �ϴ� ���ν��� �ۼ�
  
(6�� �Ǹŵ� ��ǰ�� �Ǹż���)
select cart_prod, sum(cart_qty)
  from cart
 where cart_no like '200506%'
 group by cart_prod; 
  
(update �ϴ� ���ν��� �ۼ�)

create or replace procedure proc_remain_01(
   p_prod in cart.cart_prod%type, p_qty in cart.cart_qty%type)
is

begin
   update remain
      set remain_o=remain_o+p_qty,
          remain_j_99=remain_j_00+remain_i-remain_o-p_qty,
          remain_date=to_date('20050630')
    where remain_year='2005'
      and remain_prod=p_prod;
      
   exception
     when others then
       dbms_output.put_line('�����߻� : '||sqlerrm);
end;
  
2)���ν��� ������
  (1)��������
     exec[execute] ���ν���(�Ű�����,...);
  
  (2)�͸���(�Լ� ��)���� ����
     ���ν���(�Ű�����,...);
  
(������ ���� Ŀ���� ���Ե� �͸��� �ۼ�)   

declare
   cursor cur_cart_06
   is
     select cart_prod, sum(cart_qty) as samt
       from cart
      where cart_no like '200506%'
      group by cart_prod; 
begin
   for rec_cart in cur_cart_06
   loop
      proc_remain_01(rec_cart.cart_prod, rec_cart.samt);
   end loop;
end;   

��)ȸ�����̺��� ȸ����ȣ�� �Է� �޾� ȸ�������� ����ϴ� ���ν��� �ۼ�

create or replace procedure proc_member_01(
  p_id in member.mem_id%type)
is
  v_name member.mem_name%type;
  v_addr1 member.mem_add1%type;
  v_addr2 member.mem_add2%type;
begin
  select mem_name,mem_add1,mem_add2 into v_name,v_addr1,v_addr2
    from member
   where mem_id = p_id;
   
  dbms_output.put_line('ȸ���� : '|| v_name);
  dbms_output.put_line('��  �� : '|| v_addr1||' '||v_addr2);
end;

execute proc_member_01('b001');

��)Ű����� ���� �Է¹޾� �ش���� ����Ǽ��� ��������հ�, ����ݾ��հ踦 ���ϴ�
   ���ν��� �ۼ�
   procedure�� : proc_cart_02
   
   
create or replace procedure proc_cart_02(
  p_mon in varchar2, p_cnt out number, p_qty out number, p_sum out number)
is
  v_no varchar2(6):='2005'||p_mon;
begin
  select count(*),sum(cart_qty),sum(cart_qty*prod_price) into p_cnt,p_qty,p_sum
    from cart,prod
   where cart_prod=prod_id
     and substr(cart_no,1,6)=v_no;
end;
   
(������)
accept ap_mon  prompt '���� 2�ڸ��� �Է� : '
declare
  v_cnt number:=0;
  v_qty number:=0;
  v_sum number:=0;
begin 
  proc_cart_02('&ap_mon',v_cnt,v_qty,v_sum);
  
  dbms_output.put_line('&ap_mon'||'���� ��Ȳ');
  dbms_output.put_line('-------------------------');
  dbms_output.put_line('����Ǽ� : '||lpad(v_cnt,13,' '));
  dbms_output.put_line('������� : '||lpad(to_char(v_qty,'9,999'),13,' '));
  dbms_output.put_line('����ݾ� : '||lpad(to_char(v_sum,'999,999,999'),13,' '));
  dbms_output.put_line('-------------------------');
end;  
   
��)������̺��� �μ���ȣ 60�� �μ��� ���� ������� �޿��� 20% �÷� �����ϴ� 
   ���ν����� �ۼ��Ͻÿ�, �� ó�� �Ǽ��� ����Ͻÿ�
   procedure�� : proc_emp_02

create or replace procedure  proc_emp_02(
  p_emp_id in employees.employee_id%type, p_sal in employees.salary%type)
is
begin
  update employees
     set salary=salary+(salary*0.2),
         update_date=sysdate
   where employee_id=p_emp_id; 
   
  commit; 
end;

(������)
declare
  v_cnt number:=0;
  cursor cur_emp_03
  is
    select employee_id, salary
      from employees
     where department_id=60; 
begin
  for rec_emp in cur_emp_03
  loop
    v_cnt:=v_cnt+1;
    proc_emp_02(rec_emp.employee_id,rec_emp.salary);
  end loop;  
  
  dbms_output.put_line('ó���Ǽ� : '||v_cnt);
end;  
2020-02-03-01)Ʈ����
��)������̺��� �����ȣ 202�� ����� �ҼӺμ��� 20���μ����� 40�� �μ���
   �̵���ġ�Ǿ����� �� ������ job_history���̺� �����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�
   
create or replace trigger tg_emp_01
  after  update on employees
  for each row
declare
  v_cnt number:=0;
begin
  select count(*) into v_cnt
    from job_history
   where employee_id=:old.employee_id;
  
  if v_cnt=0 then
    insert into job_history values(:old.employee_id,:old.update_date,
                                   sysdate-1,:old.job_id,:old.department_id,
                                   sysdate,sysdate);
  elsif v_cnt<>0 then
    update job_history
       set start_date=:old.update_date,
           end_date=sysdate-1,
           job_id=:old.job_id,
           department_id=:old.department_id,
           update_date=:old.update_date
     where employee_id=:new.employee_id;
  end if;
end;  

update employees
   set department_id=40
 where employee_id=202;  
 
 
select * from employees where employee_id=202; 

select * from job_history;


��)��ٱ������̺��� 2005�� 7�� 28�� 'b001'ȸ���� �ڷḦ �����ϰ� ���������̺��� ������ �����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�(������ 2007�� 7�� 30��)
 
create or replace trigger tg_remain_03
  after delete on cart --cart ���̺��� delete�� �߻��� ������ 
  for each row -- �� �� ����
declare
  v_qty cart.cart_qty%type;
  v_prod_id cart.cart_prod%type;
begin
  v_qty:=-(:old.cart_qty);
  v_prod_id:=(:old.cart_prod);
  
  update remain
     set remain_o=remain_o+v_qty,
         remain_j_99=remain_j_99+v_qty
   where remain_year='2005'
     and remain_prod=v_prod_id;
  
  exception
    when others then
      dbms_output.put_line('���ܹ߻� : '||sqlerrm);
end;      
  
 --b001����� 20050728�� ��ٱ��� �������°� 1��  
select * from cart 
  where substr(cart_no,1,8)='20050728' 
    and cart_member='b001';
    
    
 --���Ÿ� ������� ��� remain���̺� �ݿ��Ǿ�� �Ѵ�.
select * from remain
  where remain_prod in ('P302000001','P201000016',
                        'P302000002','P201000017');
                        
delete cart                        
 where cart_member='b001'
   and substr(cart_no,1,8)='20050728';
   
 
   
   
   
   
   
   
   
   
   
   
   
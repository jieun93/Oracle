2020-01-30-01)for��
 - ������� �̿��� �ݺ���� ����
 - ����� ��޾���� for���� ����
 (�������)
 for ����� in[reverse] �ʱⰪ..������
 loop
   ��ɹ�(��);
end loop;

��)
declare
  v_base number:=5;
 begin
   for i in reverse 1..9 loop  --reverse�� ������  ������ �����°�
    dbms_output.put_line(v_base||'*'||i||' = '||v_base*i);
end loop;
end;


2)Ŀ������ ����ϴ� for��
(�������)
for ���ڵ� in Ŀ����(�Ű�����, �Ű�����,...)
loop
  ��ɹ�(��);
end loop;


��) ������̺��� �μ���ȣ 60���� ���� ����� �̸��� ����ϴ� Ŀ���� �ۼ�

declare
  cursor cur_emp_01
  is
    select emp_name,salary
     from employees
    where department_id=60;
 begin   
  for rec_emp in cur_emp_01
  loop
   dbms_output.put_line(rec_emp.emp_name||', '||rec_emp.salary);
   end loop;
   end;
  
  
3) Ŀ������ ����ϴ� for ��
  (�������)
  for ���ڵ� in (Ŀ������)
  loop
   ��ɹ�(��);
   end loop;
   

declare
begin   
  for rec_emp in (select emp_name,salary
                             from employees
                             where department_id=60)
  loop
   dbms_output.put_line(rec_emp.emp_name||', '||rec_emp.salary);
   end loop;
   end;







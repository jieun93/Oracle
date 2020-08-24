
  create table retire(
  employee_id number(6) not null,
  department_id number(6),
  job_id varchar2(10),
  
  constraint pk_retire primary key(employee_id),
  constraint fk_retire foreign key(employee_id)
  references employees(employee_id) );
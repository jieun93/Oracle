select * from lprod; --왼쪽의 콤보박스용

select * from prod;
select * from prod where prod_lgu='P301'; --오른쪽 콤보박스용

select * from prod where prod_id='P301000002'; --테이블 뷰용

select prod_name, prod_id, prod_lgu, prod_cost, prod_buyer from prod where prod_lgu ='P201';

select 'private ' || 
        decode(lower(data_type), ' number ', ' int ', ' String ') || 
        lower(column_name) ||';'
from cols
where lower(table_name) = 'prod';


select lprod_gu, lprod_nm from lprod;

<select>
<option value="p101">컴퓨터제품</option>
<option value="p101">컴퓨터제품</option>
<option value="p101">컴퓨터제품</option>
<option value="p101">컴퓨터제품</option>
</select>

select prod_id, prod_name

select prod_name
from prod where prod_lgu='p102';



select * from memberjoin;

INSERT INTO MEMBERJOIN VALUES('aa','dd','ff','ee','tt','yy');

alter table memberjoin add MEM_GENDER CHAR DEFAULT NULL;

ALTER TABLE MEMBERJOIN ADD MEM_BIRTH CHAR DEFAULT NULL;
ALTER TABLE MEMBERJOIN ADD MEM_MAIL CHAR DEFAULT NULL;
alter table memberjoin add mem_zip varchar2(20);
alter table memberjoin modify(mem_gender varchar2(20));
alter table memberjoin modify(mem_mail varchar2(100));


select * from memberjoin;

select * from jdbc_board; 

select * from jdbc_board order by board_no desc;

select * from lprod;

select *from prod;


2020-01-22-03)sequence 객체
 - 자동적으로 증가, 감소하는 값을 반환하는 객체
 - 테이블에 독립적으로 생성되므로 여러 테이블에서 사용 가능
 - 테이블 설계시 적당항 pk가 없는 경우 사용하거나
 계속적으로 증가되는 값이 필요한 경우 사용
 - 다른 dbms에서는 컬럼의 데이터 타입 중 number 값의 속성으로 제공되는 경우가 있음
 
 (사용형식)
 create sequence 시퀀스명 --시퀀스 객체를 사용하려면 
    [start with n] --시작하는 값
    [increment by n]--증가하는 값
    [maxvalue n| nomaxvalue]--
    [minvalue n| nominvalue]--생략이 되면 1이 되어진다.
    [cycle | nocycle]-- 처음부터 max까지 돌는거 /nocycle : 기본값
    [order | noorder]-- 명령 
   
   
   **의사컬럼(Pseudo Column)- 가상의 컬럼
---------------------------------------------------------------------
   Pseudo Column                             내용                  
---------------------------------------------------------------------
시퀀스명.nextval                            '시퀀스명'객체의 다음 값
시퀀스명.currval                            '시퀀스명'객체의 현재 값
---------------------------------------------------------------------
 시퀀스객체가 생성된 후 반드시 첫번째 명령으로  시퀀스명.nextval가 사용되어야 함
 
 .select문의 select 절, insert문 subquerydml select절, values 절,
 update문의 set 절에서 사용
 
 delete lprod
 where lprod_id>6; 
 
 select * from lprod;
 

 
 예) lprod테이블에 다음 자료를 삽입하시오. 단, lprod_id는 시퀀스를 이용하시오.
 ----------------------------------------
  lprod_id   lprod_gu         lprod_nm
 ----------------------------------------
    7         p401             음반/cd
    8         p402             도서
    9         p403             잡화
 ----------------------------------------
 
 
 
 (1) 시퀀스 생성
 create sequence seq_lprod
  start with  7;
  
  drop sequence seq_lprod; --삭제하는거
  select seq_lprod.currval from dual;
  select seq_lprod.nextval from dual;
 
 (2) insert 문
 insert into lprod
 values(seq_lprod.nextval,'p401','음반/cd');
 
  insert into lprod
 values(seq_lprod.nextval,'p402','도서');
 
  insert into lprod
 values(seq_lprod.nextval,'p403','잡화');
 
 
 
 
 
 
 
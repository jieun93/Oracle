2020-01-20-03)merge 명령
- 조건을 비교하여 조건에 일치하는 자료가 없으면 insert문을 조건에 일치하는 자료가 있으면 update문을 수행하는 명령문

(사용형식)
merge into 테이블명
    using (insert나 update가 될 데이터 원천) on(update될 조건)
  when matched then
    UPDATE
        set 컬럼명1=값1 [, 컬럼명2=값2,.....]
    where 조건
    
    when not matched then
        insert (컬럼명1 [,컬럼명2....]) value (값1 [,값2,...])
        where 조건;
        
   예) 상품분류테이블에 다음 자료를 추가 또는 수정하시오.
   순번(lprod_id) : 7
   분류코드(lprod_gu) :'P401'
   분류명(lprod_nm) : 'DVD'
   
   update lprod
     set lprod_nm='DVD'
         lprod_id=11
     where lprod_gu'P401';
     
    rollback;
    
    
    merge into lprod a
        using dual on(lprod_gu='P401')
       when matched then 
       update
        set a.lprod_id=11,
            a.lprod_nm='DVD'
    when not matched then
     insert (a.lprod_id,a.lprod_nm,a.lprod_gu) values(11,'DVD','P401');
       

   순번 : 10
   분류코드 :'P501'
   분류명 '농수물'
   
   
   merge into lprod a
        using dual on(lprod_gu='P501')
       when matched then 
       update
        set a.lprod_id=10,
            a.lprod_nm='농산물'
    when not matched then
     insert (lprod_id,lprod_nm,lprod_gu) values(10,'농산물','P501');
     
     rollback;
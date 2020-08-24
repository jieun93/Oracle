2020-01-28-01)변수/상수
1)선언형식
   식별자 [constant] /*상수 만드는거*/ 데이터타입 [:= 초기값]; /*할당 연산자  자바의 '=' 하고 동일하다.숫자일경우 초기값을 꼭 넣어줘야 한다.*/
  - 'constant' : 상수선언
  - 데이터타입 : 표준 sql의 데이터 타입과 integer, boolean 등이 사용
    .integer[binary_integer,pls-integer] : 
     2147483647~~~-21474832648까지 사용 가능
    .boolean : 참(ture),거짓(ㄹ민ㄷ),null 값 처리
    .레코드 타입
   
    (1)%type :참조형 데이터타입
    (사용형식)
    식별자 테이블명.컬럼명%rowtype[:=초기값];
    -'테이블명.컬럼명'와 동일한 타입/크기의 기억공간 선언
   
    (2)%rowtype --모든 열을 처리 할수있도록 만들어진것
    (사용형식)
    식별자 테이블명.컬럼명%rowtype;
    -'테이블명'의 행구조와 동일한 타입/크기의 기억공간 선언
   
 예) 회원테이블에서 마일리지가 가장 많이 보유한 남성회원의 정보를 조회하는 익명 블록을 작성하시오.
  번호 이름 마일리지
   select a.mem_id, a.mem_name, b.maxm
    from member a,(select  mem_id,
                           mem_mileage as maxm
                    from member
                    where (substr(mem_regno2,1,1)='1' or substr(mem_regno2,1,1)='3')--남성회원이라는 조건
                   -- and rownum = 1
                    order by 2 desc) b
  where a.mem_id=b.mem_id
  and rownum = 1;
    
   
   (익명블록)
   declare
      v_id member.mem_id%type;
      v_name member.mem_name%type;
      v_mile number:=0;
      v_res varchar2(100);
   begin   
       select a.mem_id, a.mem_name, b.maxm into v_id,v_name,v_mile --자동으로 할당하세요.
    from member a,(select  mem_id,
                           mem_mileage as maxm
                    from member
                    where (substr(mem_regno2,1,1)='1' or substr(mem_regno2,1,1)='3')--남성회원이라는 조건
                   -- and rownum = 1
                    order by 2 desc) b
  where a.mem_id=b.mem_id
  and rownum = 1;
   
   v_res:=v_id||', '||v_name||', '||v_mile;
   
   dbms_output.put_line(v_res);
 end;
   
   예) 키보드로 부서번호를 입력받아 해당부서의 급여 총액을 출력하는 익명블록 작성
   
   (부서의 급여총액)
   select a.department_id, b.department_name, sum(a.salary)
     from employees a, departments b
   where a.department_id = b.department_id
      and a.department_id = 50
   group by a.department_id,b.department_name
   order by 3 desc;
   
   (익명블록)-- accept : 출력받는 키워드
   accept p_id prompt '부서번호 입력(10-110):' --부서번호를 키보드로부터 입력을 받는거를 p_id(문자열)에 넣는다.
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
    dbms_output.put_line(' 부서코드       부서명                급여총액');
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('   '||v_id||'        '||v_name||'        '||v_sal);
    
    exception -- 특징: 클래스 이름이 길다.
     when others then
      dbms_output.put_line('오류발생 : '||sqlerrm);
 end;     
 
 2) 제어문과 반복문
 1)if문
  -응용프로그램 언언의 if문과 같은 형식
 
 (사용형식)
 if 조건 then
   명령문1;
   end if;
   
   if 조건 then
    명령문1;
   else
    명령문2;
    end if;
    
*중첩 if

   if 조건1 then
    명령문1;
   elsif 조건2 then
    명령문2;
     :
   end if;
 
   if 조건1 then 
     if 조건2 then
        명령문1;
       else 
        명령문2
   end if;
   else
   명령문3;
   end if;
   
   
   예) 상품분류테이블에서 분류번호 'p302' 자료가 있으면 자료를 update하고 
        자료가 없으면 다음 자료를 insert 하시오.
        [자료]
        lprod_id : 15
        lprod_gu :'p302'
        lprod_nm : '화장품(여성용)'
        
        
        declare
          v_num number :=0;
        begin
         select count(*) into  v_num
         from lprod
         where lprod_gu='p302'
         
         
         if v_num=0 then
            insert into lprod values(15,'p302','화장품(여성용)');
         else
           update lprod
              set lprod_id = 15,
                  lprod_nm = '화장품(여성용)'
             where lprod_gu ='p302';
         end if;
         commit;
           end;  
        
    
    select * from lprod where lprod_gu='p302';
   
   예) 본인의 생년월일을 입력 받아 요일을 계산하는 블록 작성
   
   accept p_bir prompt '생년월일을 입력(yyyymmdd) : '
   declare
     v_days number := 0;
     v_rem number := 0;
     v_dow varchar2(20);
   begin
   v_days:=trunc(to_date('&p_bir')-to_date('00010101'))-1;
   v_rem:=mod(v_days,7);
   
   if v_rem=0 then
      v_dow:='일';
   elsif  v_rem=1 then
      v_dow:='월'; 
   elsif  v_rem=2 then
      v_dow:='화'; 
   elsif  v_rem=3 then
      v_dow:='수'; 
   elsif  v_rem=4 then
      v_dow:='목'; 
   elsif  v_rem=5 then
      v_dow:='금';    
    else
      v_dow:='토'; 
 end if;
 
  dbms_output.put_line(to_date('&p_bir')||'은 '||v_dow||'요일임');
 end;
    
 2) case when then
  - java의 switch~case 문과 유사
  (사용형식)
  case 변수[수식]
        when 값1 then
            명령1;
        when 값2 then
            명령2;
            :
            else
            명령n;
  end case;
  
  예) 회원테이블에서 직업이 주부인 회원들의 평균연령을 구하여
  10대~30대 : '젋은 연령대 분포'
  40대~60대 : '장년 연령대 분포'
  70대 이상 : '노년 연령대 분포'를 비고난에 출력
  alias는 직업, 평균연령, 비고
  
  (직업이 주부인 회원의 평균연령)
elect distinct a.mem_job, b.ayear, case when b.ayear >= 10 and b.ayear <= 39 then
                                '젊은 연령대 분포'
                                when b.ayear >= 40 and b.ayear <= 69 then
                                '장년 연령대 분포'
                                else
                                '노년 연령대 분포' end as 비고
  from member a,(select mem_job,
                      avg(extract(year from sysdate) - extract(year from mem_bir)) as ayear
                 from member
                where mem_job = '주부'
                group by mem_job) b
 where a.mem_job = b.mem_job;
 
 (익명블록)
 /*declare
  v_years number(5,1) :=0; --초기값 0
  v_job  varchar2(10) :='주부';
  v_mess varchar2(50);
 begin
  select avg(extract(year from sysdate) - extract(year from mem_bir)) into v_years
    from member
   where mem_job = '주부';
   
   case trunc(v_years/10) when 1 then v_mess:='젊은 연령대 분포'; 
        when 2 then v_mess:='젊은 연령대 분포'; 
        when 3 then v_mess:='젊은 연령대 분포'; 
        when 4 then v_mess:='장년 연령대 분포'; 
        when 5 then v_mess:='장년 연령대 분포'; 
        when 6 then v_mess:='장년 연령대 분포'; 
        else  v_mess:='노년 연령대 분포';  
   end case;
   */
        
        case when v_years between 10 and 39 then v_mess :='젊은 연령대 분포';
             when v_years between 40 and 69 then v_mess :='장년 연령대 분포';
             else v_mess :='노년 연령대 분포';
       end case;
      dbms_output.put_line(v_job||'회원의 평균 연령 : '||v_years||'세 : '||v_mess);
  end;    
                        
                        
                          
  
 
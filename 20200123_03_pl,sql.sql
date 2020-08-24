2020-01-23-03)PL/SQL(Procedual Language SQL)
  - 표준 SQL에 부족한 변수, 비교, 분기, 반복 등의 기능이 추가된 SQL
  - block구조로 구성되어 모듈화, 캡슐화 기능도 제공
  - dbms 가 미리 컴파일하여 보관하고 실행시 호출하기 때문에 빠른 처리속도
  - 문법 등에 표준이 없음
  - 각 dbms에 따라 상이한 사용형식
  - Anonymous block, stored procedure, user function, package, trigger
  1) Anonymous block(익명블록)--이름 존재x, 재사용 할 수 없다, 저장되지 않는다.
    . 기본블록 구조 
    . 이름이 없는 블록
    (구성)
  DECLARE
    선언부 - 변수(V_), 상수(C_이름), 커서 선언 /매개변수 (P_)
  BEGIN 
    실행부 - 비지니스 로직을 구현하는 QUERY
    
    [EXCEPTION
        예외처리 영역]--생략 가능
        
 END;--끝나는 부분       
  -- 또는  /; 로 끝나는 경우도 있음  
     
     
     DECLARE
      v_num number:=10000;
      v_message varchar2(50);
   begin
      v_message:='나의 첫번째 PL/SQL 블록';
      
      DBMS_OUTPUT.PUT_LINE(V_MESSAGE||' '||V_NUM);
      END;
    -- 대,소문자 구분 안한다.
    
    ACCEPT V_NAME PROMPT '내 이름 : '
    DECLARE
      V_MESS VARCHAR2(100);
      V_ADD VARCHAR2(70):='대전시 중구 대흥동';
    BEGIN
      V_MESS:= '&V_NAME'||',  '||V_ADD;
      DBMS_OUTPUT.PUT_LINE(V_MESS);
   END;   
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
2019-12-26-01)문자열 함수
6) REPLACE
    - 주어진 문자열 내의 특정 문자(문자열)을 다른 문(문자열)로 치환
    - TRIM, LTRIM, RTRIM은 문자열 내부에 존재하는 공백 제거 가능은 제공하지 않음
    - REPLACE는 단어 내부의 공백 제거 가능
    (사용형식)
    REPLACE(c1, c2 [,c3])
        . c1 문자열에서 문자(열) c2를 찾아 c3문자(열)로 치환
        . c3가 생략되면 c2문자(열)을 제거함
        
        
        예)
        select replace('무궁화 꽃이 피었습니다','화','와')from dual;
        select replace('무궁화 꽃이 피었습니다','화')from dual;
        select replace('무궁화 꽃은   우리나라 꽃입니다','  ',' ')from dual;
        select replace('무궁화 꽃은   우리나라 꽃입니다',' ')from dual;
        
        문제] 회원테이블에서'이'씨 성을 가지 회원을 '리'씨로 변환하시오.
         Alias는 회원번호, 회원이름,전화번호이다.
         
         select mem_id as 회원번호,
                replace (substr(mem_name,1,1),'이','리')|| substr(mem_name,2)as 회원이름,
                mem_hp as 전화번호
                
            from member
            --    where substr(mem_name,1,1)='이'; 
            where mem_name like '이%';  
          
 7) TRANSLATE
    - 주어진 문자열과 매개변수로 제공되는 문자열의 순번에 대응되는 문자열로 치환
    (사용형식)
    TRANSLATE(c1,c2,c3)
    .주어진 문자열 c1에 포함된 문자 중 대응되는 c2의 문자로 c3의 문자를 치환
    .c3문자가 c2 보다 적으면 해당 문자는 제거됨.
    
    select translate ('abcdefghij','9876543210','sql developer')from dual;
    select buyer_bankno,
         translate(buyer_bankno,'1234567890-','abcdefghij')
    from buyer;
                
                
        select buyer_bankno,
         translate(buyer_bankno,'1234567890-','1234567890')
    from buyer;        
                
    예) 회원테이블에서 회원의 집전화번호 중 '-'를 ')'로 치환하시오.
    select mem_hometel,
            replace(mem_hometel,'-',')'),
            translate(mem_hometel,'0123456789-','0123456789)')
        from member;
                
                
    예) 회원테이블에서 회원의 집전화번호 중 '-' 제거 하시오.
    select mem_hometel,
            replace(mem_hometel,'-'),
            translate(mem_hometel,'0123456789-','0123456789')
        from member;           
                
                
 8)LENGTH, LENGTHB/*띄어주는칸수를계산할때*/
  - 문자열에 포함된 문자의 수(LENGTH)나 전체 길이(LENGTHB)를 반환
  (사용형식)
  LENGTH(c), LENGTHB(c)
    . 주어진 문자열 C에 저장된 글자수나 기억공간의 크기(BYTE)수를 반환
    
    예)회원테이블의 주소(MEM_ADD1)의 글자수와 기억공가의 크기를 조회하시오.
    Alias는 회원이름, 주소, 글자수, 기억공간의 크기
    
    select  mem_name as 회원이름, 
            mem_add1 as 주소,
            length(mem_add1) as 글자수, 
            lengthb(mem_add1) as "기억공간의 크기"
    from member;
                
                
  9)INSTR
    - 주어진 문자열에서 매개변수로 제공되는 문자(열)의 위치값(INDEX)반환
    (사용형식)
    INTSTR(c1, c2 [m [,n]])
    . c1문자(열)에서 맨 처음 만나는 c2문자(열)의 위치값 반환
    . m은 조사위치(index)
    . n은 반복된 횟수(n번째)
    
    예)
    select instr('banana','a',1,2)from dual;
    select instr('banana','a',3,2)from dual;
    
    문제] 상품테이블에서 맨 처음 만나는 공백의 위치값을 조회하시오.
    Alias는 상품명, 위치값
    select prod_name as 상품명,
            instr(prod_name,' ') as 위치값
         from prod;   
         
         
         
         
         
         
         
         
         
         
         
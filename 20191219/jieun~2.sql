2019-12-19-03 )자료 삭제
 -DELETE 문으로 지원
 (사용형식)
 DELETE FROM 테이블명 
  [WHERE 조건];--생략되면 테이블안에 있는 자료가 날아간다.
  .'WHERE 조건'이 생략되면 모든 자료가 삭제됨
  
  
  예) 장바구니테이블의 모든 자료를 삭제하시오
    
    SELECT * FROM CART;
    
    DELETE FROM CART;--전체자료를날려버린다.
    
   ROLLBACK;
  
  **테이블 삭제는 'DROP TABLE 테이블명'을 사용한다.
  --드롭명령은 롤백이 안된다.
  
  DROP TABLE TEMP02;
  ROLLBACK;
  
  
  
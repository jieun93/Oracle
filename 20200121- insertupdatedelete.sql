2020-01-21-02)서브쿼리를 이용한 insert/update/delete

재고수불테이블 생성
----------------------------------------------------------
컬럼명         데이터타입(크기)       nullable        key
----------------------------------------------------------
remain_year     char(4)              n.n           pk
remain_prod     varchar2(10)         n.n           pk/fk
remain_j_00     number(5)               --기초재고
remain_i        number(5)               --입고수량(buyprod)
remain_o        number(5)               --출고수량(cart)
remain_j_99     number(5)               --현재고(기초재고+입고-출고),기말재고
remain_date     date                    --수정되어진 날
----------------------------------------------------------
--create 객체를 생성하는 명령어

create table remain(
    remain_year char(4) not null,
    remain_prod varchar2(10) not null,
    remain_j_00 number(5),
    remain_i    number(5),
    remain_o    number(5),              
    remain_j_99  number(5),            
    remain_date  date,   
    
 constraint pk_remain primary key(remain_year,remain_prod),
 constraint fk_remain foreign key(remain_prod)
    references prod(prod_id));
    
    
예)remain 테이블에 다음 조건에 맞게 자료를 입력하시오.
    (조건)
    - 년도 :2005년
    - 상품코드 : 상품테이블(prod)의 상품코드
    - 기초재고 : 상품테이블(prod)의 적정재고(prod_properstock)
    - 입고수량 : 0
    - 출고수량 : 0
    - 기말재고 :상품테이블(prod)의 적정재고(prod_properstock)
    - 처리일자: 2004년 12월 31일
    
    
    insert into remain(remain_year,remain_prod,remain_j_00,remain_i,
                        remain_o,remain_j_99,remain_date)
          select '2005',prod_id,prod_properstock,0,0,prod_properstock,'20041231'--서브쿼리는 괄호를 묶지 않는다.두번째 서브쿼리는 괄호를 묶는다.
            from prod;
    
    **서브쿼리를 이용한 테이블 복사
    create table remain2 as
      select * from remain;--서브쿼리가 이용될때에는 괄호를 하지 않는다.
    --기본키 설정이름은 유일한 값이어야 한다.
    
2)서브쿼리를 이용한 data update

예) 2005년 1월 31일을 기준으로 제품별 입고수량을 조회하여 재고 수불테이블을 갱신하시오.
    
    (서브쿼리): 2005년 1월 제품별 입고수량을 조회
    select buy_prod, sum(buy_qty)
      from buyprod
     where buy_date between'20050101' and '20050131'  
    group by buy_prod;
    
    (메인쿼리) : 서브쿼리 결과로 remain 테이블 갱신
    update remain a
       set ( remain_i,remain_j_99,remain_date)=(--서브쿼리)
       
       (결합)
       update remain a
       set (remain_i,remain_j_99,remain_date)=(
            select remain_i+b.iamt,
                   remain_j_00+remain_i+b.iamt-remain_o,
                   '20050331'
              from(select buy_prod, sum(buy_qty) as iamt
                     from buyprod
                    where buy_date between'20050201' and '20050331'  
                    group by buy_prod) b
              where a.remain_prod=b.buy_prod)
      where a.remain_prod in(select distinct buy_prod
                                from buyprod
                                where buy_date between '20050201' and '20050331');
            
  --  rollback;
  4월1일 부터 4월30일  기말재고 출고만
   update remain a
       set (remain_o,remain_j_99,remain_date)
            =(select remain_o+b.oamt,
                   remain_j_00+remain_i-remain_o-b.oamt,
                   '20050430'
              from(select cart_prod, sum(cart_qty) as oamt
                     from cart
                    where cart_no like '200504%'  
                    group by cart_prod) b
              where a.remain_prod=b.cart_prod)
      where a.remain_prod in(select distinct cart_prod
                                from cart
                                where cart_no like '200504%' );
   rollback;
    commit;
    
    
    
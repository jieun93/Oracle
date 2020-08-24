2019-12-18
 ** ½ºÄÉÀÏ>Á¤¹Ğµµ
 .Á¤¹Ğµµ´Â 0ÀÌ ¾Æ´Ñ À¯È¿ ¼ıÀÚ ÀÚ¸®¼ö ÀÇ¹Ì
 .½ºÄÉÀÏ-Á¤¹Ğµµ °ªÀº ¼Ò¼ıÁ¡ ÀÌÇÏ¿¡ Á¸ÀçÇØ¾ß ÇÏ´Â '0'ÀÇ °¹¼ö¸¦ ÀÇ¹Ì
 ---------------------------------------------------------------
    ÀÔ·Â°ª                 ¼±¾ğ              ÀúÀåµÇ´Â °ª
----------------------------------------------------------------
    1.234             number(4,5)            ¿À·ù
    1.23              number(3,5)            ¿À·ù
    0.01234           number(4,5)           0.01234  (5-4=1 ¿µÀÇ ÀÚ¸®¼ö 1°³)
    0.0012345         number(3,5)           0.00123   (5-3=2 /À¯È¿ÀÚ¸®¼ö 3°³¿©¾ß ÇÏ°í ¼Ò¼öÁ¡ÀÌÇÏ ÀüÃ¼ ÀÚ¸®¼ö´Â 5°³¼ıÀÚ°¡ ÀÖ¾î¾ß ÇÑ´Ù.)
-------------------------------------------------------------------------------------------------------------------------


3. ³¯Â¥ Çü type (µ¡¼À(¾ÕÀ¸·ÎÀÇ³¯Â¥)°ú »¬¼À(ÀÌÀüÀÇ ³¯Â¥)ÀÇ´ë»óÀÌµÈ´Ù.)
 - date, timestamp,
 1)date
 .±âº» ³¯Â¥ ÀÚ·áÇü (7 byte)
 .³â ¿ù ÀÏ ½Ã ºĞ ÃÊÀÇ °ª ÀúÀå
 .+,- ÀÇ ¿¬»ê °¡´É
 (»ç¿ë Çü½Ä )
 ÄÃ·¯¸í  date
  - ½Ã½ºÅÛÀÌ Á¦°øÇÏ´Â ³¯Â¥ Á¤º¸´Â sysdate  ÇÔ¼ö ÀÌ¿ë,
  - ÀÏ¹İÀÚ·á(¼ıÀÚ,¹®ÀÚ¿­)¸¦ ³¯Â¥ÇüÀ¸·Î º¯È¯ÇÏ±â À§ÇØ¼­ to_date ÇÔ¼ö°¡ Á¦°ø µÊ
  
  ¿¹)
  create table temp04(
    col1 date,
    col2 date);
  
  
  insert into temp04(col1, col2) values(sysdate, sysdate+20);
  
  select * from temp04;
  
  select to_char(col1,'yyyy-mm-dd hh24:mi:ss') from temp04;
  
  2)timestamp
  .¿À¶óÅ¬ ¹öÀü 9i ÀÌÈÄ Á¦°ø
  .10¾ïºĞÀÇ 1ÃÊ±îÁö Á¦°ø 
  .timestamp, timestamp with time zone,timestamp with local time zone
  (1)timestamp
    -½Ã°£´ë(time zone)¿Í »ó°ü¾øÀÌ ³¯Â¥ ½Ã°£ Á¤º¸ ÀúÀå
  (2)timestamp with time zone
   -½Ã°£´ë(time zone)¿Í ³¯Â¥ ½Ã°£ Á¤º¸ ÀúÀå
   (3)timestamp with local time zone
     -¼­¹ö°¡ À§¯†ÇÑ Áö¿ªÀÇ ½Ã°£´ë(time zone)¿Í ³¯Â¥ ½Ã°£ Á¤º¸ ÀúÀå
    (»ç¿ëÇü½Ä)
    ÄÃ·³¸í timestamp[timestamp with time zone¤Ótimestamp with local time zone]
    
    ¿¹)
    create table temp05 (
    col1 date,
    col2 timestamp,
    col3 timestamp with time zone,
    col4 timestamp with local time zone);
    
    insert into temp05 ( col1, col2, col3, col4)
     values (sysdate,sysdate,sysdate,sysdate);
     
     select * from temp05;
     
     
    
  
  
  
  
  
  
 
 
 - 
    
 
 
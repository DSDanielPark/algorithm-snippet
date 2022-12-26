-- col1에는 있고, col2에는 없는 데이터 탐색


WITH TT AS 
        (
            SELECT  '1,2,3,4,5,6,7,8,9,10,11,12' AS COL1
                  , '1,2,3,4,5,6,7' AS COL2
            FROM    DUAL                  
        )
SELECT  A.CD ,B.CD
FROM    (
            SELECT
                    TRIM(REGEXP_SUBSTR(TT.COL1, '[^,]+', 1, LEVEL)) CD
            FROM    DUAL
                  , TT
            CONNECT BY LEVEL <= REGEXP_COUNT(TT.COL1, ',')+1
        ) A
      , (
            SELECT
                    TRIM(REGEXP_SUBSTR(TT.COL2, '[^,]+', 1, LEVEL)) CD
            FROM    DUAL
                  , TT
            CONNECT BY LEVEL <= REGEXP_COUNT(TT.COL2, ',')+1
        ) B
WHERE   A.CD = B.CD(+)



-- MySQL의 경우
CREATE TABLE LEVEL(
LEVEL INTEGER PRIMARY KEY AUTO_INCREMENT
);



INSERT INTO LEVEL(LEVEL)
SELECT NULL
FROM INFORMATION_SCHEMA.COLLATIONS A,
     INFORMATION_SCHEMA.COLLATIONS B  
LIMIT 500;


WITH TT AS 
        (
            SELECT  '1,2,3,4,5,6,7,8,9,10,11,12' AS COL1
                  , '1,2,3,4,5,6,7' AS COL2
            FROM    DUAL                  
        )
SELECT  A.CD ,B.CD
FROM    (
            SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(TT.COL1,',', LEVEL), ',', -1) AS CD 
            FROM    LEVEL
                  , TT
            WHERE   LEVEL <= 1 + LENGTH(TT.COL1) - LENGTH(REPLACE(TT.COL1,',',''))
        ) A
LEFT OUTER JOIN      
        (
         
            SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(TT.COL2,',', LEVEL), ',', -1) AS CD 
            FROM    LEVEL
                  , TT
            WHERE   LEVEL <= 1 + LENGTH(TT.COL2) - LENGTH(REPLACE(TT.COL2,',',''))
        ) B
ON      (       1 = 1 
            AND A.CD = B.CD
        )
;
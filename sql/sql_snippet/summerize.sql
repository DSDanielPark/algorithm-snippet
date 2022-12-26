-- A table로부터 요약 테이블 생성
-- 참고: https://koreapy.tistory.com/1784 
-- 주석으로 create table 예정


SELECT
   logym,
   activeflag,
   COUNT(id) as count(eid)
FROM A
GROUP BY logym, activeflag
ORDER BY logym ASC, activeflag DESC;
--문제3

--1. EMP 테이블에서 인원수,최대 급여,최소 급여,급여의 합을 계산하여 출력하는 SELECT 문장을 작성하여라.
SELECT COUNT(*) 인원수,MAX(SAL) 최대급여,MIN(SAL) 최소급여,
SUM(SAL) 급여합계 FROM EMP; 
 

--2. EMP 테이블에서 각 업무별로 최대 급여,최소 급여,급여의 합을 출력하는 SELECT 문장을 작성하여라.
SELECT JOB, MAX(SAL) 최대급여,MIN(SAL) 최소급여,
SUM(SAL) 급여합계 FROM EMP
GROUP BY JOB;

 

--3. EMP 테이블에서 업무별 인원수를 구하여 출력하는 SELECT 문장을 작성하여라.
SELECT JOB,COUNT(*) 인원수 FROM EMP
GROUP BY JOB; 
 

--4. EMP 테이블에서 최고 급여와 최소 급여의 차이는 얼마인가 출력하는 SELECT 문장을 작성하여라.
SELECT MAX(SAL)-MIN(SAL) 급여차액
FROM EMP; 
 

--5. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(group by)

--H_YEAR  COUNT(*)  MIN(SAL)  MAX(SAL)  AVG(SAL)  SUM(SAL)

-------- --------- --------- --------- --------- ---------

--    81       10       950      5000    2282.5	  22825

--    82        1      1300      1300      1300      1300

--    80        1       800       800       800       800
SELECT TO_CHAR(HIREDATE,'YY') H_YEAR,COUNT(*),MIN(SAL),
MAX(SAL),AVG(SAL),SUM(SAL) FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YY');

 

--6. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(case,sum)

--    TOTAL      1980      1981      1982      1983

----------- --------- --------- --------- ---------

--       12         1        10         1         0
 SELECT COUNT(*) "TOTAL",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1980 THEN 1 ELSE 0 END) "1980",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1981 THEN 1 ELSE 0 END) "1981",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1982 THEN 1 ELSE 0 END) "1982",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1983 THEN 1 ELSE 0 END) "1983"        
FROM EMP
WHERE EXTRACT(year FROM hiredate) BETWEEN 1980 AND 1983;

 

--7. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.

--JOB         Deptno 10    Deptno 20     Deptno 30     Total

-----------   ---------    ---------     ---------     ---------

--CLERK            1300         1900           950          4150

--SALESMAN                                    5600          5600

--PRESIDENT	 5000                                     5000

--MANAGER	         2450         2975          2850          8275

--ANALYST	                      6000                        6000
 
SELECT job, 
            NVL(TO_CHAR( SUM(case deptno WHEN 10 then sal end) ), ' ') "Deptno 10",
            NVL(TO_CHAR( SUM(case deptno WHEN 20 then sal end) ), ' ') "Deptno 20",
            NVL(TO_CHAR( SUM(case deptno WHEN 30 then sal end) ), ' ') "Deptno 30",                        
            SUM(sal) "Total"
FROM EMP
GROUP BY job;





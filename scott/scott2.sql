--1. 현재 날짜를 출력하고 열 레이블은 Current Date로 출력하는 SELECT 문장을 기술하시오.

SELECT (SYSDATE) Current_Date 
FROM DUAL;

--2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 
--사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장을 기술하시오.

SELECT EMPNO, ENAME, JOB, SAL, SAL*1.15 AS NEW_SAL, SAL*0.15 AS INCREASE
FROM EMP;


--3. EMP 테이블에서 이름,입사일,입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, TO_CHAR( HIREDATE,'YYYY-MM-DD') HIREDATE ,TO_CHAR(TRUNC(ADD_MONTHS(HIREDATE,6),'IW') +7,'YYYY-MM-DD') AS MONDAY
FROM EMP;
 

--4. EMP 테이블에서 이름,입사일, 입사일로부터 현재까지의 월수,급여, 입사일부터 현재까지의 급여의 총계를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, TO_CHAR( HIREDATE,'YYYY-MM-DD') HIREDATE ,
ROUND(TO_CHAR(MONTHS_BETWEEN(SYSDATE, TO_DATE(HIREDATE,'YYYY-MM-DD'))),1) AS "현재까지 월수", SAL,
ROUND(TO_CHAR(MONTHS_BETWEEN(SYSDATE, TO_DATE(HIREDATE,'YYYY-MM-DD')))) * SAL AS "현재까지 급여"
FROM EMP;
 

--5. EMP 테이블에서 다음의 결과가 출력되도록 작성하시오.
--Dream Salary
------------------------------------------------------------
--KING earns $5,000.00 monthly but wants $15,000.00
--BLAKE earns $2,850.00 monthly but wants $8,550.00
--CLARK earns $2,450.00 monthly but wants $7,350.00
--. . . . . . . . . .
--14 rows selected
SELECT ename, TO_CHAR(sal,'$99,999.00') "earns", TO_CHAR(sal*3, '$99,999.00') "wants"
FROM EMP;

SELECT ENAME ||''||'EARNS'||TO_CHAR(SAL,'$9,999.00')||'monthly but wants'|| TO_CHAR(SAL*3,'$99,999.00') AS "DREAM SALARY" 
FROM EMP;

--6. EMP 테이블에서 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈곳은 “*”로 대치)를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, RPAD(SAL,15, '*')
FROM EMP;

--7. EMP 테이블에서 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT * FROM EMP;

SELECT ENAME, JOB, TO_CHAR( HIREDATE,'YYYY-MM-DD') 입사일, TO_CHAR(HIREDATE, 'DAY') 입사요일
FROM EMP;

--8. EMP 테이블에서 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, LENGTH(ENAME), JOB
FROM EMP;
 
--9. EMP 테이블에서 모든 사원의 정보를 이름,업무,급여,보너스,급여+보너스를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, JOB,SAL, COMM, (SAL+COMM)
FROM EMP;

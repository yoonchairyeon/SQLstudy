--문제 4

--1. EMP 테이블에서 모든 사원에 대한 이름,부서번호,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT * FROM TAB;
SELECT ENAME, A.DEPTNO, B.DNAME
FROM EMP A,DEPT B
WHERE A.DEPTNO = B.DEPTNO;


--2. EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름,업무,급여,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT ENAME, JOB, SAL, DNAME
FROM EMP A, DEPT B 
WHERE A.DEPTNO = B.DEPTNO AND LOC = 'NEW YORK';
 

--3. EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력하는 SELECT 문장을 작성하여라.
SELECT ENAME, DNAME, LOC 
FROM EMP A, DEPT B 
WHERE A.DEPTNO = B.DEPTNO AND COMM IS NOT NULL;
 

--4. EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력하는 SELECT 문장을 작성하여라.
SELECT A.ENAME , A.JOB, B.DNAME, B.LOC 
FROM EMP A, DEPT B 
WHERE A.DEPTNO = B.DEPTNO AND A.ENAME LIKE '%L%';
 

--5. 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(관리자가 없는 King을 포함하여 모든 사원을 출력)

--Employee        Emp# Manager         Mgr#

------------ --------- ---------- ---------

--KING            7839

--BLAKE           7698 KING            7839

--CLARK           7782 KING            7839

--. . . . . . . . . .

--14 rows selected.
 
SELECT * FROM EMP;
SELECT * FROM DEPT;
 

--6. EMP 테이블에서 그들의 관리자 보다 먼저 입사한 사원에 대하여 이름,입사일,관리자 이름, 관리자 입사일을 출력하는 SELECT 문장을 작성하여라.

 

--7. EMP 테이블에서 사원의 급여와 사원의 급여 양만큼 “*”를 출력하는 SELECT 문장을 작성하여라. 단 “*”는 100을 의미한다.

--Employee and their salary

-------------------------------------------------------------------

--KING      **************************************************

--BLAKE     ****************************

--CLARK     ************************




-- DAY 7 2019.01.08

-- SET OPERATOR (���� ������)
-- UNION, UNION ALL, INTERSECT, MINUS
-- UNION, UNION ALL (������) : ���� ���� SELECT ���� ����� �ϳ��� ��ħ
-- INTERSECT (������) : ���� ���� SELECT ������� ����� �ุ ���
-- MINUS (������) : ù ��° SELECT ������� �� ��° SELECT ����� ��ġ��, �� ��ġ�ϴ� �κ��� �� ����� ������.

SELECT   EMP_ID, ROLE_NAME
FROM     EMPLOYEE_ROLE
UNION /*ALL*/
SELECT   EMP_ID, ROLE_NAME
FROM     ROLE_HISTORY;
-->> UNION : �ߺ����� �ϳ��� ���õ�. 25�� ���.
-->> UNION ALL : �ߺ��� �� ���õ�. 26�� ���.

SELECT   EMP_ID, ROLE_NAME
FROM     EMPLOYEE_ROLE
INTERSECT
SELECT   EMP_ID, ROLE_NAME
FROM     ROLE_HISTORY;
--> INTERSECT : ������. 1�� ���.

SELECT   EMP_ID, ROLE_NAME
FROM     EMPLOYEE_ROLE
MINUS
SELECT   EMP_ID, ROLE_NAME
FROM     ROLE_HISTORY;
--> MINUS : �������� ������ ��� ���. 21�� ���.

-- SET ������ ���� ���ǻ���
-- SELECT �� COLUMN�� ������ ���ƾ� �� : �ȸ��� �ÿ� ����(DUMMY) COLUMN�� �̿��ؼ� ������.
-- SELECT ���� �� �׸񺰷� �ڷ����� ���ƾ� �Ѵ�.
SELECT   EMP_NAME, JOB_ID, HIRE_DATE
FROM     EMPLOYEE
WHERE    DEPT_ID = '20'
UNION
SELECT   DEPT_NAME, DEPT_ID, NULL
FROM     DEPARTMENT
WHERE    DEPT_ID = '20';
-->> ������ ���� �ʾƼ� DUMMY�� ������� ������ ERROR.

-- 50�� �μ��� �Ҽӵ� ���� �� �����ڿ� �Ϲ� ������ ���� ��ȸ�ؼ� �ϳ��� ���Ķ�.
SELECT   *
FROM     EMPLOYEE
WHERE    DEPT_ID = '50'; -- �ϴ� ���� ��ȸ

SELECT   EMP_ID, EMP_NAME, '������' ����
FROM     EMPLOYEE
WHERE    DEPT_ID = '50' AND EMP_ID = '141'
UNION
SELECT   EMP_ID, EMP_NAME, '����' ����
FROM     EMPLOYEE
WHERE    DEPT_ID = '50' AND EMP_ID <> '141'
ORDER BY 3, 1;

SELECT   'SQL�� �����ϰ� �ֽ��ϴ�' ANSWKD, 3 ����
FROM     DUAL
UNION
SELECT   '�츮�� ����', 1
FROM     DUAL
SELECT   '���� ����ְ�', 2
FROM     DUAL
-- ORDER BY ����; >> ERROR. �ϳ��� ���� ��Ī�� ����� �� ����.
ORDER BY 2; -- �������� �������ָ� ERROR�� �� ��.

-- ���տ����ڿ� JOIN�� ����
SELECT   EMP_ID, ROLE_NAME ������
FROM     EMPLOYEE_ROLE
INTERSECT -- ������
SELECT   EMP_ID, ROLE_NAME ������
FROM     ROLE_HISTORY;

-- JOIN�������� USING (EMP_ID, ROLE_NAME) ����� �ǹ� :
-- �� COLUMN�� ���� �ϳ��� ������ �����ϰ� ��ġ�ϴ� �׸��� ã��. 
-- INTERSECT�� ����.
-- (104 SE) = (104 SE) : ���� �� �� JOIN�� ���Ե�
-- (104 SE-ANLY) != (104 SE) : �ٸ� �� �� JOIN���� ���ܵ�.

-- ���� QUERY�� JOIN�������� �ٲٸ� : ���� ����� ���´�.
SELECT   EMP_ID, ROLE_NAME
FROM     EMPLOYEE_ROLE
JOIN     ROLE_HISTORY USING ( EMP_ID, ROLE_NAME );

-- ���տ����ڿ� IN�������� ����
-- UNION�� IN�� ������ ����� �� �� ����.

-- ������ �븮 �Ǵ� ����� ������ �̸��� ���޸� ��ȸ
-- ���޼� �������������ϰ�, ������ ������ �̸��� �������� ���� ó����
SELECT   EMP_NAME, JOB_TITLE
FROM     EMPLOYEE
JOIN     JOB USING ( JOB_ID )
WHERE    JOB_TITLE IN ( '�븮', '���' )
ORDER BY 2, 1;

SELECT   EMP_NAME, JOB_TITLE
FROM     EMPLOYEE
JOIN     JOB USING ( JOB_ID )
WHERE    JOB_TITLE = '�븮'
UNION
SELECT   EMP_NAME, JOB_TITLE
FROM     EMPLOYEE
JOIN     JOB USING ( JOB_ID )
WHERE    JOB_TITLE = '���'
ORDER BY 2, 1;

-- ���� SUB QUERY ����������������������������������������������������������������������������������������������������������������������������������������������������������������
/*
 METHOD(���ϰ��� �ִ� METHOD())
 COLUMN �񱳿����� �񱳰� �� ���� ���� �˾Ƴ��� ���� SELECT���� ���� �ڸ��� �ۼ�
 
 COLUMN �񱳿����� (SELECT ������)
*/

-- SUB QUERY ��������
-- ������ �ȿ� ���� ������
-- EG. ���¿��̶�� ������ ���� �μ��� ������� ��ȸ
-- 1. ���¿������� �Ҽӵ� �μ� ��ȸ.
SELECT   DEPT_ID --> 50
FROM     EMPLOYEE
WHERE    EMP_NAME = '���¿�';

-- 2. 1������ ��ȸ�� ������� ����ؼ� �μ����� ��ȸ
SELECT   EMP_NAME �̸� --> 6��
FROM     EMPLOYEE
WHERE    DEPT_ID = '50';

-- IF, SUB QUERY ���
SELECT   EMP_NAME
FROM     EMPLOYEE
WHERE    DEPT_ID = ( SELECT DEPT_ID
                     FROM   EMPLOYEE
                     WHERE  EMP_NAME = '���¿�' );
                     -- �� �ϳ��� ���� ���� : ���� �� ��������

-- SUB QUERY�� ������ ������, ������, ���߿� ������, ��ȣ���� �׸��� ��Į�� �ִ�.
-- SUB QUERY�տ� �ٴ� �����ڰ� ���� �ٸ���.

/* 1. ������ SUB QUERY (Single Row SUB QUERY)
    �� QUERY�� ��� ���� 1��.
    �� �Ϲ� �񱳿����� ��� ����� �� �ִ�. - <, >, <=, >=, =, ( != <> ^= )
*/
-- EG. ���¿��� ������ ����, ���¿����� �޿��� ���� �޴� ���� ��ȸ
--     �̸�, ����, �޿� ��ȸ
-- 1. ���¿��� ���� ��ȸ
SELECT   JOB_ID -- J5
FROM     EMPLOYEE
WHERE    EMP_NAME = '���¿�';

-- 2. ���¿��� �޿� ��ȸ
SELECT   SALARY -- 2300000
FROM     EMPLOYEE
WHERE    EMP_NAME = '���¿�';

-- 3. ��� ��ȸ
SELECT   EMP_NAME, JOB_ID, SALARY
FROM     EMPLOYEE
WHERE    JOB_ID = 'J5' AND SALARY > 2300000;

-- TO SUB QUERY
SELECT   EMP_NAME, JOB_ID, SALARY
FROM     EMPLOYEE
WHERE    JOB_ID = ( SELECT  JOB_ID
                    FROM    EMPLOYEE
                    WHERE   EMP_NAME = '���¿�' )
    AND  SALARY > ( SELECT  SALARY
                    FROM    EMPLOYEE
                    WHERE   EMP_NAME = '���¿�');
                    
-- �����޿� �ް� �ִ� ������ ��ȸ
SELECT   EMP_NAME �̸�, 
         SALARY �޿�
FROM     EMPLOYEE
WHERE    SALARY = ( SELECT  MIN(SALARY)
                    FROM    EMPLOYEE );
                    
-- �μ��� �޿��հ� �� ���� ū �� ��ȸ
-- ���� ���� �޿��� �޾ư��� �μ� ��ȸ
SELECT    DEPT_NAME, SUM(SALARY)
FROM      EMPLOYEE
LEFT JOIN DEPARTMENT USING (DEPT_ID)
GROUP BY  DEPT_NAME
HAVING    SUM(SALARY) = ( SELECT   MAX(SUM(SALARY))
                          FROM     EMPLOYEE
                          GROUP BY DEPT_ID );
                          
-- SUB QUERY�� SELECT��, FROM��, WHERE��, GROUP BY��, HAVING��, ORDER BY������ ��� ����� �� ����.

/*
 2. ������ �������� (Multiple Row)
  �� SUB QUERY ������� �������� ���
  �� ����� �� �ִ� ������ 
     �� COLUMN 'IN' : ���� ���� �� �߿��� �� ���� ��ġ�ϴ� ���� �ִ°�?
     �� COLUMN 'NOT IN' : ���� ���� �� �߿��� �� �� ���� ��ġ���� �ʴ°�?
     �� COLUMN '> ANY' : ���� �� �񱳰����� �ϳ��� ū ���� �ִ°�? (���� ���� ������ ū��?)
     �� COLUMN '< ANY' : ���� �� �񱳰����� �ϳ��� ���� ���� �ִ°�? (���� ū ������ ������?)
     �� COLUMN '> ALL' : ��� ������ ū��? (���� ū ������ ū��?)
     �� COLUMN '< ALL' : ��� ������ ������? (���� ���� ������ ������?)
*/
-- EG. �μ��� �޿� ������ ��ȸ
SELECT   MIN(SALARY)
FROM     EMPLOYEE
GROUP BY DEPT_ID;

-- �μ����� �� �μ��� �����޿��� �ް� �ִ� ���� ��ȸ
/*SELECT   EMP_ID, SALARY
FROM     EMPLOYEE
WHERE    SALARY = ( SELECT   MIN(SALARY)
                    FROM     EMPLOYEE
                    GROUP BY DEPT_ID ); -- ������ ��������, ERROR */

-- ������ SUB QUERY���� �Ϲ� �񱳿����� ����� �� ����.
-- �Ϲ� �񱳿����ڴ� �� ���� ������ ���Ǵ��ϱ� ������ ���� �������� �������� �� ��.
-- '=' -> 'IN'
SELECT   EMP_ID, DEPT_ID, SALARY
FROM     EMPLOYEE
WHERE    SALARY IN ( SELECT   MIN(SALARY)
                     FROM     EMPLOYEE
                     GROUP BY DEPT_ID );
                     
-- IN / NOT IN : NOT IN �����ڴ� NULL�� �����ϸ� �ȵȴ�.
SELECT   DISTINCT MGR_ID -- 15�� (�ߺ�ī��Ʈ), 6��(�ߺ�X)
FROM     EMPLOYEE
WHERE    MGR_ID IS NOT NULL;

-- ���� �������� �����ڸ� �����ϱ�
SELECT   EMP_ID, EMP_NAME, '������' ����
FROM     EMPLOYEE
WHERE    EMP_ID IN ( SELECT   MGR_ID
                     FROM     EMPLOYEE )
UNION                   
SELECT   EMP_ID, EMP_NAME, '����' ����
FROM     EMPLOYEE
WHERE    EMP_ID NOT IN ( SELECT  MGR_ID
                         FROM    EMPLOYEE
                         WHERE   MGR_ID IS NOT NULL )
ORDER BY 3, 1;

-- SELECT�������� SUB QUERY����� �� ����
SELECT   EMP_ID, EMP_NAME,
         CASE WHEN EMP_ID IN ( SELECT MGR_ID  FROM EMPLOYEE ) THEN '������'
                ELSE '����'
         END ����
FROM     EMPLOYEE
ORDER BY 3, 1;
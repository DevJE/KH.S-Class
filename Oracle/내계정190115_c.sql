 -- DAY11 2019.01.15 -��
/*
 ���� DML (Data Manipulation Language : ������ ���۾�) ������������������������������������������������������������������
 INSERT, UPDATE, DELETE�� �� ����.
 TABLE�� �����͸� �߰��ϰų�, ��ϵǾ��ִ� �����͸� �����ϰų�, ��ϵǾ� �ִ� ��(ROW)�� �����ϴ� ����.
 INSERT�� : ��(ROW)�� �߰���. (�� ���� ����)
 UPDATE�� : �����͸� ������. (�� ���� ��ȭ X)
 DELETE�� : �ش� �����͸� ������ ���� ������. (�� ���� ����)
 TRUNCATE�� : ���̺��� ��� ��(ROW)�� �����ϴ� ����.
*/

-- UPDATE��
-- UPDATE TABLE�̸�
-- SET �÷��̸� = ������ ��, �÷��̸� = ������ ��..
-- WHERE COLUMN�̸� �񱳿����� �񱳰�;
SELECT  * FROM DCOPY;
DROP TABLE DCOPY;

CREATE TABLE DCOPY
AS  SELECT  * FROM DEPARTMENT;
SELECT * FROM DCOPY;

UPDATE DCOPY
SET DEPT_NAME = '�λ���';

ROLLBACK;

UPDATE DCOPY
SET DEPT_NAME = '�λ���'
WHERE DEPT_ID = '10';

-- UPDATE���� SUB QUERY ����� �� ����
-- SET���� WHERE������ ����Ѵ�.
-- SET COLUMN�̸� = (SUB QUERY)
-- WHERE COLUMN�̸� �񱳿����� (SUB_QUERY)

-- ���ϱ��� �����ڵ�� �޿��� ���ر� ������ ���� ���� ������ �����Ͻÿ�.
UPDATE  EMPLOYEE
SET JOB_ID = (SELECT    JOB_ID FROM EMPLOYEE
              WHERE EMP_NAME  = '���ر�'),
    SALARY = (SELECT    SALARY FROM EMPLOYEE
              WHERE EMP_NAME = '���ر�')
WHERE   EMP_NAME = '���ϱ�';
--���߿����������� �����غ���
UPDATE  EMPLOYEE
SET (JOB_ID, SALARY) = (SELECT  JOB_ID, SALARY
                        FROM    EMPLOYEE
                        WHERE   EMP_NAME = '���ر�')
WHERE   EMP_NAME ='���ϱ�';

-- CONFIRM
SELECT  EMP_NAME, JOB_ID, SALARY
FROM    EMPLOYEE
WHERE   EMP_NAME IN ('���ϱ�','���ر�');

ROLLBACK;

-- DEFAULT�� ������ COLUMN���� ������ �� Ư�� �� ��� DEFAULT Ű���� ����ص� ��
SELECT  EMP_ID, EMP_NAME, MARRIAGE
FROM    EMPLOYEE
WHERE   EMP_ID = '210';

UPDATE  EMPLOYEE
SET     MARRIAGE = DEFAULT
WHERE   EMP_ID = '210';

ROLLBACK;

-- WHERE�������� SUB QUERY����� �� ����
-- �ؿܿ���2�� �������� ���ʽ�����Ʈ�� 0.3���� �����Ͻÿ�
UPDATE  EMPLOYEE
SET BONUS_PCT = 0.3
WHERE DEPT_ID = (SELECT  DEPT_ID
                 FROM    DEPARTMENT
                 WHERE   DEPT_NAME = '�ؿܿ���2��');
-- Ȯ��
SELECT  EMP_NAME, DEPT_ID, BONUS_PCT
FROM    EMPLOYEE
WHERE   DEPT_ID = (SELECT   DEPT_ID
                   FROM     DEPARTMENT
                   WHERE    DEPT_NAME = '�ؿܿ���2��');           
ROLLBACK;

-- INSERT INTO��
-- ���̺� �� ���� �߰��ϴ� ����
-- ���ο� ������ ��� ����� ���
/*
 INSERT INTO ���̺��̸� [(�÷��̸�, �÷��̸�, �÷��̸�,...)]
 VALUES (����� ��, ����� ��, ...);
*/
CREATE TABLE DEPT3
(
 DEPTID     CHAR(2),
 DEPTNAME   VARCHAR(20)
);
SELECT  COUNT(*) FROM DEPT3;
-- << 0��
INSERT INTO DEPT3
VALUES ('10','ȸ����'); -- 1��

INSERT INTO DEPT3
VALUES ('20','�λ���'); -- 2��

COMMIT; -- ����Ϸ� ���Ѷ�

INSERT INTO EMPLOYEE (EMP_ID, EMP_NO, EMP_NAME, EMAIL, PHONE, HIRE_DATE, JOB_ID,
                      SALARY, BONUS_PCT, MARRIAGE, MGR_ID, DEPT_ID)
VALUES ('900','811122-1458712','������','oyunha@kh.org','01011100001',DEFAULT,
        'J7',3000000,NULL,DEFAULT,'176','90');
SELECT  * FROM EMPLOYEE;
ROLLBACK;

-- COLUMN�̸� �����Ǹ�, ���̺��� ��ü �࿡ ���� ����ؾ��Ѵ�.
-- COLUMN ���� = �Է� �� ����, COLUMN ���� ���� = �� �Է� ����
INSERT INTO EMPLOYEE
VALUES ('777','�̺���','399000-1932930','bh@naver.com','01030290011',SYSDATE,'J4',4200000,NULL,DEFAULT,NULL,NULL);

-- SUB QUERY�� �̿��ؼ� INSERT�ϱ�.
CREATE TABLE EMP
(
 EMP_ID     CHAR(3),
 EMP_NAME   VARCHAR2(20),
 DEPT_NAME  VARCHAR2(20)
);

INSERT INTO EMP
(
 SELECT     EMP_ID, EMP_NAME, DEPT_NAME
 FROM       EMPLOYEE
 LEFT JOIN  DEPARTMENT USING (DEPT_ID)
);

SELECT  * FROM EMP;

ROLLBACK;
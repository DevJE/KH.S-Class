-- DAY11 2019.01.16 -��
/*
-- ���� DELETE�� ����������������������������������������������������������������������������������������������������
 : ���� �����ϴ� ����
 
 DELTE [FROM] ���̺��̸�
 WHERE ���ǽ�;
*/
-- WHERE���� ������� ������ ���̺��� ��� ���� �����ȴ�.
SELECT  * FROM DCOPY;

DELETE FROM DCOPY;
-- ���̺��� �״��, �ุ ���� ����.
ROLLBACK;
-- >> DELETE���� ����. COMMIT���ذŸ� �ȵ�.
-- �ٸ����̺��� FOREIGN KEY�� �����ǰ� �ִ� ���̺��� ��� ��(ROW)������ �� ����.
DELETE FROM DEPARTMENT
WHERE DEPT_ID = '90'; -- ERROR ��integrity constraint violated - child record found��
-- ���(����)�ǰ� �ִ� ���� ��ϵ� ���� ������ �� ������ �� �� �ִ�.

-- �������̺��̾ ���� ������ �ʾҴٸ� ������ �� �ִ�.
DELETE FROM DEPARTMENT
WHERE DEPT_ID = '30'; -- > PASS

SELECT  * FROM DEPARTMENT;
/*
-- ���� TRUNCATE�� ����������������������������������������������������������������������������������������������������
 : TABLE�� ��� �� ������ �����. DELETE���� ���� �����Ѵ�.
 : But, ������ �� ���� ���������� �ִٸ� ������ �� ����. (ROLLBACK�Ұ���)
*/
TRUNCATE TABLE DCOPY;
-- "Table DCOPY��(��) �߷Ƚ��ϴ�."
SELECT  * FROM DCOPY;
ROLLBACK; -->> CAN'T

TRUNCATE TABLE DEPARTMENT; -- ERROR ��unique/primary keys in table referenced by enabled foreign keys��

-- �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
-- ���� TRANSACTION ����������������������������������������������������������������������������������������������������
/*
 TCL (Transaction Controll Language) : Ʈ������ ���� ���
 COMMIT, ROLLBACK, SAVEPOINT
*/
ALTER TABLE EMPLOYEE
DISABLE CONSTRAINTS FK_MGRID;
-- �� DDL ���� ���� : �� Ʈ����� ����
SAVEPOINT S0;
INSERT INTO DEPARTMENT
VALUES ('40','��ȹ������','A1');
SAVEPOINT S1;
UPDATE EMPLOYEE
SET DEPT_ID = '40'
WHERE DEPT_ID IS NULL;
SAVEPOINT S2;
DELETE FROM EMPLOYEE;

ROLLBACK TO S2;

SELECT  * FROM EMPLOYEE;
--SELECT  CONSTRAINT_NAME, TABLE_NAME
--FROM    USER_CONSTRAINTS
--WHERE   CONSTRAINT_NAME = 'SYS_C007194';
--
--DROP TABLE TESTFK CASCADE CONSTRAINTS;

SELECT  COUNT(*)
FROM    EMPLOYEE
WHERE   DEPT_ID = '40';

ROLLBACK TO S0; -- COUNT(*)�ϸ� 0��.

-- ���ü� ���� : ��� (LOCK)
SELECT  EMP_ID, MARRIAGE
FROM    EMPLOYEE
WHERE   EMP_ID = '143';

UPDATE  EMPLOYEE
SET     MARRIAGE = 'Y'
WHERE   EMP_ID = '143';

COMMIT;
-- �ٸ� DEVELOPER�� ������ COMMIT�������� ������ �������� ��µȴ�.
-- COMMIT�� ���־�� ����ȭ�ż� ���� ��� ����.
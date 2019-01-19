-- DAY11 2019.01.16 -��
/*
-- ���� VIEW ����������������������������������������������������������������������������������������������������
 SELECT QUERY�� �������� �����ִ� ȭ��.
 ���ȭ���� �������̺�� �����Ͽ� ����� �� ����.
 ��ġ ���� ��� ������ �����ϵ� ���ȭ�鵵 �̿Ͱ��� ������� �����ϴ� ������ ��ü.
 
 < ��� ���� > 
 �� ���ȿ� ���� : ������ ��� ȭ�鸸 ���������ν� ��ü QUERY�� ������ ����.
 �� �����ϰ� �� QUERY���� �Ź� �����Ű�� �ʾƵ� ��.

 < ��� ���� >
 CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW VIEW�̸�
 AS (SUB QURRY)
 WITH CHECK OPTION CONSTRAINT �̸�
 WITH READ ONLY CONSTRAINT;
 
 �����ڰ������� ������ �ο��޾ƾ� view�� ���� �� �ִ�
 �� grant create view to student;
*/

-- VIEW �����
-- 90�� �μ��� �Ҽӵ� ���� ������ ��ȸ�ؼ� �信 �����ϱ�.
-- �̸�, �μ���, ���޸�, �޿�
-- VIEW 'V_EMP_DEPT90'
CREATE VIEW   V_EMP_DEPT90
AS  SELECT    EMP_NAME, DEPT_NAME, JOB_TITLE, SALARY
    FROM      EMPLOYEE
    LEFT JOIN JOB USING (JOB_ID)
    LEFT JOIN DEPARTMENT USING (DEPT_ID)
    WHERE   DEPT_ID = '90';
    
-- ���� VIEW Ȯ��
SELECT  * FROM V_EMP_DEPT90;
-- ��ųʸ� Ȯ�� : USER_VIEWS, USER_OBJECTS, USER_CATALOG
DESC USER_VIEWS

SELECT  VIEW_NAME, TEXT_LENGTH, TEXT, READ_ONLY
FROM    USER_VIEWS;

-- VIEW�� ������ �� ����. ����� ������� �ؾ���.
-- ALTER VIEW (x)
-- OR REPLACE�� �����.
-- CREATE OR REPLACE VIEW : VIEW�� ������ ���� ����, ������ �����.
CREATE OR REPLACE VIEW V_EMP_DEPT90
AS  SELECT      EMP_NAME, JOB_TITLE, SALARY
    FROM        EMPLOYEE
    LEFT JOIN   JOB USING (JOB_ID)
    LEFT JOIN   DEPARTMENT USING (DEPT_ID);
    
-- �ǽ�
-- ������ '���'�� �������� �̸�, �μ���, ���޸� ��ȸ�ϰ� VIEW�� ����
-- V_EMP_DEPT_JOB
CREATE OR REPLACE VIEW V_EMP_DEPT_JOB
AS  SELECT      EMP_NAME, DEPT_NAME, JOB_TITLE
    FROM        EMPLOYEE
    LEFT JOIN   JOB USING (JOB_ID)
    LEFT JOIN   DEPARTMENT USING (DEPT_ID)
    WHERE       JOB_TITLE = '���';
    
SELECT  * FROM V_EMP_DEPT_JOB;

-- VIEW�� �����͸� ������ ���� ���� : ���� ���̺� (Virtual Table)
-- VIEW�� TABLEó�� ��ü�� ��ȸ������
SELECT  COLUMN_NAME, DATA_TYPE, NULLABLE
FROM    USER_TAB_COLS
WHERE   TABLE_NAME = 'V_EMP_DEPT_JOB';

-- VIEW���� ALIAS ����ϱ�.
-- 1. VIEW �̸� ���� (ALIAS, ...), �� ���� ��Ī�ٿ��־����.
-- 2. SUB QUERY�� SELECT������ ALIAS���, ���������� ��Ī����� �� ����.
CREATE OR REPLACE VIEW V_EMP_DETP_JOB (ENM, DNM, TITLE)
AS  SELECT      EMP_NAME, DEPT_NAME, JOB_TITLE
    FROM        EMPLOYEE
    LEFT JOIN   JOB USING (JOB_ID)
    LEFT JOIN   DEPARTMENT USING (DEPT_ID)
    WHERE       JOB_TITLE = '���';
    
SELECT   * FROM V_EMP_DETP_JOB;

-------------------------------------------------------
CREATE OR REPLACE VIEW V_EMP_DETP_JOB
AS  SELECT      EMP_NAME ENAME, DEPT_NAME DNAME, JOB_TITLE JTITLE
    FROM        EMPLOYEE
    LEFT JOIN   JOB USING (JOB_ID)
    LEFT JOIN   DEPARTMENT USING (DEPT_ID)
    WHERE       JOB_TITLE = '���';
    
SELECT   * FROM V_EMP_DETP_JOB;

-- �ݵ�� ��Ī�� ����ؾ��ϴ� ���
-- SUB QUERY�� SELECT���� �Լ��� �Ǵ� ������ ���� ��.

-- �������� �̸�, ����, ���� ��ȸ
-- VIEW�� ���� - V_EMP
CREATE OR REPLACE VIEW V_EMP
AS  SELECT  EMP_NAME,
            DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 3, '��', '��') ����,
            --ROUND(MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(EMP_NO, 1, 4), 'RRMM')) / 12, 0)
            TO_CHAR(SYSDATE, 'YY')+100 - TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR'), 'YY') ����
    FROM    EMPLOYEE;  
    
SELECT  * FROM V_EMP;

-- �� ���� ��������
-- ���� ���� ������ �ƴ�����, �並 ���� DML �۾� ������
-- DML �� �۾� ����� ���̽� ���̺��� �����Ϳ� �����
-- COMMIT / ROLLBACK ���� �ʿ���

-- �並 ���� DML �۾��� �������� ������ ����
-- �� �����ÿ� DML �۾��� ���� ������ ������ �� ����
-- WITH READ ONLY : �б� ���� ��, �並 ���� DML �۾� �Ұ�
-- WITH CHECK OPTION : �並 ���� DML �۾� ������, 
--              �並 ���� ���� ������ �����Ϳ��� DML ������ �� ����

-- WITH READ ONLY
CREATE OR REPLACE VIEW V_EMP
AS
SELECT * FROM EMPLOYEE
WITH READ ONLY;

-- Ȯ��
UPDATE V_EMP
SET PHONE = NULL;  -- ERROR

INSERT INTO V_EMP (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('789', '������', '811122-1234567');  -- ����

DELETE FROM V_EMP;  -- ERROR

SELECT * FROM V_EMP;

-- WITH CHECK OPTION
-- ���ǿ� ���� INSERT / UPDATE �۾� ����
-- DELETE�� ���� ����
CREATE OR REPLACE VIEW V_EMP
AS  SELECT  EMP_ID, EMP_NAME, EMP_NO, MARRIAGE
    FROM    EMPLOYEE
    WHERE   MARRIAGE = 'N'
    WITH CHECK OPTION;
    
-- �׽�Ʈ
INSERT INTO V_EMP (EMP_ID, EMP_NAME, EMP_NO, MARRIAGE)
-- VALUES ('789','������','911122-1234544', 'Y'); >> ERROR
VALUES ('789','������','911122-1234544', 'Y');

SELECT  * FROM EMPLOYEE;

SELECT  * FROM V_EMP;

UPDATE V_EMP
SET MARRIAGE = 'Y'; -- ERROR

-- �並 ������ �� ����� WHERE ���ǿ� �ۿ�Ǵ� ���������� ������ ����.
UPDATE V_EMP
SET EMP_ID = '000'
WHERE EMP_ID = '789';

SELECT  * FROM EMPLOYEE;
ROLLBACK;
-- VIEW ���
-- ���̺��� ����ؼ� ����� �� ����
-- FROM ���̸� : �ζ��� ��
CREATE OR REPLACE VIEW V_EMP_INFO
AS  SELECT      EMP_NAME, DEPT_NAME, JOB_TITLE
    FROM        EMPLOYEE
    LEFT JOIN   JOB USING (JOB_ID)
    LEFT JOIN   DEPARTMENT USING (DEPT_ID);
    
SELECT  * FROM V_EMP_INFO;
SELECT  EMP_NAME
FROM    V_EMP_INFO
WHERE   DEPT_NAME = '�ؿܿ���1��'
        AND JOB_TITLE = '���';
        
-- �� ����
-- DROP VIEW ���̸�;
DROP VIEW V_EMP;

-- �� �ɼ� : FORCE / NOFORCE
-- FORCE : SUB QUERY���� ���� ���̺��� �������� �ʾƵ� �� ������
-- QUERY���� �����ϰڴٴ� �ǹ�
CREATE OR REPLACE FORCE VIEW V_EMP
AS  SELECT  TCODE, TNAME, TCONTENT
    FROM    TTT;
    -- ������ �Բ� ������ 
-- FORCE �Ⱦ��� ����, NOFORCE����(��Ģ�� ����ü. ���̺��� �־���ϴ� ���̱� ������ ������ ����)
CREATE OR REPLACE VIEW V_EMP
AS  SELECT  TCODE, TNAME, TCONTENT
    FROM    TTT;
    
    
-- INLINE VIEW
-- �Ϲ������� FROM������ ���� SUB QUERY�� ��Ī�� ���� ��
SELECT  EMP_NAME, SALARY
FROM    ( SELECT    NVL(DEPT_ID, '00') DID,
                    ROUND(AVG(SALARY), -3) DAVG
          FROM      EMPLOYEE
          GROUP BY  DEPT_ID ) ILNV
JOIN    EMPLOYEE ON (NVL(DEPT_ID, '00') = ILNV.DID)
WHERE   SALARY > ILNV.DAVG
ORDER BY 2 DESC;

-- �Ǵ� �� �����ϰ� ���
CREATE OR REPLACE VIEW V_DEPT_SALAVG
AS  SELECT    NVL(DEPT_ID, '00') DID,
              ROUND(AVG(SALARY), -3) DAVG
    FROM      EMPLOYEE
    GROUP BY  DEPT_ID; 
    
-- �� ���
SELECT  EMP_NAME, SALARY
FROM    EMPLOYEE
JOIN    V_DEPT_SALAVG ON (NVL(DEPT_ID, '00') = DID)
WHERE   SALARY > DAVG
ORDER BY 2 DESC;
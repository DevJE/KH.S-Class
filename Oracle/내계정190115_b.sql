-- DAY11 2019.01.15 -��

-- ������ ��ųʸ�
-- ����ڰ� ������ ���̺� ��ü ���� : USER_TABLES
SELECT  * FROM USER_TABLES;

-- ����ڰ� ���� �������� ���� : USER_CONSTRAINTS
SELECT  * FROM USER_CONSTRAINTS;

-- ����ڰ� ���� ������ ���� : USER_SEQUENCES
SELECT  * FROM USER_SEQUENCES;

-- ����ڰ� ���� �ε��� ���� : USER_INDEXES
SELECT  * FROM USER_INDEXES;

-- ����ڰ� ���� �� ���� : USER_VIEWS
SELECT  * FROM USER_VIEWS;

-- ����ڰ� ���� ���̺�, ��, ������ ���� : USER_CATALOG
SELECT  * FROM USER_CATALOG;

-- ���� ����ڰ� ������ �� �ִ� ��� ���̺� ���� : ALL_TABLES;
SELECT  * FROM ALL_TABLES;

-- DBA(�����ͺ��̽�������)�� ������ �� �ִ� ���̺� ��ȸ : DBA_TABLES
SELECT  * FROM DBA_TABLES; -- SYSTEM�������� ���� ������.

-- ����ڰ� ���� ��� ��ü ���� : USER_OBJECTS
SELECT  * FROM USER_OBJECTS;
-- ������������������������������������������������������������������������������������������������������������������������������������������������������������
-- DDL
-- CREATE, ALTER, DROP
-- TABLE : CREATE TABLE, ALTER TABLE, DROP TABLE
-- VIEW : CREATE VIEW, DROP VIEW
-- SEQUENCE : CREATE SEQUENCE, ALTER SEQUENCE, DROP SEQUENCE

-- ���̺� ����
-- COLUMN �߰�/����, �������� �߰�/����
-- COLUMN �ڷ��� ����, DEFAULT�� ����
-- ���̺��, �÷���, ���������̸� ����

-- �÷� �߰�
-- ���̺� �ۼ��� COLUMN������ �����ϰ� �ۼ��ϸ� �ȴ�.
ALTER TABLE DCOPY
ADD (LNAME      VARCHAR2(40));

DESC DCOPY;

ALTER TABLE DCOPY
ADD (CNAME      VARCHAR2(30) DEFAULT '�ѱ�');

SELECT  * FROM DCOPY;

-- �������� �߰�
CREATE TABLE EMP2
AS  SELECT  *
    FROM    EMPLOYEE;
    
ALTER TABLE EMP2
ADD PRIMARY KEY (EMP_ID);

ALTER TABLE EMP2
ADD CONSTRAINT E2_UNENO UNIQUE (EMP_NO);

-- ��, NOT NULL�� ADD�� �� ����. 
-- COLUMN�� NULL���� -> NULL �Ұ���.. �� ���氳��. ���� MODIFY�� ����ؾ��Ѵ�.
/*ALTER TABLE EMP2
ADD NOT NULL (HIRE_DATE);*/ -- ERROR
ALTER TABLE EMP2
MODIFY  (HIRE_DATE NOT NULL);

-- COLUMN �ڷ��� ����
CREATE TABLE EMP4
AS  SELECT  EMP_ID, EMP_NAME, HIRE_DATE
    FROM    EMPLOYEE;

SELECT  * FROM EMP4;
DESC EMP4;

ALTER TABLE EMP4
MODIFY  (EMP_ID VARCHAR2(5),
         EMP_NAME CHAR(20));
         
-- ���� ��ϵ� COLUMN�� �ٸ� �ڷ������� �ٲ� �� ����
/*ALTER TABLE EMP4
MODIFY (HIRE_DATE CHAR(8));*/ -- ERROR

-- ���ڿ� �ڷ����� ũ�⸦ ���̴� ������ �� �� ����.
/*ALTER TABLE EMP4
MODIFY (EMP_NAME CHAR(15));*/ -- ERROR

-- DEFAULT �� ����
CREATE TABLE EMP5
(
 EMP_ID     CHAR(3),
 EMP_NAME   VARCHAR2(20),
 ADDR1      VARCHAR2(20) DEFAULT '����',
 ADDR2      VARCHAR2(100)
);
INSERT INTO EMP5 VALUES ('R11','������',DEFAULT,'û�㵿');
INSERT INTO EMP5 VALUES ('P10','�̺���',DEFAULT,'���絿');
SELECT  * FROM EMP5;
DESC EMP5;

ALTER TABLE EMP5
MODIFY  (ADDR1  DEFAULT '���');
--DEFAULT ���������� ���� �����
INSERT INTO EMP5 VALUES ('E31','�ӽ¿�',DEFAULT,'�д� ȿ�ڵ�');

-- COLUMN ����
ALTER TABLE DCOPY
DROP COLUMN CNAME;

DESC DCOPY;
SELECT  * FROM DCOPY;

ALTER TABLE DCOPY
DROP (LNAME);

-- COLUMN ���� �� ����
ALTER TABLE DCOPY
DROP (DNAME, LID);

-- DROP (DI); -- ������ ���� COLUMN�̶� ���� �Ұ�. ERROR
-- ���̺��� �ּ� �� ���� COLUMN�� ������ �־�� �Ѵ�.
/*ALTER TABLE DCOPY
DROP COLUMN DID;*/ -- ERROR
-- ���ݱ��� DCOPY���� DROP���� ������ COULUMN���� ������ �� ����.

-- ���������� �ִ� COLUMN�� ������ �� ���� ���� ��Ģ.
/*ALTER TABLE DEPARTMENT
DROP (DEPT_ID);*/ -- PRIMARY, REFERENCES �������̹Ƿ� �����Ұ�. ERROR
CREATE TABLE TB1
(
 PK     NUMBER PRIMARY KEY,
 FK     NUMBER REFERENCES TB1,
 COL1   NUMBER,
 CHECK  (PK > 0 AND COL1 > 0)
);
/*ALTER TABLE TB1
DROP (PK);*/ -- ERRO. PRIMARY KEY �Ǿ�����.
-- ���� �������� COLUMN�� �����ϰ� �ʹٸ� �������ǵ� ���� �����ϸ� �ȴ�.
-- CASCADE
ALTER TABLE TB1
DROP (PK)   CASCADE CONSTRAINTS;
-- �̰� ���� ��.
DESC CONSTRAINT_EMP;

ALTER TABLE TB1
DROP (COL1) CASCADE CONSTRAINTS;

-- �������� ����
-- 1�� ����
ALTER TABLE CONSTRAINT_EMP
DROP CONSTRAINT CHK;

-- ���� �� ������ ��
ALTER TABLE CONSTRAINT_EMP
DROP CONSTRAINT FKJID
DROP CONSTRAINT FKMID
DROP CONSTRAINT FKDID;

-- ������ ��ųʸ��� ���� ���� Ȯ��
SELECT  TABLE_NAME, CONSTRAINT_NAME
FROM    USER_CONSTRAINTS
WHERE   TABLE_NAME = 'CONSTRAINT_EMP';

-- NOT NULL���������� ������ �ƴ϶� NULL�� ������
-- DROP�� �ƴ϶� MODIFY�����
ALTER TABLE CONSTRAINT_EMP
MODIFY (ENAME NULL, ENO NULL);

-- ���̺��� �÷��� �����ϴ� ������ ��ųʸ� : USER_TAB_COLS
SELECT  * FROM USER_TAB_COLS;
DESC USER_TAB_COLS;

SELECT  TABLE_NAME, COLUMN_NAME, NULLABLE
FROM    USER_TAB_COLS
WHERE   TABLE_NAME = 'CONSTRAINT_EMP';

-- ���̺��� �÷��� ���������� �����ϴ� ��ųʸ� : USER_CONS_COLUMNS
CREATE TABLE TB_EXAM
(
 COL1       CHAR(3) PRIMARY KEY,
 ENAME      VARCHAR(2),
 FOREIGN KEY (COL1) REFERENCES EMPLOYEE
);
SELECT  CONSTRAINT_NAME AS �����̸�,
        CONSTRAINT_TYPE AS ����,
        COLUMN_NAME AS �÷�,
        R_CONSTRAINT_NAME AS ����,
        DELETE_RULE AS ������Ģ
FROM    USER_CONSTRAINTS
JOIN    USER_CONS_COLUMNS USING (CONSTRAINT_NAME, TABLE_NAME)
WHERE   TABLE_NAME = 'TB_EXAM';

-- �̸��ٲٱ�
-- COLUMN, CONSTRAINTS, TABLE �̸� ���氡��

-- ��. COLUMN�̸� �ٲٱ�
ALTER TABLE TB_EXAM
RENAME COLUMN COL1 TO EMPID;

DESC TB_EXAM;

-- ��. CONSTRAINTS�̸� �ٲٱ�
ALTER TABLE TB_EXAM
RENAME CONSTRAINTS SYS_C007268 TO PK_EID;

ALTER TABLE TB_EXAM
RENAME CONSTRAINTS SYS_C007269 TO FK_EID;

-- ��. TABLE�̸� �ٲٱ�
ALTER TABLE TB_EXAM RENAME TO TB_SAMPLE1;
--OR
RENAME TB_SAMPLE1 TO TB_SAMPLE;

-- DELETE TABLE : ���̺� ����
-- DROP TABLE ���̺��̸�;
-- FOREIGN KEY ������������ �����ǰ� �ִ� ���̺��� ������ �� ����.
CREATE TABLE DEPT2
(
 DID        CHAR(2) PRIMARY KEY,
 DNAME      VARCHAR(10)
);

CREATE TABLE EMP6
(
 EID        CHAR(3) PRIMARY KEY,
 ENAME      VARCHAR(10),
 DID        CHAR(2) REFERENCES DEPT2
);

-- DROP TABLE DEPT2; -- ERROR. EMP6�� DEPT�� �������̱⿡ ������ �� ����.
-- ���� DEPT2�� �����ϰ� �ʹٸ� DEPT2�� REFERENCES ���������� �Բ� �����ؾ��Ѵ�.
DROP TABLE DEPT2 CASCADE CONSTRAINTS;
-- ������ ��ųʸ��� ���� ���� �۾� Ȯ��
SELECT  TABLE_NAME
FROM    USER_TABLES
WHERE   TABLE_NAME LIKE 'D%';
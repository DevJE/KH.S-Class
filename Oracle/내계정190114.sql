-- DAY10 2019.01.14

-- DDL
-- ���̺� ���Ἲ ��������(CONSTRAINT)

-- ���� 1. NOT NULL CONSTRAINT ������������������������������������������������������������������������������������������������������������
-- COLUMN�� ���� �ݵ�� ��ϵǾ�� �� �� ������. (���� �ʼ��Է��׸�)
-- COLUMN���������� ������ �� �ִ�.
CREATE TABLE TESTNN
(
 NNID     NUMBER(5) NOT NULL,
 NN_NAME  VARCHAR2(20)
);

-- �� ��� �׽�Ʈ
INSERT INTO TESTNN (NNID, NN_NAME)
VALUES (NULL, NULL); -- ERROR. NNID�� NULL�� ����Ϸ��� �߱� ����. (NOT NULL ��������)

INSERT INTO TESTNN -- COLUMN�̸� ���� : ���̺��� ��� COLUMN�� �� ���.
VALUES (1, NULL); -- ���̺��� COLUMN���� ������ �ڷ����� ���߾ ���.

SELECT  * FROM TESTNN;

INSERT INTO TESTNN (NN_NAME)
VALUES ('ORACLE'); -- ERROR. ������ NNID�� �ڵ����� NULL�� �Էµ�. (NOT NULL ��������)

-- ���̺� ���� ���� �Ұ� : NOT NULL
CREATE TABLE TESTNN2
(
 NN_ID    NUMBER(5) CONSTRAINT T2_NNID NOT NULL,
 NN_NAME  VARCHAR2(10)
 -- ���̺�������
 -- [CONSTRAINT ���������̸�] ������������ (������ COLUMN�̸�)
 -- CONSTRAINT T2_NNNAME NOT NULL (NN_NAME) -> ERROR
);

-- ���� 2. UNIQUE CONSTRAINT ����������������������������������������������������������������������������������������������������������������
-- �ش� COLUMN�� �ߺ���(���ϰ�) �Է��� ���� ���� ��������.
-- �����ϸ� ������ ���� �Է��� �� ����. (���� �� �� �� ��� �Ұ�)
-- COLUMN����, TABLE���� ��� ������ �� �ִ�.
-- ����Ű�ε� ������ �� �ִ�.
CREATE TABLE TESTUN
(
 UN_ID    CHAR(3)   UNIQUE,
 UN_NAME  VARCHAR2(10)   NOT NULL
);

-- ����׽�Ʈ
INSERT INTO TESTUN VALUES ('AAA', 'ORACLE');
INSERT INTO TESTUN VALUES ('AAA', 'JAVA'); -- ERROR ��unique constraint violates��
INSERT INTO TESTUN VALUES ('AAB', 'JAVA');

SELECT  * FROM TESTUN;

CREATE TABLE TESTUN2
( -- COLUMN ���������� �������� ����
 UN_ID    CHAR(3)  CONSTRAINT T2_UNID UNIQUE,
 IN_NAME  VARCHAR2(10) CONSTRAINT T2_UNNAME NOT NULL
);

CREATE TABLE TESTUN3
( -- TABLE �������� �������� �����ϱ�
 UN_ID    CHAR(3),
 UN_NAME  VARCHAR2(10) NOT NULL,
 CONSTRAINT T3_UNID UNIQUE (UN_ID)
);

-- ���� 3. PRIMARY KEY CONSTRAINT ����������������������������������������������������������������������������������������������������������
-- TABLE���� �� ��(ROW)�� ������ ã�� ���� ���� ��ϵ� COLUMN�� ������.
-- NOT NULL + UNIQUE
-- �� TABLE�� �� ���� ����� �� �ִ�.
CREATE TABLE TESTPK
(
 PK_ID    NUMBER /*�������ϸ� �⺻ 7�ڸ��� �Ҵ�*/ PRIMARY KEY,
 PK_NAME  VARCHAR2(15) NOT NULL,
 PK_DATE  DATE
);
--����׽�Ʈ
INSERT INTO TESTPK VALUES (1, 'GILDONG','15/03/12');
INSERT INTO TESTPK VALUES (NULL, 'MUNSOO', SYSDATE); -- ERROR ��connot insert NULL into��
INSERT INTO TESTPK VALUES (1, 'MUNSOO', SYSDATE); -- ERROR ��unique constraint violates��
INSERT INTO TESTPK VALUES (2, 'MUNSOO', SYSDATE);

SELECT  * FROM TESTPK;

-- TABLE�� 1ȸ��뿩�� �׽�Ʈ
CREATE TABLE TESTPK2
(
 PID    NUMBER PRIMARY KEY,
 PNAME  VARCHAR2(15) PRIMARY KEY -- ERROR ��table can have only one primary key��
);

CREATE TABLE TESTPK2
( -- COLUMN �������� �������� �ɱ�
 PID    NUMBER CONSTRAINT P2_PID PRIMARY KEY,
 PNAME  VARCHAR2(15),
 PDATE  DATE
);

CREATE TABLE TESTPK3
( -- TABLE �������� �������� �ɱ�
 PID    NUMBER,
 PNAME  VARCHAR2(15),
 PDATE  DATE,
 CONSTRAINT P3_PID PRIMARY KEY (PID)
);

-- ���� 4. CHECK CONSTRAINT ������������������������������������������������������������������������������������������������������������������
-- COLUMN�� ��ϵǴ� ���� ������ ������ �Է��ϴ� ��������.
-- CHECK( COLUMN�̸� ������ �񱳰� )
-- �񱳰��� �������̾�� �Ѵ�. �������̸� ERROR (EG.SYSDATE)
CREATE TABLE TSETCHK
(
 C_NAME   VARCHAR2(15) CONSTRAINT TCK_NAME NOT NULL,
 C_PRICE  NUMBER(5) CHECK (C_PRICE BETWEEN 1 AND 99999),
 C_LEVEL  CHAR(1) CHECK (C_LEVEL IN ('A','B','C'))
);
-- �� ���
INSERT INTO TSETCHK VALUES ('GALAXY S9', 75000, 'B');
INSERT INTO TSETCHK VALUES ('LG G7', 124000, 'B'); -- ERROR ��value larger than specified precision allowed
                                                   --         for this column�� CHECK����
INSERT INTO TSETCHK VALUES ('LG G7', 0, 'B'); -- ERROR ��check constraint violated��
INSERT INTO TSETCHK VALUES ('LG G7', 65300, 'D'); -- ERROR ��check constraint violated��
INSERT INTO TSETCHK VALUES ('LG G7', 30690, 'A');

SELECT  * FROM TSETCHK;

CREATE TABLE TESTCHK2
(
 C_NAME    VARCHAR(15) PRIMARY KEY,
 C_PRICE   NUMBER(5) CHECK (C_PRICE >= 1 AND C_PRICE <= 99999),
 C_LEVEL   CHAR(1) CHECK (C_LEVEL = 'A' OR C_LEVEL = 'B' OR C_LEVEL = 'C'),
 --C_DATE    DATE CHECK (C_DATE < SYSDATE) -- ERROR : �񱳰��� �ݵ�� ���ͷ�(��)�� ���. SYSDAYE ���Ұ�.
 --C_DATE    DATE CHECK (C_DATE < TO_DATE('16/01/01', 'RR/MM/DD')) -- OK
 C_DATE    DATE CHECK (C_DATE < TO_DATE('16/01/01', 'YYYY/MM/DD')) -- �̰� �Ǵµ� BUG��.
);
DROP TABLE CONSTRAINT_EMP;
-- ��������������������������������������������������������������������������������������������������������������������������������������������������������������
-- SAMPLE SCRIPT �����
CREATE TABLE CONSTRAINT_EMP
(
 EID        CHAR(3) CONSTRAINT PKEID PRIMARY KEY,
 ENAME      VARCHAR(20) CONSTRAINT NENAME NOT NULL,
 ENO        CHAR(14) CONSTRAINT NENO NOT NULL CONSTRAINT UENO UNIQUE,
 EMAIL      VARCHAR2(25) CONSTRAINT UEMAIL UNIQUE,
 PHONE      VARCHAR2(12),
 HIRE_DATE  DATE DEFAULT SYSDATE,
 JID        CHAR(2) CONSTRAINT FKJID REFERENCES JOB ON DELETE SET NULL,
 SALARY     NUMBER,
 BONUS_PCT  NUMBER,
 MARRIAGE   CHAR(1) DEFAULT 'N' CONSTRAINT CHK CHECK (MARRIAGE IN('Y','N')),
 MID        CHAR(3) CONSTRAINT FKMID REFERENCES CONSTRAINT_EMP ON DELETE SET NULL,
 DID        CHAR(2),
 CONSTRAINT FKDID FOREIGN KEY (DID) REFERENCES DEPARTMENT ON DELETE CASCADE
);
-- ��������������������������������������������������������������������������������������������������������������������������������������������������������������
-- ���� 5. FOREIGN KEY CONSTRAINT ����������������������������������������������������������������������������������������������������
-- �ܷ�Ű, �ܺ�Ű
-- �ٸ� TABLE���� �����ϴ� ���� ����� �� �ִ� COLUMN�� �ǹ�.
-- �������� �ʴ� ���� ����ϸ� ERROR

-- COLUMN�������� ����
-- [CONSTRAINT �̸�] REFERENCES �������̺��̸� [(������ COLUMN�̸�)]
-- TABLE�������� ����
-- [CONSTRAINT �̸�] FOREIGN KEY (������ COLUMN�̸�) REFERENCES �������̺� [(������ COLUMN�̸�)]
-- NULL�� ����� �� �ִ�.
CREATE TABLE TESTFK
(
 EMP_ID     CHAR(3) REFERENCES EMPLOYEE, -- ����COLUMN�� �����Ǹ� PRIMARY KEY COLUMN�� �ڵ��Ҵ�
 DEPT_ID    CHAR(2) CONSTRAINT TFK_DID REFERENCES DEPARTMENT (DEPT_ID),
 JOB_ID     CHAR(2),
 --���̺���
 CONSTRAINT TFK_JID FOREIGN KEY (JOB_ID) REFERENCES JOB (JOB_ID)
);
-- ����׽�Ʈ
-- ���� ����� TABLE�� COLUMN�� ��ϵǾ� �ִ� ���� ����� �� �ִ�.
INSERT INTO TESTFK VALUES ('300', NULL, NULL); -- ERROR ��integrity constraint - parent key not found��
                                               -- �������� ���� �� ���
INSERT INTO TESTFK VALUES ('100', NULL, NULL);
INSERT INTO TESTFK VALUES ('200', '70', NULL); -- ERROR ��integrity constraint - parent key not found��
                                               -- �������� ���� �� ��� : 70�� ���� �μ��ڵ�
INSERT INTO TESTFK VALUES ('200', '90', NULL);
INSERT INTO TESTFK VALUES ('124', '80', 'J9'); -- ERROR ��integrity constraint - parent key not found��
                                               -- �������� ���� �� ��� : J9�� ���� �����ڵ�
INSERT INTO TESTFK VALUES ('124', '80', 'J7');

SELECT  * FROM TESTFK;

-- �ܷ�Ű �������ǿ��� PARENT KEY�� �� �� �ִ� COLUMN��
-- PRIMARY KEY �Ǵ� UNIQUE ���������� ������COLUMN�̴�.
CREATE TABLE NOPK
(
 ID     CHAR(3),
 NAME   VARCHAR2(10)
);
--CREATE TABLE TESTFK2 -- ERROR ��referenced table does not have a primary(unique) key��
--(
-- FID    CHAR(3) REFERENCES NOPK /*(ID)*/,
-- FNAME  VARCHAR2(10)
--);

CREATE TABLE TESTUN5
(
 ID     CHAR(3) UNIQUE,
 NAME   VARCHAR2(10)
);

CREATE TABLE TESTFK2 -- PASS
(
 FID    CHAR(3) REFERENCES TESTUN5 (ID),
 FNAME  VARCHAR2(10)
);

-- ���� ���� COLUMN�� ��� UNIQUE ���������̳� PRIMARY KEY ���������� ������ ����Ű�� ������ ���
CREATE TABLE TEST_COMPLEX
(
 ID     NUMBER,
 NAME   VARCHAR2(10),
 UNIQUE (ID, NAME)
);

INSERT INTO TEST_COMPLEX VALUES (100, 'ORACLE');
INSERT INTO TEST_COMPLEX VALUES (NULL, NULL);
INSERT INTO TEST_COMPLEX VALUES (100, 'JAVA'); -- ���� UNIQUE���ٸ� ERROR.
INSERT INTO TEST_COMPLEX VALUES (300, NULL);
INSERT INTO TEST_COMPLEX VALUES (NULL, 'JAVA');
INSERT INTO TEST_COMPLEX VALUES (NULL, 'JAVA'); -- ERROR ��unique constraint violates��
INSERT INTO TEST_COMPLEX VALUES (100, 'JAVA'); -- ERROR ��unique constraint violates��

SELECT  * FROM TEST_COMPLEX;

-- ����Ű�� ����Ű�� ������ ���
CREATE TABLE TESTFK4 -- PASS
(
 ID     NUMBER,
 NAME   VARCHAR2(10),
 PRICE  NUMBER,
 FOREIGN KEY (ID, NAME) REFERENCES TEST_COMPLEX (ID, NAME)
);

/*CREATE TABLE TESTFK5
(
 ID     NUMBER REFERENCES TEST_COMPLEX (ID),
 NAME   VARCHAR2(10) REFERENCES TEST_COMPLEX (NAME), -- �̷��� ���� ������ �������־ ERROR
 PRICE  NUMBER --,
 -- FOREIGN KEY (ID) REFERENCES TEST_COMPLEX (ID, NAME) -- ERROR
); */

-- �ܷ�Ű�� ������ COLUMN�� ���� ������̸�, �θ�Ű�� ���� ������ �� ����.
DELETE FROM DEPARTMENT
WHERE  DEPT_ID = '90'; -- ERROR ��integrity constraint violated - child record found�� 
                       -- EMPLOYEE ���̺� DEPT_ID COLUMN�� '90'�� ���ǰ� ����.
                       
-- FOREIGN KEY �������� ������ �����ɼ��� �߰��� �� �ִ�. : DELETION OPITION
-- �⺻ ��Ģ(RESTRICED) : CHILD RECORD�� �����ϸ� PARENT�� ������ �� ����.
-- ON DELETE SET NULL, ON DELETE CASCADE �� �� ������ ������ �� �ִ�.

-- ON DELETE SET NULL �߰� �� PARENT ������ CHILD RECORDE���� NULL�� �ٲ�
CREATE TABLE PRODUCT_STATE
(
 PSTATE     CHAR(1) PRIMARY KEY,
 PCOMMENT   VARCHAR2(10)
);

INSERT INTO PRODUCT_STATE VALUES ('A', '�ְ��');
INSERT INTO PRODUCT_STATE VALUES ('B', '����');
INSERT INTO PRODUCT_STATE VALUES ('C', '�ϱ�');

SELECT  * FROM PRODUCT_STATE;

CREATE TABLE PRODUCT
(
 PNAME      VARCHAR2(20) PRIMARY KEY,
 PPRICE      NUMBER CHECK (PPRICE > 0),
 PSTATE     CHAR(1) REFERENCES PRODUCT_STATE ON DELETE SET NULL
);

INSERT INTO PRODUCT VALUES ('������', 653000, 'A');
INSERT INTO PRODUCT VALUES ('G7', 740000, 'B');
INSERT INTO PRODUCT VALUES ('Mac Pro', 2500000, 'C');

SELECT  * FROM PRODUCT;

-- DELETE TEST
DELETE  FROM PRODUCT_STATE
WHERE   PSTATE = 'A';

COMMIT;
SELECT  * FROM PRODUCT; --�� A�� �ԷµǾ��ִ� ���� NULL�� �����.
SELECT  * FROM PRODUCT_STATE; --�� A�� ��������.

-- ON DELETE CASCADE TEST
-- �����Ǵ� PARENT�� �����Ǹ� �� ���� ����ϴ� CHILD RECORD�� ���� ������.
CREATE TABLE PRODUCT2
(
 PNAME      VARCHAR2(20) PRIMARY KEY,
 PPRICE     NUMBER,
 PSTATE     CHAR(1) REFERENCES PRODUCT_STATE (PSTATE) ON DELETE CASCADE
);

INSERT INTO PRODUCT2 VALUES ('Mac Pro', 2500000, 'B');
INSERT INTO PRODUCT2 VALUES ('Mac Air', 1250000, 'C');
SELECT  * FROM PRODUCT2;

--PARENT ����
DELETE FROM PRODUCT_STATE
WHERE  PSTATE = 'B';

COMMIT;
-- ���� �����Ǿ����� Ȯ��
SELECT  * FROM PRODUCT_STATE;
SELECT  * FROM PRODUCT2;

-- ��������������������������������������������������������������������������������������������������������������������������������������������������������������
-- SUB QUERY�� Ȱ���� ���̺� ���� ����
CREATE TABLE TABLE_SUBQUERY1
 AS SELECT     EMP_ID, EMP_NAME, SALARY, DEPT_NAME, JOB_TITLE
    FROM       EMPLOYEE
    LEFT JOIN  DEPARTMENT USING (DEPT_ID)
    LEFT JOIN  JOB USING (JOB_ID);
    
SELECT  * FROM TABLE_SUBQUERY1;

-- DESCRIBE TABLE�̸�
-- DESC ���̺��̸�;
-- ���̺��� ������ Ȯ���ϴ� ��ɾ�
DESC TABLE_SUBQUERY1;

-- ���� ���̺��� 90�� �μ��� �Ҽӵ� ���� ������ ���� EMP_COPY90 ���̺� �����Ϸ���
CREATE TABLE EMP_COPY90
 AS SELECT   *
    FROM     EMPLOYEE
    WHERE    DEPT_ID = '90';

SELECT  * FROM EMP_COPY90;
DESC EMP_COPY90;

-- ���纻 ���̺� �����
CREATE TABLE EMP_COPY
 AS SELECT    *
    FROM      EMPLOYEE; --�� ���̺� ����
    
SELECT  * FROM EMP_COPY;
DESC EMP_COPY; --�� SUB QUERY�� �̿��ؼ� ���� TABLE�� ������ ���,
                -- COLUMN�̸�, �ڷ���, NOT NULL CONSTRAINT, ���� ���簡 �ȴ�.
                -- ������ ���������� ������� ����.
                
-- �������� ���� �����͵�ųʸ� Ȯ��
-- USER_CONSTRAINTS
SELECT   * FROM USER_CONSTRAINTS;

SELECT   CONSTRAINT_NAME, CONSTRAINT_TYPE 
FROM     USER_CONSTRAINTS
WHERE    TABLE_NAME = 'EMP_COPY';

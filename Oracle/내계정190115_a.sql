-- DAY11 2019.01.15 -��
/*
 ���̺�� : PHONEBOOK
 �÷��� : ID CHAR(3) �⺻Ű(�����̸� : PK_PBID)
 PNAME    VARCHAR2(20) �� ������.
                        (NN_PBNAME)
 PHONE    VARCHAR2(15) �� ������.
                        (NN_PBPHONE)
                        �ߺ��� �Է¸���.
                        (UN_PBHONE)
 ADDRESS  VARCHAR2(100) �⺻�� ������
                        '����� ���α�'
 NOT NULL�� �����ϰ�, ��� ���̺� �������� ������.
*/
CREATE TABLE PHONEBOOK
(
 ID      CHAR(3),
 PNAME   VARCHAR2(20) CONSTRAINT NN_PNAME NOT NULL,
 PHONE   VARCHAR2(15) CONSTRAINT NN_PBPHONE NOT NULL,
 ADDRESS VARCHAR2(100) DEFAULT '����� ���α�',
 CONSTRAINT PK_PBID PRIMARY KEY (ID),
 CONSTRAINT UN_PBPHONE UNIQUE (PHONE)
);
INSERT INTO PHONEBOOK VALUES ('Br1', '�ѱ���', '010-0000-1111', DEFAULT);
SELECT  * FROM PHONEBOOK;

-- DATA DICTIONARY (�����ͻ���)
-- ����ڰ� ������ ��� ��ü������ ���̺������ ����ǰ� ����.
-- USER_CONSTRAINTS
DESC USER_CONSTRAINTS;

SELECT  CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM    USER_CONSTRAINTS
WHERE   TABLE_NAME = 'PHONEBOOK';
/*
 CONSTRAINT TYPE
 �� P : PRIMARY KEY
 �� U : UNIQUE
 �� C : CHECK, NOT NULL
 �� R : FOREIGN KEY
*/
-- SUB QUERY ����ؼ� ���̺��� ���� ��
-- �����ʹ� �������� �ʰ� ���̺� ������ �����پ��� ���� ���.
-- SUB QUERY�� WHERE���� ��WHERE 1 = 0�� �ۼ�
CREATE TABLE DEPT_COPY
AS SELECT   *
   FROM     DEPARTMENT
   WHERE    1 = 0;
   
SELECT * FROM DEPT_COPY;
DESC DEPT_COPY;

-- SUB QUERY�� ���ο� ���̺��� ���� �� SUB QUERY�� COLUMN�̸��� ������� �ʰ�
-- ���ٸ� COLUMN�̸��� �����ϰ� ���� ���.
-- �ѱ۷� �����ָ� ���� �ѱ۷� �ۼ��ؾ���. ���� SELECT�� COLUMN���� ���� �ο��ؾ��Ѵ�.
CREATE TABLE JOB_COPY (�����ڵ�, ���޸�, �����޿�, �ְ�޿�)
AS SELECT   *
   FROM     JOB;
   
DESC JOB_COPY;

SELECT  * FROM JOB_COPY;

-- ANOTHER WAY : ���ϴ� COLUMN�� ���� �̸������� �� �ִ�.
CREATE TABLE DCOPY
AS SELECT   DEPT_ID AS DID,
            DEPT_NAME AS DNAME,
            LOC_ID AS LID
   FROM     DEPARTMENT;
   
DESC DCOPY;
SELECT  * FROM DCOPY;

-- SUB QUERY�� ���̺��� ���� �� COLUMN�� �ٲٸ鼭 �������ǵ� �߰��� �� �ִ�.
-- NOT NULL�� ����Ǵ� ���� ��Ģ.
-- FOREIGN KEY CONSTRAINT -> �߰��� �� ����.
CREATE TABLE TSUB3 (EID PRIMARY KEY, 
                    ENAME, 
                    SALARY , --CHECK (SALARY > 2000000), -> 2�鸸���� ���� ���� �־ ERROR. 
                    DID, --REFERENCES DEPARTMENT, -> FOREIGN KEY �����̱� ������ ERROR
                    JTITLE) --NOT NULL) -> OUTER JOIN���� NULL�� ����־ ERROR. NULL�� ���ٸ� ����.
AS  SELECT    EMP_ID, EMP_NAME, SALARY, DEPT_ID, JOB_TITLE
    FROM      EMPLOYEE
    LEFT JOIN DEPARTMENT USING (DEPT_ID)
    LEFT JOIN JOB USING (JOB_ID);
-- ���������� ���� �ۼ���ó�� �����ϰ� �ʹٸ� SUB QUERY�� �����ϸ� ��.
CREATE TABLE TSUB3 (EID PRIMARY KEY, 
                    ENAME, 
                    SALARY CHECK (SALARY > 2000000), 
                    DID,
                    JTITLE NOT NULL) 
AS  SELECT    EMP_ID, EMP_NAME, SALARY, DEPT_ID, 
              NVL(JOB_TITLE, '����')
    FROM      EMPLOYEE
    LEFT JOIN DEPARTMENT USING (DEPT_ID)
    LEFT JOIN JOB USING (JOB_ID)
    WHERE     SALARY > 2000000; 
             --AND JOB_ID IS NOT NULL �ϰų� NVL����;
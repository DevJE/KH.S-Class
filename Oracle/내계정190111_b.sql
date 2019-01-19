-- DAY9 2019.01.11 -��

-- ������ DDL (Data Definition Language) : ������ ���Ǿ� ��������������������������������������������������������������������������������������������������������
-- CREATE, ALTER, DROP
-- �����ͺ��̽� ��ü ����� ����, �����ϴ� ����
-- ���̺�(TABLE), ��(VIEW), �ε���(INDEX), ������(SEQUENCE), �����(USER),
-- ��(ROLE), ���ν���(PROCEDURE), �Լ�(FUNCTION), Ʈ����(TRIGGER), ���Ǿ�(SYNONYM)

/* 
 ���̺����
 : CREATE TABLE ���̺�� (
        COLUMN�̸� �ڷ���(������) DEFAULT �⺻�� ��������,
        COLUMN�̸� �ڷ���(������),
                            ��
                            ��
                            ��
        COLUMN�� ������ �������� 
 )
*/
CREATE   TABLE TEST
(
 ID   NUMBER(5),
 NAME CHAR(10 CHAR),
 ADDRESS VARCHAR2(50)
);
-- ���̺� ���� Ȯ�� : DESC / DESCRIBE ���̺��;
DESC TEST;

SELECT * FROM TEST;

INSERT INTO TEST ( ID, NAME, ADDRESS )
VALUES           ( 10023, '��ǰ��', '����� ������ ���ﵿ 77');

INSERT INTO TEST -- �÷��� ���� : �÷����������� �����Է�
VALUES           ( 10270, '�ѶѺ�', '�泲 �뿵�� 5995');

INSERT INTO TEST ( ID, NAME ) -- ADDRESS�� �Է�X -> NULLó����.
VALUES           ( 03341, '�ؾ');

INSERT INTO TEST
VALUES           ( 420, '�Ǻ���', NULL);
-- ����������������������������������������������������������������������������������������������������������������������������������������������������������������������
--DROP TABLE ORDERS;
CREATE TABLE ORDERS
(
 ORDERNO CHAR(4),
 CUSTNO CHAR(4),
 ORDERDATE DATE DEFAULT SYSDATE,
 SHIPDATE DATE,
 SHIPADDRESS VARCHAR2(40),
 QUANTITY NUMBER
);
COMMENT ON COLUMN ORDERS.ORDERNO IS '�ֹ���ȣ';
COMMENT ON COLUMN ORDERS.CUSTNO IS '����ȣ';
COMMENT ON COLUMN ORDERS.ORDERDATE IS '�ֹ�����';
COMMENT ON COLUMN ORDERS.SHIPDATE IS '�������';
COMMENT ON COLUMN ORDERS.SHIPADDRESS IS '����ּ�';
COMMENT ON COLUMN ORDERS.QUANTITY IS '�ֹ�����';

/*
 �������� ������ ������ ���̺� : NOTICE
 �÷� :
 �۹�ȣ(����), ������(�������� 30����Ʈ), �ۼ��ھ��̵�(�������� 15����Ʈ),
 �ۼ���¥(��¥), �ۼ�����(�������� 2000����Ʈ), ÷�����ϰ�θ�(�������� 50����Ʈ),
 �÷��� :
 NOTICE_NO, NOTICE_TITLE, NOTICE_WRITER, NOTICE_DATE, NOTICE_CONTENT, FILE_PATH
 �ۼ���¥�� �⺻���� SYSDATE
*/
CREATE TABLE NOTICE
(
 NOTICE_NO NUMBER,
 NOTICE_TITLE VARCHAR2(30),
 NOTICE_WRITER VARCHAR2(15),
 NOTICE_DATE DATE DEFAULT SYSDATE,
 NOTICE_CONTENT VARCHAR2(2000),
 FILE_PATH VARCHAR2(50)
);
-- ù ��° �� �߰� :
-- 1, 'ù��° ������', 'user01', '�ȳ��ϼ���. ���������� �˷��帳�ϴ�'
INSERT INTO NOTICE ( NOTICE_NO, NOTICE_TITLE, NOTICE_WRITER, NOTICE_DATE, NOTICE_CONTENT ) 
VALUES             ( 1, 'ù��° ������', 'user01', DEFAULT, '�ȳ��ϼ���. ���������� �˷��帳�ϴ�' );

SELECT * FROM NOTICE;
-- �� ��° �� �߰� :
-- �۹�ȣ�� ���� ū �� + 1, '�ι�° ������', 'user02', '�˸��ϴ�.�ι�°'
INSERT INTO NOTICE ( NOTICE_NO, NOTICE_TITLE, NOTICE_WRITER, NOTICE_DATE, NOTICE_CONTENT )
VALUES             ( (SELECT MAX(NOTICE_NO) FROM NOTICE) +1, '�ι�° ������', 'user02', DEFAULT ,'�˸��ϴ�. �ι�°' );

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '�۹�ȣ';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '������';
COMMENT ON COLUMN NOTICE.NOTICE_WRITER IS '�ۼ��ھ��̵�';
COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '�ۼ���¥';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '�ۼ�����';
COMMENT ON COLUMN NOTICE.FILE_PATH IS '÷�����ϰ�θ�';

-- ���� DML (Data Manipulation Language) : ������ ���۾� ����������������������������������������������������������������������������������������������������������
-- INSERT, UPDATE, DELETE, TRUNCATE
-- ���̺� �����͸� �߰� ����ϰų� ��ϵ� ���� ����, ���� �����ϴ� ����
CREATE TABLE DEPT
(
 DEPT_ID CHAR(2),
 DEPT_NAME VARCHAR2(30)
);
SELECT   COUNT(*) FROM DEPT;
INSERT INTO DEPT VALUES ('20', 'ȸ����'); -- ���̺� ������ ���
SELECT   COUNT(*) FROM DEPT;
INSERT INTO DEPT VALUES ('10', '�λ���');
SELECT   COUNT(*) FROM DEPT;
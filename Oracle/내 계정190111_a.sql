-- DAY9 2019.01.11 -��
-- SQL-D�� ���� ���� �Լ��� (CF)
-- WITH �̸� AS (SUB QUERY)
-- SELECT * FROM �̸�
-- SUB QUERY�� �̸��� �ٿ��ְ�, ���� �̸��� ����Ѵ�.
-- ���� �������� ������ ���� ��� �����ϰ� �� �� ����. �� �ߺ� ���̱⿡ ����.
-- QUERY���� ������ ���� �ۼ��ϴ� �� ���� �̸�ó���ϴ� ���� ����ӵ��� ������.
-- �ַ� INLINE VIEW�� SUB QUERY�� ���� �̿��Ѵ�.

-- �μ��� �޿��� �հ谡 ��ü �޿� ������ 20%���� ���� �������� �μ���� �μ��� �޿��հ踦 ��ȸ��.
SELECT   DEPT_NAME, SUM(SALARY)
FROM     EMPLOYEE
NATURAL  JOIN  DEPARTMENT --�� DEPARTMENT�� �⺻ Ű�� ���ε�.
GROUP BY DEPT_NAME
HAVING   SUM(SALARY) > ( SELECT SUM(SALARY) * 0.2
                         FROM   EMPLOYEE );

-- ���� QUERY�� WITH������ ����� SQL�� �ٲٸ�
WITH    TOTAL_SAL AS ( SELECT   DEPT_NAME, SUM(SALARY) SSAL
                       FROM     EMPLOYEE
                       NATURAL  JOIN DEPARTMENT
                       GROUP BY DEPT_NAME )
SELECT  DEPT_NAME, SSAL -- WITH������ �ٷ� �̾ SELECT�� �ۼ��ؾ���.
FROM    TOTAL_SAL -- INLINE VIEW
WHERE   SSAL > ( SELECT  SUM(SALARY) * 0.2
                 FROM    EMPLOYEE );
                 
-- ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������
/*
 ����Ŭ �м��Լ��� �����͸� �м��ϴ� �Լ��̴�.
 �м��Լ��� ����ϸ�, QUERY(SELECT)������ ����� RESULT SET(�������)�� �������
 ��ü �����Ͱ� �ƴ� �ұ׷캰�� �� ���� �м������ ǥ���ϴ� �Լ�.
 
 �Ϲ� �׷��Լ���� �ٸ� �� :
  �м��Լ��� �м��Լ��� �׷��� ������ �����ؼ� �� �׷��� ������� �� �м������ ������.
  �Ϲ� �׷��Լ��� �׳� �׷캰 ��� ����
  
 <�������>
 
 SELECT �м��Լ��� ([��������1, ��������2, ��������3])
          OVER([QUERY PARTITION ��],
               [ORDER BY ��],
               [WINDOW ��])
 FROM   ���̺��
  
  �� �м��Լ��� : AVG, SUM, RANK, MAX, MIN, COUNT ��
  �� �������� : �м��Լ��� ���� 0 ~ 3������ ����� �� ����.
  �� QUERY PARTITION �� : PARTIRION BY ǥ����
                         PARTITION BY�� �����ϸ�, ǥ���Ŀ� ���� �׷캰�� �и��ϴ� ������ �Ѵ�.
                         RESULT SET(�������)�� �и���.
  �� ORDER BY�� : ORDER BY COULMN DESC/ASC
                 ASC�� ����������.
                 PARTITION BY�� �ڿ� ��ġ�ϸ�, ��� ���� �׷쿡 �����۾��� �����Ѵ�.
                 �и��� �ұ׷� �ȿ��� ����ó�� �����.
  �� WINDOW�� : �м��Լ��� ����� �Ǵ� �����͸� ��(ROW)���� ����, �� �� ���������� ������.
               PARTITION BY�� ���� �������� �׷쿡 ������ �м��� ���� �ұ׷��� ����.
               PARTITION �ȿ��� ���� ������ �����͸� �м� ó���ض� -> �� ����.
*/

-- �ߡ� ��� �ο��ϴ� �Լ� : RANK �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ�
-- ���� ����� ���� ���� ���� ������� �ǳ� ��
-- �� : 1, 2, 2, 4

-- �޿��� ���� �ο��ϱ�
SELECT  EMP_ID, EMP_NAME, SALARY,
        RANK() OVER(ORDER BY SALARY DESC) ����
FROM    EMPLOYEE;

-- RANK()�ȿ� �������� ����ϱ�.
-- ���� : � ���� ������ ��ȸ�ϰ� ������.
-- RANK(������ �˰� ���� ��)

-- �޿� 2300000�� ����ϱ�?
-- CONDITION : �޿��� ���������� ���� �Ǿ������� ���.
SELECT  RANK(2300000) WITHIN GROUP (ORDER BY SALARY DESC) || '����' AS ���
FROM    EMPLOYEE;

-- �ߡ� DENSE_RANK() �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ�
-- ���� ������ ���� �� ���� ������ �������� ����
-- 1, 2, 2, 3...
SELECT   EMP_ID, DEPT_ID, SALARY,
         RANK() OVER(ORDER BY SALARY DESC) "����1",
         DENSE_RANK() OVER(ORDER BY SALARY DESC) "����2",
         DENSE_RANK() OVER(PARTITION BY DEPT_ID ORDER BY SALARY DESC) "����3" --> 90�ڵ� ������ ����...
FROM     EMPLOYEE
ORDER BY DEPT_ID DESC;

-- �ߡ� CUME_DIST() (CUMulative DISTribution) �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ�
-- PARTITION BY�� ���� �׷� ���� �� ��(ROW)�� ORDER BY���� ��õ� ������ �����Ѵ�.
-- �׸��� ���� �׷캰�� ������ �л�����(������� ��ġ)�� ���ϴ� �Լ��̴�.
-- �л�����(������� ��ġ)�� ���ϰ��� �ϴ� ������ �۰ų� ���� ���� ���� ��(ROW) ����
-- �׷� ���� ����� ���� ���� �ǹ���. 0���� 1 ������ ������ ǥ����.

-- �μ��ڵ尡 50�� ������ �̸�, �޿�, �����л� ��ȸ.
SELECT   EMP_NAME, SALARY,
         ROUND(CUME_DIST() OVER(ORDER BY SALARY), 1) �����л�
FROM     EMPLOYEE
WHERE    DEPT_ID ='50';

-- �ߡ� NTILE() �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ�
-- PARTITION�� ��Ŷ(BUCKET)�׷캰�� ������, PARTITION ���� �� ��(ROW)�� 
-- BUCKET�� ��ġ�ϴ� �Լ���.

-- ���� ��� PARTITION�ȿ� 100���� ���� �ִٰ� �������� ��, BUCKET�� 4���� �����Ѵٸ� 1���� BUCKET��
-- 25���� ��(ROW)�� ��еȴ�.
-- ��Ȯ�ϰ� �й���� ���� ���� �ٻ�ġ�� ����� �� ���� ���� ���� BUCKET�� �Ҵ��.

-- �޿��� 4�� ������� �з��ϱ�.
SELECT   EMP_NAME, SALARY,
         NTILE(4/*������ BUCKET�� ����*/) OVER(ORDER BY SALARY) ���
FROM     EMPLOYEE;

-- �ߡ� ROW_NUMBER() �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ�
-- ROWNUM���� ���谡 ����
-- �� PARTITION ���� ������ ORDER BY�� ������ �Ŀ� ���⼼ ������ �ο���.

-- ���, �̸�, �޿�, �Ի���, ����
-- �� ������ �޿��� ���� ������, �޿��� ���ٸ� ���� ���� �Ի��� ������.
SELECT   EMP_ID, EMP_NAME, SALARY, HIRE_DATE,
         ROW_NUMBER() OVER(ORDER BY SALARY DESC, HIRE_DATE ASC) ����
FROM     EMPLOYEE;

-- �����Լ� ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-- EMPLOYEE ���̺�κ��� �μ��ڵ尡 '60'�� �������� ���, �޿�, �ش� �μ��׷�(WINDOW)�� �����
-- ������������ ����.
SELECT   EMP_ID, SALARY,
         SUM(SALARY) OVER(PARTITION BY DEPT_ID
                          ORDER BY EMP_ID
                          ROWS BETWEEN UNBOUNDED PRECEDING 
                               AND UNBOUNDED FOLLOWING) "WIN1",
-- ù ����� ������ ������� �޿��հ踦 ���ؼ� 'WIN1'��, 
/* THE FIRST WINDOW'S ROW : UNBOUNDED PRECEDING
   THE FINALLY WINDOW'S ROW : UNBOUNDED FOLLOWING */
         SUM(SALARY) OVER(PARTITION BY DEPT_ID
                          ORDER BY EMP_ID
                          ROWS BETWEEN UNBOUNDED PRECEDING 
                               AND CURRENT ROW) "WIN2",
-- WINDOW�� ��������� ���� ��ġ(CURRENT ROW)������ �հ踦 ���ؼ� 'WIN2'��,
         SUM(SALARY) OVER(PARTITION BY DEPT_ID
                          ORDER BY EMP_ID
                          ROWS BETWEEN CURRENT ROW 
                               AND UNBOUNDED FOLLOWING) "WIN3"
-- CURRENT ROW���� WINDOW�� ������ ������� �հ踦 'WIN3' ��ȸ.
FROM     EMPLOYEE
WHERE    DEPT_ID = '60';

----------------- �ٸ��� ǥ���غ��ô�.
SELECT   EMP_ID, SALARY,
         SUM(SALARY) OVER(PARTITION BY DEPT_ID
                          ORDER BY EMP_ID
                          ROWS BETWEEN 1 PRECEDING 
                               AND 1 FOLLOWING) "WIN1",
-- �޿��� �հ踦 ������ �߽����� -1��, +1����� ���ؼ� "WIN1" �� 1 PRECEDING AND 1 FOLLOWING

         SUM(SALARY) OVER(PARTITION BY DEPT_ID
                          ORDER BY EMP_ID
                          ROWS BETWEEN 1 PRECEDING 
                               AND CURRENT ROW) "WIN2",
-- WINDOW�� ������� ������ġ(CURRENT ROW)������ �հ踦 ���ؼ� "WIN2" �� 1 PRECEDING AND CURRENT ROW
         SUM(SALARY) OVER(PARTITION BY DEPT_ID
                          ORDER BY EMP_ID
                          ROWS BETWEEN CURRENT ROW 
                               AND 1 FOLLOWING) "WIN3"
-- CURRENT ROW���� WINDOW�� ���� ������� �հ踦 'WIN3' ��ȸ. �� CURRENT ROW AND 1 FOLLOWING
FROM     EMPLOYEE
WHERE    DEPT_ID = '60';

-- �ߡ� RATIO_TO_REPORT() �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ�
-- �ش籸������ �����ϴ� ������ �����ϴ� �Լ�

-- �������� �ѱ޿��� 2õ���� ������ų ��, ���� �޿� ������ �����ؼ� �� ������ �޿� �λ�� ��ȸ
SELECT  EMP_NAME, SALARY,
        LPAD(TRUNC(RATIO_TO_REPORT(SALARY) OVER() * 100, 0), 5) || '%'�޿�����,
        TO_CHAR(TRUNC(RATIO_TO_REPORT(SALARY) OVER() * 20000000, 0), 'L00,999,999')�޿��λ��
FROM    EMPLOYEE;

-- �ߡ� LAG(��ȸ�� ����, ������ġ, ����������ġ) OVER() �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ�
-- �����ϴ� COLUMN�� ���� ��(ROW)�� �������� ���� ��(�� ��)�� ���� ��ȸ��
SELECT  EMP_NAME, DEPT_ID, SALARY,
        /* 1 : �ٷ� �� ���� ��, 0 : ���� ���� ������ 0 ó�� */
        LAG(SALARY, 1, 0) OVER(ORDER BY SALARY) "��ȸ1",
        /* ���� ���� ������ ���� ���� ���� ��� */
        LAG(SALARY, 1, SALARY) OVER(ORDER BY SALARY) "��ȸ2",
        /* �μ��׷� �ȿ����� ���� �� �� ��� */
        LAG(SALARY, 1, SALARY) OVER(PARTITION BY DEPT_ID
                                    ORDER BY SALARY) "��ȸ3"
FROM    EMPLOYEE;

-- �ߡ� LEAD(��ȸ�� ����, ���� �� ��, 0 �Ǵ� COLUMN) OVER() �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ� �ߡߡߡ�
-- ���� ���� �� ��ȸ�� �� �����.
SELECT   EMP_NAME, DEPT_ID, SALARY,
        /* 1 : �ٷ� ���� ���� ��, 0 : ���� ���� ������ 0 ó�� */
         LEAD(SALARY, 1, 0) OVER(ORDER BY SALARY) "��ȸ1",
        /* ���� ���� ������ ���� ���� ���� ��� */
         LEAD(SALARY, 1, SALARY) OVER(ORDER BY SALARY) "��ȸ2",
        /* �μ��׷� �ȿ����� ���� �� �� ��� */
         LEAD(SALARY, 1, SALARY) OVER(PARTITION BY DEPT_ID
                                      ORDER BY SALARY) "��ȸ3"
FROM     EMPLOYEE
ORDER BY DEPT_ID;
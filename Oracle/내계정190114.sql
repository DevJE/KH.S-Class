-- DAY10 2019.01.14

-- DDL
-- 纔檜綰 鼠唸撩 薯擒褻勒(CONSTRAINT)

-- 收收 1. NOT NULL CONSTRAINT 收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收
-- COLUMN縑 高檜 奩萄衛 晦煙腎橫撿 й 陽 撲薑л. (壎鼻 в熱殮溘о跡)
-- COLUMN溯漣縑憮虜 撲薑й 熱 氈棻.
CREATE TABLE TESTNN
(
 NNID     NUMBER(5) NOT NULL,
 NN_NAME  VARCHAR2(20)
);

-- 高 晦煙 纔蝶お
INSERT INTO TESTNN (NNID, NN_NAME)
VALUES (NULL, NULL); -- ERROR. NNID縑 NULL擊 晦煙ж溥堅 ц晦 陽僥. (NOT NULL 薯擒褻勒)

INSERT INTO TESTNN -- COLUMN檜葷 儅楞 : 纔檜綰曖 賅萇 COLUMN縑 高 晦煙.
VALUES (1, NULL); -- 纔檜綰曖 COLUMN儅撩 牖憮諦 濠猿⑽擊 蜃蹺橫憮 晦煙.

SELECT  * FROM TESTNN;

INSERT INTO TESTNN (NN_NAME)
VALUES ('ORACLE'); -- ERROR. 儅楞脹 NNID縑 濠翕戲煎 NULL檜 殮溘脾. (NOT NULL 薯擒褻勒)

-- 纔檜綰 溯漣 瞳辨 碳陛 : NOT NULL
CREATE TABLE TESTNN2
(
 NN_ID    NUMBER(5) CONSTRAINT T2_NNID NOT NULL,
 NN_NAME  VARCHAR2(10)
 -- 纔檜綰溯漣奢除
 -- [CONSTRAINT 薯擒褻勒檜葷] 薯擒褻勒謙盟 (瞳辨й COLUMN檜葷)
 -- CONSTRAINT T2_NNNAME NOT NULL (NN_NAME) -> ERROR
);

-- 收收 2. UNIQUE CONSTRAINT 收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收
-- п渡 COLUMN曖 醞犒高(翕橾高) 殮溘擊 虞晦 嬪и 薯擒褻勒.
-- 撲薑ж賊 翕橾и 高擊 殮溘й 熱 橈棻. (偽擎 高 舒 廓 晦煙 碳陛)
-- COLUMN溯漣, TABLE溯漣 賅舒 撲薑й 熱 氈棻.
-- 犒м酈煎紫 撲薑й 熱 氈棻.
CREATE TABLE TESTUN
(
 UN_ID    CHAR(3)   UNIQUE,
 UN_NAME  VARCHAR2(10)   NOT NULL
);

-- 晦煙纔蝶お
INSERT INTO TESTUN VALUES ('AAA', 'ORACLE');
INSERT INTO TESTUN VALUES ('AAA', 'JAVA'); -- ERROR ☆unique constraint violates★
INSERT INTO TESTUN VALUES ('AAB', 'JAVA');

SELECT  * FROM TESTUN;

CREATE TABLE TESTUN2
( -- COLUMN 溯漣縑憮曖 薯擒褻勒 撲薑
 UN_ID    CHAR(3)  CONSTRAINT T2_UNID UNIQUE,
 IN_NAME  VARCHAR2(10) CONSTRAINT T2_UNNAME NOT NULL
);

CREATE TABLE TESTUN3
( -- TABLE 溯漣縑憮 薯擒褻勒 撲薑ж晦
 UN_ID    CHAR(3),
 UN_NAME  VARCHAR2(10) NOT NULL,
 CONSTRAINT T3_UNID UNIQUE (UN_ID)
);

-- 收收 3. PRIMARY KEY CONSTRAINT 收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收
-- TABLE縑憮 и ч(ROW)曖 薑爾蒂 瓊晦 嬪и 高檜 晦煙脹 COLUMN縑 瞳辨л.
-- NOT NULL + UNIQUE
-- и TABLE縑 и 廓虜 餌辨й 熱 氈棻.
CREATE TABLE TESTPK
(
 PK_ID    NUMBER /*雖薑寰ж賊 晦獄 7濠葬煎 й渡*/ PRIMARY KEY,
 PK_NAME  VARCHAR2(15) NOT NULL,
 PK_DATE  DATE
);
--晦煙纔蝶お
INSERT INTO TESTPK VALUES (1, 'GILDONG','15/03/12');
INSERT INTO TESTPK VALUES (NULL, 'MUNSOO', SYSDATE); -- ERROR ☆connot insert NULL into★
INSERT INTO TESTPK VALUES (1, 'MUNSOO', SYSDATE); -- ERROR ☆unique constraint violates★
INSERT INTO TESTPK VALUES (2, 'MUNSOO', SYSDATE);

SELECT  * FROM TESTPK;

-- TABLE渡 1�蜓蝧踸征� 纔蝶お
CREATE TABLE TESTPK2
(
 PID    NUMBER PRIMARY KEY,
 PNAME  VARCHAR2(15) PRIMARY KEY -- ERROR ☆table can have only one primary key★
);

CREATE TABLE TESTPK2
( -- COLUMN 溯漣縑憮 薯擒褻勒 勘晦
 PID    NUMBER CONSTRAINT P2_PID PRIMARY KEY,
 PNAME  VARCHAR2(15),
 PDATE  DATE
);

CREATE TABLE TESTPK3
( -- TABLE 溯漣縑憮 薯擒褻勒 勘晦
 PID    NUMBER,
 PNAME  VARCHAR2(15),
 PDATE  DATE,
 CONSTRAINT P3_PID PRIMARY KEY (PID)
);

-- 收收 4. CHECK CONSTRAINT 收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收
-- COLUMN縑 晦煙腎朝 高縑 撲薑й 褻勒擊 殮溘ж朝 薯擒褻勒.
-- CHECK( COLUMN檜葷 翱骯濠 綠掖高 )
-- 綠掖高擎 堅薑高檜橫撿 и棻. 嶸翕高檜賊 ERROR (EG.SYSDATE)
CREATE TABLE TSETCHK
(
 C_NAME   VARCHAR2(15) CONSTRAINT TCK_NAME NOT NULL,
 C_PRICE  NUMBER(5) CHECK (C_PRICE BETWEEN 1 AND 99999),
 C_LEVEL  CHAR(1) CHECK (C_LEVEL IN ('A','B','C'))
);
-- 高 晦煙
INSERT INTO TSETCHK VALUES ('GALAXY S9', 75000, 'B');
INSERT INTO TSETCHK VALUES ('LG G7', 124000, 'B'); -- ERROR ☆value larger than specified precision allowed
                                                   --         for this column★ CHECK嬪寡
INSERT INTO TSETCHK VALUES ('LG G7', 0, 'B'); -- ERROR ☆check constraint violated★
INSERT INTO TSETCHK VALUES ('LG G7', 65300, 'D'); -- ERROR ☆check constraint violated★
INSERT INTO TSETCHK VALUES ('LG G7', 30690, 'A');

SELECT  * FROM TSETCHK;

CREATE TABLE TESTCHK2
(
 C_NAME    VARCHAR(15) PRIMARY KEY,
 C_PRICE   NUMBER(5) CHECK (C_PRICE >= 1 AND C_PRICE <= 99999),
 C_LEVEL   CHAR(1) CHECK (C_LEVEL = 'A' OR C_LEVEL = 'B' OR C_LEVEL = 'C'),
 --C_DATE    DATE CHECK (C_DATE < SYSDATE) -- ERROR : 綠掖高擎 奩萄衛 葬攪歇(高)擊 餌辨. SYSDAYE 餌辨碳陛.
 --C_DATE    DATE CHECK (C_DATE < TO_DATE('16/01/01', 'RR/MM/DD')) -- OK
 C_DATE    DATE CHECK (C_DATE < TO_DATE('16/01/01', 'YYYY/MM/DD')) -- 檜剪 腎朝等 BUG歜.
);
DROP TABLE CONSTRAINT_EMP;
-- 收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收
-- SAMPLE SCRIPT 瞳橫爾晦
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
-- 收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收
-- 收收 5. FOREIGN KEY CONSTRAINT 收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收
-- 諼楚酈, 諼睡酈
-- 棻艇 TABLE縑憮 薯奢ж朝 高虜 餌辨й 熱 氈朝 COLUMN擊 曖嘐.
-- 薯奢腎雖 彊朝 高擊 餌辨ж賊 ERROR

-- COLUMN溯漣縑憮 撲薑
-- [CONSTRAINT 檜葷] REFERENCES 霤褻纔檜綰檜葷 [(霤褻й COLUMN檜葷)]
-- TABLE溯漣縑憮 撲薑
-- [CONSTRAINT 檜葷] FOREIGN KEY (瞳辨й COLUMN檜葷) REFERENCES 霤褻纔檜綰 [(霤褻й COLUMN檜葷)]
-- NULL擎 餌辨й 熱 氈棻.
CREATE TABLE TESTFK
(
 EMP_ID     CHAR(3) REFERENCES EMPLOYEE, -- 霤褻COLUMN檜 儅楞腎賊 PRIMARY KEY COLUMN檜 濠翕й渡
 DEPT_ID    CHAR(2) CONSTRAINT TFK_DID REFERENCES DEPARTMENT (DEPT_ID),
 JOB_ID     CHAR(2),
 --纔檜綰溯漣
 CONSTRAINT TFK_JID FOREIGN KEY (JOB_ID) REFERENCES JOB (JOB_ID)
);
-- 晦煙纔蝶お
-- 憮煎 翱唸脹 TABLE婁 COLUMN縑 晦煙腎橫 氈朝 高虜 餌辨й 熱 氈棻.
INSERT INTO TESTFK VALUES ('300', NULL, NULL); -- ERROR ☆integrity constraint - parent key not found★
                                               -- 薯奢腎雖 彊擎 高 餌辨
INSERT INTO TESTFK VALUES ('100', NULL, NULL);
INSERT INTO TESTFK VALUES ('200', '70', NULL); -- ERROR ☆integrity constraint - parent key not found★
                                               -- 薯奢腎雖 彊擎 高 餌辨 : 70擎 橈朝 睡憮囀萄
INSERT INTO TESTFK VALUES ('200', '90', NULL);
INSERT INTO TESTFK VALUES ('124', '80', 'J9'); -- ERROR ☆integrity constraint - parent key not found★
                                               -- 薯奢腎雖 彊擎 高 餌辨 : J9朝 橈朝 霜晝囀萄
INSERT INTO TESTFK VALUES ('124', '80', 'J7');

SELECT  * FROM TESTFK;

-- 諼楚酈 薯擒褻勒縑憮 PARENT KEY陛 腆 熱 氈朝 COLUMN擎
-- PRIMARY KEY 傳朝 UNIQUE 薯擒褻勒檜 撲薑脹COLUMN檜棻.
CREATE TABLE NOPK
(
 ID     CHAR(3),
 NAME   VARCHAR2(10)
);
--CREATE TABLE TESTFK2 -- ERROR ☆referenced table does not have a primary(unique) key★
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

-- 罹楝 偃曖 COLUMN擊 僮橫憮 UNIQUE 薯擒褻勒檜釭 PRIMARY KEY 薯擒褻勒擊 撲薑и 犒м酈蒂 霤褻й 唳辦
CREATE TABLE TEST_COMPLEX
(
 ID     NUMBER,
 NAME   VARCHAR2(10),
 UNIQUE (ID, NAME)
);

INSERT INTO TEST_COMPLEX VALUES (100, 'ORACLE');
INSERT INTO TEST_COMPLEX VALUES (NULL, NULL);
INSERT INTO TEST_COMPLEX VALUES (100, 'JAVA'); -- 偃滌 UNIQUE艘棻賊 ERROR.
INSERT INTO TEST_COMPLEX VALUES (300, NULL);
INSERT INTO TEST_COMPLEX VALUES (NULL, 'JAVA');
INSERT INTO TEST_COMPLEX VALUES (NULL, 'JAVA'); -- ERROR ☆unique constraint violates★
INSERT INTO TEST_COMPLEX VALUES (100, 'JAVA'); -- ERROR ☆unique constraint violates★

SELECT  * FROM TEST_COMPLEX;

-- 犒м酈蒂 霤褻酈煎 撲薑й 唳辦
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
 NAME   VARCHAR2(10) REFERENCES TEST_COMPLEX (NAME), -- 檜溢啪 評煎 釭援橫 撲薑п輿橫紫 ERROR
 PRICE  NUMBER --,
 -- FOREIGN KEY (ID) REFERENCES TEST_COMPLEX (ID, NAME) -- ERROR
); */

-- 諼楚酈陛 撲薑脹 COLUMN曖 高檜 餌辨醞檜賊, 睡賅酈朝 瞰渠 餉薯й 熱 橈棻.
DELETE FROM DEPARTMENT
WHERE  DEPT_ID = '90'; -- ERROR ☆integrity constraint violated - child record found★ 
                       -- EMPLOYEE 纔檜綰縑 DEPT_ID COLUMN曖 '90'檜 餌辨腎堅 氈擠.
                       
-- FOREIGN KEY 薯擒褻勒 撲薑衛 餉薯褫暮擊 蹺陛й 熱 氈棻. : DELETION OPITION
-- 晦獄 錳罌(RESTRICED) : CHILD RECORD陛 襄營ж賊 PARENT朝 餉薯й 熱 橈棻.
-- ON DELETE SET NULL, ON DELETE CASCADE 曖 舒 陛雖蒂 撲薑й 熱 氈棻.

-- ON DELETE SET NULL 蹺陛 Ⅱ PARENT 餉薯衛 CHILD RECORDE高擊 NULL煎 夥翎
CREATE TABLE PRODUCT_STATE
(
 PSTATE     CHAR(1) PRIMARY KEY,
 PCOMMENT   VARCHAR2(10)
);

INSERT INTO PRODUCT_STATE VALUES ('A', '譆堅晝');
INSERT INTO PRODUCT_STATE VALUES ('B', '爾鱔');
INSERT INTO PRODUCT_STATE VALUES ('C', 'ж晝');

SELECT  * FROM PRODUCT_STATE;

CREATE TABLE PRODUCT
(
 PNAME      VARCHAR2(20) PRIMARY KEY,
 PPRICE      NUMBER CHECK (PPRICE > 0),
 PSTATE     CHAR(1) REFERENCES PRODUCT_STATE ON DELETE SET NULL
);

INSERT INTO PRODUCT VALUES ('偉楣衛', 653000, 'A');
INSERT INTO PRODUCT VALUES ('G7', 740000, 'B');
INSERT INTO PRODUCT VALUES ('Mac Pro', 2500000, 'C');

SELECT  * FROM PRODUCT;

-- DELETE TEST
DELETE  FROM PRODUCT_STATE
WHERE   PSTATE = 'A';

COMMIT;
SELECT  * FROM PRODUCT; --⊥ A陛 殮溘腎橫氈湍 匙檜 NULL煎 滲唳脾.
SELECT  * FROM PRODUCT_STATE; --⊥ A陛 橈橫螺擠.

-- ON DELETE CASCADE TEST
-- 薯奢腎朝 PARENT陛 餉薯腎賊 檜 高擊 餌辨ж朝 CHILD RECORD紫 偽檜 雖錶颶.
CREATE TABLE PRODUCT2
(
 PNAME      VARCHAR2(20) PRIMARY KEY,
 PPRICE     NUMBER,
 PSTATE     CHAR(1) REFERENCES PRODUCT_STATE (PSTATE) ON DELETE CASCADE
);

INSERT INTO PRODUCT2 VALUES ('Mac Pro', 2500000, 'B');
INSERT INTO PRODUCT2 VALUES ('Mac Air', 1250000, 'C');
SELECT  * FROM PRODUCT2;

--PARENT 餉薯
DELETE FROM PRODUCT_STATE
WHERE  PSTATE = 'B';

COMMIT;
-- 偽檜 餉薯腎歷朝雖 �挫�
SELECT  * FROM PRODUCT_STATE;
SELECT  * FROM PRODUCT2;

-- 收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收
-- SUB QUERY蒂 �倏踿� 纔檜綰 儅撩 掘僥
CREATE TABLE TABLE_SUBQUERY1
 AS SELECT     EMP_ID, EMP_NAME, SALARY, DEPT_NAME, JOB_TITLE
    FROM       EMPLOYEE
    LEFT JOIN  DEPARTMENT USING (DEPT_ID)
    LEFT JOIN  JOB USING (JOB_ID);
    
SELECT  * FROM TABLE_SUBQUERY1;

-- DESCRIBE TABLE檜葷
-- DESC 纔檜綰檜葷;
-- 纔檜綰曖 掘褻蒂 �挫恉炴� 貲滄橫
DESC TABLE_SUBQUERY1;

-- 霜錳 纔檜綰縑憮 90廓 睡憮縑 模樓脹 霜錳 薑爾虜 評煎 EMP_COPY90 纔檜綰縑 盪濰ж溥賊
CREATE TABLE EMP_COPY90
 AS SELECT   *
    FROM     EMPLOYEE
    WHERE    DEPT_ID = '90';

SELECT  * FROM EMP_COPY90;
DESC EMP_COPY90;

-- 犒餌獄 纔檜綰 虜菟晦
CREATE TABLE EMP_COPY
 AS SELECT    *
    FROM      EMPLOYEE; --⊥ 纔檜綰 犒餌
    
SELECT  * FROM EMP_COPY;
DESC EMP_COPY; --⊥ SUB QUERY蒂 檜辨п憮 晦襄 TABLE擊 犒餌й 唳辦,
                -- COLUMN檜葷, 濠猿⑽, NOT NULL CONSTRAINT, 高虜 犒餌陛 脹棻.
                -- 釭該雖 薯擒褻勒擎 犒餌腎雖 彊擠.
                
-- 薯擒褻勒 婦溼 等檜攪蛐敷傘葬 �挫�
-- USER_CONSTRAINTS
SELECT   * FROM USER_CONSTRAINTS;

SELECT   CONSTRAINT_NAME, CONSTRAINT_TYPE 
FROM     USER_CONSTRAINTS
WHERE    TABLE_NAME = 'EMP_COPY';

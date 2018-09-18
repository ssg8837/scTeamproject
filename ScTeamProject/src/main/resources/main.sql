
select * from BS_USER;
select * from BS_BABY;

DROP TABLE BS_USER;
DROP TABLE BS_BABY;

CREATE TABLE BS_USER (
    USERNO INTEGER PRIMARY KEY, 
    USERTYPE VARCHAR2(10),
    USERID VARCHAR2(30), 
    USERPWD VARCHAR2(30),
    USERADDR VARCHAR2(30),
    USEREMAIL VARCHAR2(30),
    USERPHONE VARCHAR2(30),
    USERNICK VARCHAR2(30)
);

ALTER TABLE BS_USER ADD (USERORIGINALFILE VARCHAR2(100));
ALTER TABLE BS_USER ADD (USERSAVEDFILE VARCHAR2(100));


INSERT INTO BS_USER VALUES(0,'n','test','test','testaddr','test@mail.com','000-111-2234', 'tester',null,null);

CREATE TABLE BS_BABY
(
	BABYNO INTEGER PRIMARY KEY,
    USERNO INTEGER REFERENCES BS_USER(USERNO),
	BABYGENDER VARCHAR2(4),
    BABYBIRTH DATE,
	BABYNAME VARCHAR2(30),
    BABYBLOOD VARCHAR2(4)
);

INSERT INTO BS_BABY VALUES(0,0,'F',SYSDATE,'시험용','AB');


CREATE SEQUENCE BS_USERSEQ;
CREATE SEQUENCE BS_BABYSEQ;

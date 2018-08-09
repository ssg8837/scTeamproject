CREATE TABLE BS_USER (
    USERNO INTEGER PRIMARY KEY, 
    USERID VARCHAR2(30), 
    USERPWD VARCHAR2(30),
    USERADDR VARCHAR2(30),
    USEREMAIL VARCHAR2(30),
    USERPHONE VARCHAR2(30),
    USERNICK VARCHAR2(30)
);

DROP TABLE BS_USER;

CREATE TABLE BS_BABY
(
    USERNNO INTEGER REFERENCES BS_USER(USERNO),
	BABYGENDER VARCHAR2(4),
    BABYBIRTH DATE,
	BABYNAME VARCHAR2(30),
    BABYBLOOD VARCHAR2(4)
);

CREATE SEQUENCE BS_USERSEQ;



DROP TABLE hospital;
DROP TABLE weather;
DROP TABLE location;

CREATE TABLE location (
	USERNO varchar2(300) PRIMARY KEY, 
    USERTYPE VARCHAR2(10),
    USERID VARCHAR2(30), 
    USERPWD VARCHAR2(30),
    USERADDR VARCHAR2(30),
    USEREMAIL VARCHAR2(30),
    USERPHONE VARCHAR2(30),
    USERNICK VARCHAR2(30)
);
CREATE TABLE hospital (
    USERNO INTEGER PRIMARY KEY, 
    USERTYPE VARCHAR2(10),
    USERID VARCHAR2(30), 
    USERPWD VARCHAR2(30),
    USERADDR VARCHAR2(30),
    USEREMAIL VARCHAR2(30),
    USERPHONE VARCHAR2(30),
    USERNICK VARCHAR2(30)
);


CREATE TABLE weather (
	BABYNO INTEGER PRIMARY KEY,
    USERNNO INTEGER REFERENCES BS_USER(USERNO)
);

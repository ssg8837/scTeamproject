DROP TABLE hospital;
DROP TABLE weather;
DROP TABLE location;

CREATE TABLE location (
	location varchar2(300) PRIMARY KEY, --현재 주소
    latitude VARCHAR2(50), --위도
    longitude VARCHAR2(50), --경도
    USERNO number,
    CONSTRAINT fk_location FOREIGN KEY(USERNO) REFERENCES BS_USER(USERNO)
);

CREATE TABLE hospital (
    hpid varchar2(10) primary key, --id
    address varchar2(300) , --병원주소
    name VARCHAR2(300), --병원이름
    divNam VARCHAR2(30), --병원분류 "한의원"
    phone varchar2(20), -- 병원전화번호
    eryn number, --응급실 유무 1=y, 2=n    
    eryynphone varchar2(20), --응급실 전화번호
    time varchar2(500), --병원 운영 시간
    latitude VARCHAR2(50), --병원 위도
    longitude VARCHAR2(50) --병원 경도
);

CREATE TABLE weather (
	USERNO number primary key,
    location varchar2(300) REFERENCES location, --현재 주소
	weather varchar2(20), --날씨
    temperature varchar2(20), --온도
    humidity varchar2(20), --습도
    wind varchar2(20), --풍속
    time date default sysdate --현재 시간
    CONSTRAINT fk_location FOREIGN KEY(USERNO) REFERENCES BS_USER(USERNO) on deletecascade
);

CREATE TABLE City (
	cityCode varchar2(20) primary key,
	cityName varchar2(500)
);
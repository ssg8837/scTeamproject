DROP TABLE hospital;
DROP TABLE city;
--위치 테이블 삭제

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
--날씨 테이블 삭제

CREATE TABLE City (
	cityCode varchar2(20) primary key,
	cityName varchar2(500)
);
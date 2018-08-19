DROP TABLE hospital;
DROP TABLE weather;
DROP TABLE location;

CREATE TABLE location (
	location varchar2(300) PRIMARY KEY, --현재위치 주소
    Latitude VARCHAR2(50), --현재위치 위도
    longitude VARCHAR2(50) --현재위치 경도
);
CREATE TABLE hospital (
    hpid varchar2(10) primary key, --기관id
    address varchar2(300) , --병원주소
    name VARCHAR2(300), --병원이름
    divNam VARCHAR2(30), --병원분류명 "한의원"
    phone varchar2(20), -- 병원전화번호
    eryn number --응급실 운영여부 1=y, 2=n    
    eryynphone varchar2(20), --응급실 전화번호
    time varchar2(500), --병원 운영요일 및 시간
    Latitude VARCHAR2(50), --병원 위도
    longitude VARCHAR2(50) --병원 경도
);

CREATE TABLE weather (
    location varchar2(300) REFERENCES location, --현재위치 주소
	weather varchar2(20), --현재 날씨
    time date --현재 시간
);

/*운영시간
<dutyTime1c>1900</dutyTime1c> 월요일 종
<dutyTime1s>0900</dutyTime1s> 월요일 시
<dutyTime2c>1900</dutyTime2c> 화요일 종
<dutyTime2s>0900</dutyTime2s> 화요일 시
<dutyTime3c>1900</dutyTime3c> 수요일 종
<dutyTime3s>0900</dutyTime3s> 수요일 시
<dutyTime4c>1900</dutyTime4c> 목요일 종
<dutyTime4s>0900</dutyTime4s> 목요일 시
<dutyTime5c>1900</dutyTime5c> 금요일 종
<dutyTime5s>0900</dutyTime5s> 금요일 시
<dutyTime6c>1600</dutyTime6c> 토요일 종
<dutyTime6s>0900</dutyTime6s> 토요일 시
<dutyTime7c> 일요일 종
<dutyTime7s> 일요일 시
<dutyTime8c> 공휴일 종
<dutyTime8s> 공휴일 시
운영시간*/

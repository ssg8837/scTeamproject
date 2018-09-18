DROP TABLE BS_ALARM;
DROP SEQUENCE BS_ALARMSEQ;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from BS_ALARM;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
ALARMTITLE: 메모 | ALARMTYPE: 카테고리분류 |	ALARMDETAIL: 수유방향(모유,유축-오른쪽/왼쪽), 수유타입(젖병-분유/모유), 배소변 분류 | ALARMAMOUNT: 양(모유 젖병 이유식 유축) 

(ALARMTYPE)
모유		1	|	젖병		2	|	이유식	3	|	유축		4	|	배소변 	5	|	목욕		6	|	수면		7	|	기타		0

(ALARMDETAIL)
왼쪽		1	|	오른쪽	2	|	모유		3	|	분유		4	|	배변		5	|	소변		6
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE BS_ALARM (
	ALARMNO NUMBER PRIMARY KEY,
	USERNO NUMBER REFERENCES BS_USER(USERNO),
	BABYNO NUMBER REFERENCES BS_BABY(BABYNO), 
	ALARMTITLE VARCHAR2(100),
	ALARMTYPE INTEGER,
	ALARMDETAIL INTEGER,
	ALARMAMOUNT INTEGER, 
	ALARMTIME DATE,
	ENDTIME DATE
);

INSERT INTO BS_ALARM VALUES(0,0,41,'테스트일정',null,null,null,TO_DATE('2018-08-09/16:00:00','YYYY-MM-DD/HH24:MI:SS'),null);


CREATE SEQUENCE BS_ALARMSEQ;




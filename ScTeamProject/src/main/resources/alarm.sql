﻿DROP TABLE BS_ALARM;

CREATE TABLE BS_ALARM (ALARMNO INTEGER PRIMARY KEY, BABYNO INTEGER REFERENCES BS_BABY(BABYNO), ALARMTITLE VARCHAR2(100),ALARMTIME DATE);

INSERT INTO BS_ALARM VALUES(0,0,'테스트일정',TO_DATE('2018-08-09/16:00:00','YYYY-MM-DD/HH24:MI:SS'));

DROP SEQUENCS BS_ALARMSEQ;

CREATE SEQUENCE BS_ALARMSEQ;


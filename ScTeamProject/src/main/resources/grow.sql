DROP TABLE GROW;
DROP TABLE GROW_DEFAULT;
---------------------------------------------------------------------------------------------------------------------------------
select * from GROW;
select * from GROW_DEFAULT;

select * from grow where babyno=41
delete from grow where babyno=41 and babyage=24
---------------------------------------------------------------------------------------------------------------------------------
/*	[성장기록용 테이블]
 	아이 번호를 fk로 가져오고,
	BS_BABY 테이블에서 가져올 정보: 			유저넘버, 아이이름, 아이성별, 아이 생일
	사용자로부터 직접 입력받을 정보:			신장, 체중, 머리둘레
	받은 정보들을 이용해 계산 후 입력될 정보:	아이 나이(개월), 체질량지수(24개월 이후부터 계산), 입력받은 날짜(최근 갱신일 표시용)
	
	연령 계산 공식: 							만나이(개월) = ((측정년도-출생년도)×121))+(측정월-출생월)+((측정일-출생일)÷30.42))
	BMI 계산식 체질량지수(㎏/㎡): 			체중(㎏) ÷ 신장(㎝) ÷ 신장(㎝) × 10,000
*/
CREATE TABLE GROW(
    BABYNO			INTEGER,
    USERNO			INTEGER,
	BABYNAME 		VARCHAR2(30),
    BABYGENDER 		VARCHAR2(4),
	BABYBIRTH 		DATE,
	
	GROWHEIGHT		NUMBER,
	GROWWEIGHT		NUMBER,
	GROWHEAD		NUMBER,
	
	BABYAGE			NUMBER,
	GROWBMI			NUMBER,
	GROWREGDATE		DATE
);

---------------------------------------------------------------------------------------------------------------------------------
/*표준성장도표: 아이 성별,아이 나이(개월),신장,나이별 체중,머리둘레,체질량지수 */
CREATE TABLE GROW_DEFAULT(
	GENDER			VARCHAR2(4),
	AGE				NUMBER,
	HEIGHT			NUMBER,
	WEIGHT_A		NUMBER,
	HEAD			NUMBER,
	BMI				NUMBER
);

/* 소아 표준 성장도표 데이터 : 남아 ~23개월*/
INSERT ALL 
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 0, 49.9 , 3.3 , 34.5)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 1, 54.7 , 4.5 , 37.3)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 2, 58.4 , 5.6 , 39.1)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 3, 61.4 , 6.4 , 40.5)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 4, 63.9 , 7.0 , 41.6)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 5, 65.9 , 7.5 , 42.6)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 6, 67.6 , 7.9 , 43.3)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 7, 69.2 , 8.3 , 44.0)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 8, 70.6 , 8.6 , 44.5)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 9, 72.0 , 8.9 , 45.0)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 10, 73.3 , 9.2 , 45.4)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 11, 74.5 , 9.4 , 45.8)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 12, 75.7 , 9.6 , 46.1)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 13, 76.9 , 9.9 , 46.3)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 14, 78.0 , 10.1 , 46.6)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 15, 79.1 , 10.3 , 46.8)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 16, 80.2 , 10.5 , 47.0)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 17, 81.2 , 10.7 , 47.2)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 18, 82.3 , 10.9 , 47.4)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 19, 83.2 , 11.1 , 47.5)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 20, 84.2 , 11.3 , 47.7)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 21, 85.1 , 11.5 , 47.8)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 22, 86.0 , 11.8 , 48.0)
INTO GROW_DEFAULT (GENDER, AGE, HEIGHT, WEIGHT_A, HEAD) VALUES ('M', 23, 86.9 , 12.0 , 48.1)
SELECT * FROM DUAL;

/* 소아 표준 성장도표 데이터 : 남아 24개월~72개월*/
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 24, 87.1 , 12.2 , 48.3 , 16.0);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 25, 88.0 , 12.4 , 48.4 , 16.0);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 26, 88.8 , 12.5 , 48.5 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 27, 89.6 , 12.7 , 48.6 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 28, 90.4 , 12.9 , 48.7 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 29, 91.2 , 13.1 , 48.8 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 30, 91.9 , 13.3 , 48.9 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 31, 92.7 , 13.5 , 49.0 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 32, 93.4 , 13.7 , 49.1 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 33, 94.1 , 13.8 , 49.2 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 34, 94.8 , 14.0 , 49.3 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 35, 95.4 , 14.2 , 49.4 , 15.6);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 36, 96.5 , 14.7 , 49.8 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 37, 97.0 , 14.9 , 49.9 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 38, 97.6 , 15.1 , 50.0 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 39, 98.1 , 15.3 , 50.0 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 40, 98.7 , 15.4 , 50.1 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 41, 99.2 , 15.6 , 50.1 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 42, 99.8 , 15.8 , 50.2 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 43, 100.3 , 16.0 , 50.3 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 44, 100.9 , 16.1 , 50.3 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 45, 101.4 , 16.3 , 50.4 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 46, 102.0 , 16.5 , 50.4 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 47, 102.5 , 16.7 , 50.5 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 48, 103.1 , 16.8 , 50.5 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 49, 103.6 , 17.0 , 50.6 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 50, 104.2 , 17.2 , 50.6 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 51, 104.7 , 17.4 , 50.7 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 52, 105.3 , 17.5 , 50.7 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 53, 105.8 , 17.7 , 50.8 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 54, 106.3 , 17.9 , 50.8 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 55, 106.9 , 18.1 , 50.9 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 56, 107.4 , 18.2 , 50.9 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 57, 108.0 , 18.4 , 51.0 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 58, 108.5 , 18.6 , 51.0 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 59, 109.1 , 18.8 , 51.1 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 60, 109.6 , 19.0 , 51.1 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 61, 110.1 , 19.1 , 51.2 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 62, 110.7 , 19.3 , 51.2 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 63, 111.2 , 19.5 , 51.3 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 64, 111.7 , 19.7 , 51.3 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 65, 112.2 , 19.9 , 51.3 , 15.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 66, 112.8 , 20.1 , 51.4 , 16.0);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 67, 113.3 , 20.3 , 51.4 , 16.0);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 68, 113.8 , 20.5 , 51.5 , 16.0);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 69, 114.4 , 20.7 , 51.5 , 16.0);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 70, 114.9 , 20.9 , 51.6 , 16.0);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 71, 115.4 , 21.1 , 51.6 , 16.0);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('M', 72, 115.9 , 21.3 , 51.7 , 16.0);

/* 소아 표준 성장도표 데이터 : 여아 ~23개월*/
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 0, 49.1 , 3.2 , 33.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 1, 53.7 , 4.2 , 36.5);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 2, 57.1 , 5.1 , 38.3);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 3, 59.8 , 5.8 , 39.5);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 4, 62.1 , 6.4 , 40.6);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 5, 64.0 , 6.9 , 41.5);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 6, 65.7 , 7.3 , 42.2);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 7, 67.3 , 7.6 , 42.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 8, 68.7 , 7.9 , 43.4);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 9, 70.1 , 8.2 , 43.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 10, 71.5 , 8.5 , 44.2);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 11, 72.8 , 8.7 , 44.6);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 12, 74.0 , 8.9 , 44.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 13, 75.2 , 9.2 , 45.2);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 14, 76.4 , 9.4 , 45.4);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 15, 77.5 , 9.6 , 45.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 16, 78.6 , 9.8 , 45.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 17, 79.7 , 10.0 , 46.1);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 18, 80.7 , 10.2 , 46.2);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 19, 81.7 , 10.4 , 46.4);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 20, 82.7 , 10.6 , 46.6);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 21, 83.7 , 10.9 , 46.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 22, 84.6 , 11.1 , 46.9);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD) VALUES ('F', 23, 85.5 , 11.3 , 47.0);

/* 소아 표준 성장도표 데이터 : 여아 24개월~72개월*/
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 24, 85.7 , 11.5 , 47.2 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 25, 86.6 , 11.7 , 47.3 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 26, 87.4 , 11.9 , 47.5 , 15.6);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 27, 88.3 , 12.1 , 47.6 , 15.6);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 28, 89.1 , 12.3 , 47.7 , 15.6);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 29, 89.9 , 12.5 , 47.8 , 15.6);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 30, 90.7 , 12.7 , 47.9 , 15.5);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 31, 91.4 , 12.9 , 48.0 , 15.5);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 32, 92.2 , 13.1 , 48.1 , 15.5);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 33, 92.9 , 13.3 , 48.2 , 15.5);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 34, 93.6 , 13.5 , 48.3 , 15.4);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 35, 94.4 , 13.7 , 48.4 , 15.4);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 36, 95.4 , 14.2 , 48.8 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 37, 95.9 , 14.4 , 48.9 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 38, 96.5 , 14.5 , 49.0 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 39, 97.0 , 14.7 , 49.1 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 40, 97.6 , 14.9 , 49.1 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 41, 98.1 , 15.1 , 49.2 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 42, 98.6 , 15.2 , 49.3 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 43, 99.2 , 15.4 , 49.3 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 44, 99.7 , 15.6 , 49.4 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 45, 100.3 , 15.7 , 49.4 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 46, 100.8 , 15.9 , 49.5 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 47, 101.4 , 16.1 , 49.6 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 48, 101.9 , 16.3 , 49.6 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 49, 102.4 , 16.4 , 49.7 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 50, 103.0 , 16.6 , 49.7 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 51, 103.5 , 16.8 , 49.8 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 52, 104.1 , 17.0 , 49.8 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 53, 104.6 , 17.1 , 49.9 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 54, 105.1 , 17.3 , 49.9 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 55, 105.7 , 17.5 , 50.0 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 56, 106.2 , 17.7 , 50.0 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 57, 106.8 , 17.8 , 50.1 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 58, 107.3 , 18.0 , 50.1 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 59, 107.8 , 18.2 , 50.2 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 60, 108.4 , 18.4 , 50.2 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 61, 108.9 , 18.5 , 50.3 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 62, 109.4 , 18.7 , 50.3 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 63, 110.0 , 18.9 , 50.4 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 64, 110.5 , 19.1 , 50.4 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 65, 111.0 , 19.3 , 50.5 , 15.7);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 66, 111.6 , 19.5 , 50.6 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 67, 112.1 , 19.7 , 50.6 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 68, 112.6 , 19.9 , 50.7 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 69, 113.2 , 20.1 , 50.7 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 70, 113.7 , 20.2 , 50.8 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 71, 114.2 , 20.4 , 50.8 , 15.8);
INSERT INTO GROW_DEFAULT (GENDER,AGE,HEIGHT,WEIGHT_A,HEAD,BMI) VALUES ('F', 72, 114.7 , 20.7 , 50.9 , 15.8);

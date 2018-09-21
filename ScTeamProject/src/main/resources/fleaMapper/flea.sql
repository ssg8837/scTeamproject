drop table flea_reply;
drop table flea;
drop sequence flea_replySeq;
drop SEQUENCE fleaSeq;

create sequence fleaSeq;
create sequence flea_replySeq;

create table flea(
userNo INTEGER constraint flea_fk references BS_USER(USERNO) on delete cascade,
fleaNum number constraint flea_pk primary key,
fleaTitle varchar2(300) constraint flea_title_nn not null,
fleaText VARCHAR2(2000),
fleaSavedFile varchar(2000),
flearegdate date default sysdate,
hitcount number default 0
);

create table flea_reply(
fleaNum number constraint flea_reply_fk references flea(fleaNum) on delete cascade,
replynum number constraint flea_reply_pk primary key,
REPLYText VARCHAR2(2000),
replyregdate date default sysdate
);

select * from flea;
select * from flea_reply;

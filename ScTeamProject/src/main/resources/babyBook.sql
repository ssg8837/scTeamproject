DROP TABLE BABYBOOK;

create table babybook(
    boardnum number,
    userNO number,
    content varchar2(4000),
    regdate date,
    originalfile varchar2(100),
    savedfile varchar2(100)
);

DROP SEQUENCE babybook_seq;

        create sequence babybook_seq;
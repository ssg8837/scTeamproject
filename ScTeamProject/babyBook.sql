create table babybook(
    boardnum number,
    userid varchar2(50),
    title varchar2(100),
    content varchar2(4000),
    regdate date,
    originalfile varchar2(100),
    savedfile varchar2(100)
);

create sequence babybook_seq;
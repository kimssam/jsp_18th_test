-----------------------------------webmarket의 회원 테이블-----------------------------------------
create table w_member(
    id varchar2(30) not null unique,
    password VARCHAR2(20) not null,
    name VARCHAR2(30) not null,
    gender VARCHAR2(10),
    birth VARCHAR2(30),
    mail VARCHAR2(30),
    phone VARCHAR2(30),
    address VARCHAR2(100),
    regist_day date,
    mem_num number primary key,
    logtime date,
    updatetime date
);
drop table w_member;
--시퀀스 생성
create sequence seq_num nocycle nocache;
--데이터 저장
insert into w_member values('test','1234','김큐티','여','1980-05-05','cuty@gmail.com',
'010-1234-5678','서울시 강남구',sysdate,seq_num.nextval, sysdate, sysdate);

select * from w_member;
commit;
--데이터 수정
update w_member set mail='beatiful@gmail.com',updatetime=sysdate  where id='cuty1';
update w_member set name='김수정', birth='1990-02-15', mail=' update@gmail.com', 
phone='010-1111-2222', address='수정주소', updatetime=sysdate  where id='admin';
commit;
desc w_member;
drop sequence seq_num;

--회원정보 선택
select * from w_member where id='admin' and password='1234';
select * from w_member where id='admin';
commit;

--회원 삭제
delete from w_member where id='3';
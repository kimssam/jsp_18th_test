-----------------------------------webmarket의 게시판 테이블-----------------------------------------
create table w_board(
    board_seq number not null,--게시글 순번
    id varchar2(30) not null, --회원 아이디
    name varchar2(30) not null, --회원 이름
    title varchar2(200) not null, --게시글 제목
    contents varchar2(1000) not null, --게시글 내용
    hit number, --게시글 조회 수
    ip varchar2(30), --게시글 등록 ip
    logtime date default sysdate, --게시글 등록일자
    updatetime date default sysdate, --게시글 수정날짜
    primary key(board_seq)    
);
--시퀀스 생성
create sequence board_seq nocycle nocache;
drop sequence board_seq;

--데이터 저장
insert into w_board values(board_seq.nextval, 'cuty','김이름','오늘은 목요일','내용',0,'125.08.00.0',sysdate, sysdate);
select * from w_board;

--데이터 수정
update w_board set title='제목수정', updatetime=sysdate where id='cuty';
commit;

--데이터 삭제
delete w_board where id='cuty';
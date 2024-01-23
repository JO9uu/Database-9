use bookorder2;

insert into `user` values ('a101', '김유신', '김해');
insert into `user` values ('a102', '김춘추', '경주');
insert into `user` values ('a103', '장보고', '완도');
insert into `user` values ('a104', '강감찬', '서울');
insert into `user` values ('a105', '이순신', '서울');

insert into `userOrder` values ('10001', now(), 'a101');
insert into `userOrder` values ('10002', now(), 'a102');
insert into `userOrder` values ('10003', now(), 'a103');
insert into `userOrder` values ('10004', now(), 'a104');
insert into `userOrder` values ('10005', now(), 'a105');

insert into `order` values ('10001', '101', '1', '28000');
insert into `order` values ('10002', '101', '1', '28000');
insert into `order` values ('10002', '102', '2', '32000');
insert into `order` values ('10003', '102', '2', '32000');
insert into `order` values ('10004', '110', '1', '25000');
insert into `order` values ('10005', '110', '1', '25000');
insert into `order` values ('10005', '102', '1', '16000');

insert into `book` values ('101', '프로그래밍');
insert into `book` values ('102', '자료구조');
insert into `book` values ('110', '데이터베이스');


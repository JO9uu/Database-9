#날짜: 2024/01/02
#이름: 정원구
#내용: 1장 데이터베이스 생성과 사용자 관리

#실습 1-1
create database `studydb`;
drop database `studydb`;
#실습 1-2
create user 'jo9'@'%; identified by '1234';
grant all privileges on studydb.* to 'jo9'@'%';
fulsh privileges

#실습 1-3
alter user 'jo9'@'%' identified by '4321';
drop user 'jo9'@'%';
flush privileges;





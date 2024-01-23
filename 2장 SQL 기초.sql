# 제2장 SQL 기초
#날짜: 2024/01/02
#이름: 정원구
#내용: SQL 기초
use studydb;
#실습2-1
CREATE TABLE `User1` (
`uid`  varchar(10),
`name` varchar(10),
`hp`   char(13),
`age`  int
);


#실습2-2 데이터 추가

 INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
 INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
 INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
 INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
 INSERT INTO `User1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';


#실습2-3 데이터 조회

SELECT * FROM `User1`;
SELECT * FROM `User1` where `uid` = 'a101';
SELECT * FROM `User1` where `name` = '김춘추';
SELECT * FROM `User1` where `age` < 30;
SELECT * FROM `User1` where `age` >= 30;
SELECT `uid`, `name`, `age` from `user1`;

#실습2-4

update `user1` set	`hp` = '010-1234-4444' where	`uid` = 'a104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';

#실습2-5

DELETE FROM `User1` WHERE `uid`='A101';
delete from	`user1` where `uid`='a102' and	`age `='25';
delete	from	`user1`	where	`age` >= 30;

#실습2-6

alter table `user1` add `gender` tinyint;
alter table `user1` add `birth` char(10) after `name`;
alter table `user1` modify `gender` char(1);
alter table `user1` modify `age` tinyint;
alter table `user1` drop `gender`;

show tables;
select*from `user1`;

#실습2-7

create table `user1copy` like `user1`;
insert into `user1copy` select * from `user1`;

#실습2-8 아래와 같이 테이블을 생성 후 데이터를 입력하시오.

#회원테이블
create	table	`회원테이블(Tb1User)`(
`user id` varchar(10),
`user name` varchar(10),
`user hp` char(13),
`user age` char(10),
`user addr` text
);

drop table `회원테이블(tb1user)`;
select*from `회원테이블(Tb1User)`;
INSERT INTO `회원테이블(tb1user)` VALUES ('p101', '김유신', '010-1234-1001', '25', '경남 김해시');
INSERT INTO `회원테이블(tb1user)` VALUES ('p102', '김춘추', '010-1234-1002', '23', '경남 경주시');
INSERT INTO `회원테이블(tb1user)` VALUES ('p103', '장보고', 'null', '31', '전남 완도군');
INSERT INTO `회원테이블(tb1user)` VALUES ('p104', '강감찬', 'null', 'null', '서울 중구');
INSERT INTO `회원테이블(tb1user)` VALUES ('p105', '이순신', '010-1234-1005', '50', 'null');

#제품 테이블

create	table	`제품테이블(Tb1Produck)`(
`prod no` varchar(5),
`prod name` varchar(5),
`prod price` char(10),
`prod stock` char(5),
`prod company` varchar(5),
`prod date` char(11)
);
drop table `제품테이블(tb1produck)`;
INSERT INTO `제품테이블(tb1produck)` VALUES ('1001', '냉장고', '800,000', '25', 'LG전자', '2022-01-06');INSERT INTO `제품테이블(tb1produck)` VALUES ('1001', '냉장고', '800,000', '25', 'LG전자', '2022-01-06');
INSERT INTO `제품테이블(tb1produck)` VALUES ('1002', '노트북', '1,200,000', '120', '삼성전자', '2022-01-07');INSERT INTO `제품테이블(tb1produck)` VALUES ('1001', '냉장고', '800,000', '25', 'LG전자', '2022-01-06');
INSERT INTO `제품테이블(tb1produck)` VALUES ('1003', '모니터', '350,000', '35', 'LG전자', '2023-01-13');INSERT INTO `제품테이블(tb1produck)` VALUES ('1001', '냉장고', '800,000', '25', 'LG전자', '2022-01-06');
INSERT INTO `제품테이블(tb1produck)` VALUES ('1004', '세탁기', '1,000,000', '80', '삼성전자', '2021-01-01');INSERT INTO `제품테이블(tb1produck)` VALUES ('1001', '냉장고', '800,000', '25', 'LG전자', '2022-01-06');
INSERT INTO `제품테이블(tb1produck)` VALUES ('1005', '컴퓨터', '1,500,000', '20', '삼성전자', '2023-10-01');INSERT INTO `제품테이블(tb1produck)` VALUES ('1001', '냉장고', '800,000', '25', 'LG전자', '2022-01-06');
INSERT INTO `제품테이블(tb1produck)` VALUES ('1006', '휴대폰', '950,000', '102', 'null', 'null');INSERT INTO `제품테이블(tb1produck)` VALUES ('1001', '냉장고', '800,000', '25', 'LG전자', '2022-01-06');

#실습2-9. 아래 SQL을 실행하시오.

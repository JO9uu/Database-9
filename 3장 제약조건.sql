#날짜: 2024/01/03
#이름: 정원구
#내용: 3장 제약조건

#실습 3-1

create table `user2`(
		`uid` varchar(10) primary key,
		`name` varchar(10),
		`birth` char(10),
		`addr` varchar(50)
        );
        
drop table `user2`;
select*from `user2`;

#실습 3-2

INSERT INTO `User2` VALUES ('A101', '김유신', '1968-05-09', '경남 김해시');
INSERT INTO `User2` VALUES ('A102', '김춘추', '1972-11-23', '경남 경주시');
INSERT INTO `User2` VALUES ('A103', '장보고', '1978-03-01', '전남 완도군');
INSERT INTO `User2` VALUES ('A105', '강감찬', '1979-08-16', '서울 관악구');
INSERT INTO `User2` VALUES ('A106', '이순신', '1981-05-23', '부산 진구');

#실습 3-3

 create table `user3`(
		`uid` varchar(10) primary key,
		`name` varchar(10),
		`birth` char(10),
        `hp` char(13) unique,
		`addr` varchar(50)
        );
        
drop	table	user3;
INSERT INTO `User3` VALUES ('A101', '김유신', '1968-05-09', '010-1234-1111', '경남 김해시');
INSERT INTO `User3` VALUES ('A102', '김춘추', '1972-11-23', '010-1234-2222', '경남 경주시');
INSERT INTO `User3` VALUES ('A103', '장보고', '1978-03-01', '010-1234-3333','전남 완도군');
INSERT INTO `User3` VALUES ('A104', '강감찬', '1979-08-16', '010-1234-4444', '서울 관악구');
INSERT INTO `User3` VALUES ('A105', '이순신', '1981-05-23', '010-1234-5555', '부산 진구');
INSERT INTO `User3` VALUES ('A106', '안중근', '1981-05-21', 'null', '부산 북구');

#실습 3-4

create table `Parent`(
		`pid` varchar(10) primary key,
		`name` varchar(10),
		`hp` char(13) unique,
		`addr` varchar(100)
        );
        
       
create table `Child`(
		`cid` varchar(10) primary key,
		`name` varchar(10),
		`hp` char(13) unique,
		`parent` varchar(10),
        foreign key (`Parent`) references `Parent` (`pid`)
        );
        
        drop table `Parent`;
        drop table `Child`;

INSERT INTO `Parent` VALUES ('p101', '김유신', '1968-05-09', '경남 김해시');
INSERT INTO `parent` VALUES ('p102', '김춘추', '1972-11-23', '경남 경주시');
INSERT INTO `parent` VALUES ('p103', '장보고', '1978-03-01', '전남 완도군');
INSERT INTO `parent` VALUES ('p104', '강감찬', '1979-08-16', '서울 관악구');
INSERT INTO `parent` VALUES ('p105', '이순신', '1981-05-23', '부산 진구');


INSERT INTO `Child` VALUES ('c101', '김철수', '010-1234-1111', 'p101');
INSERT INTO `Child` VALUES ('c102', '김영희', '010-1234-2222', 'p102');
INSERT INTO `Child` VALUES ('c103', '강철수', '010-1234-3333', 'p103');
INSERT INTO `Child` VALUES ('c104', '이철수', '010-1234-4444', 'p107');
        select*from `Parent`;
        select*from `Child`;
                
#실습 3-5

create table `user4`(
`uid` varchar(10) primary key,
`name` varchar(10) not null,
`gender` char(1),
`age` int default 1, 
`hp` char(13) unique,
`addr` varchar(20)
);

insert into `user4` values ('A101', '김유신', 'M', '25', '010-1234-1111', '경남 김해시');
insert into `user4` values ('A102', '김춘추', 'M', '25', '010-1234-2222', '경남 경주시');
insert into `user4` values ('A103', '장보고', 'M', '25', '010-1234-3333', '전남 완도시');
insert into `user4` values ('A104', '강감찬', 'M', '25', '010-1234-4444', '서울 관악구');
insert into `user4` (`uid`, `name`, `gender`, `hp`, `addr`)
              values ('A105', '이순신', 'M', '010-1234-5555', '부산 진구');
insert into `user4` values ('A106', '신사임당', 'F', '25', null, '강릉시');
insert into `user4` values ('A107', '허난설헌', 'F', '25', null, '경기도 광주');

select * from `user4`;

#실습 3-6

CREATE TABLE `user5` (
    `seq` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL,
    `gender` CHAR(1) CHECK (`gender` IN ('m', 'f')),
    `age` INT DEFAULT 1,
    `addr` VARCHAR(20),
    CHECK (`age` > 0 AND `age` < 100)
);

INSERT INTO `user5` (`name`, `gender`, `age`, `addr`) VALUES ('김유신', 'M', '25', '경남 김해시');
insert into `user5` (`name`, `gender`, `age`, `addr`)values ('김춘추', 'M', '23',  '경남 김해시');
insert into `user5` (`name`, `gender`, `age`, `addr`)values ('장보고', 'M', '35',  '경남 김해시');
insert into `user5` (`name`, `gender`, `age`, `addr`)values ('강감찬', 'M', '42', '경남 김해시');
insert into `user5` (`name`, `gender`, `age`, `addr`)values ('이순신', 'A', '51', '경남 김해시');
insert into `user5` (`name`, `gender`, `age`, `addr`)values ('신사임당', 'F', '-5', '경남 김해시');



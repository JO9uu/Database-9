#날짜 : 2024/01/10
#이름 : 정원구
#내용 : SQL 연습문제3

#실습 3-1
CREATE DATABASE `College`;
CREATE USER 'college'@'%' identified by '1234';
GRANT ALL PRIVILEGES ON `College`.* TO 'college'@'%';
GRANT ALL PRIVILEGES ON `College`.* TO 'chhak'@'%';
FLUSH privileges;

#실습3-2
CREATE TABLE `Student` (
	`stdNo`		CHAR(8) PRIMARY KEY,
	`stdName`	VARCHAR(20) NOT NULL,
	`stdHp`		CHAR(13) NOT NULL,
	`stdYear`	TINYINT NOT NULL,
	`stdAddress` VARCHAR(100)
);

CREATE TABLE `Lecture` (
	`lecNo`		INT PRIMARY KEY,
	`lecName`	VARCHAR(20) NOT NULL,
	`lecCredit`	TINYINT NOT NULL,
	`lecTime`	INT NOT NULL,
	`lecClass`	VARCHAR(10) DEFAULT NULL
);

CREATE TABLE `Register` (
	`regStdNo`			CHAR(8),
	`regLecNo`			INT,
	`regMidScore`		TINYINT,
	`regFinalScore`	TINYINT,
	`regTotalScore`	TINYINT,
	`regGrade`			CHAR(1)
);
use college;
#실습3-3
INSERT INTO `Student` VALUES ('20201016', '김유신', '010-1234-1001', 3, NULL);
INSERT INTO `Student` VALUES ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
INSERT INTO `Student` VALUES ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
INSERT INTO `Student` VALUES ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
INSERT INTO `Student` VALUES ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
INSERT INTO `Student` VALUES ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO `Lecture` VALUES (159, '인지행동심리학', 3, 40, '본304');
INSERT INTO `Lecture` VALUES (167, '운영체제론', 3, 25, '본B05');
INSERT INTO `Lecture` VALUES (234, '무역영문', 3, 20, '본201');
INSERT INTO `Lecture` VALUES (239, '세법개론', 3, 40, '본204');
INSERT INTO `Lecture` VALUES (248, '빅데이터 개론', 3, 20, '본B01');
INSERT INTO `Lecture` VALUES (253, '컴퓨팅사고와 코딩', 2, 10, '본B02');
INSERT INTO `Lecture` VALUES (349, '사회복지 마케팅', 2, 50, '본301');

INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 234);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 248);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 253);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 239);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210216', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210326', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 167);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20220416', 349);

#실습 3-4
SELECT * from `Lecture`;

#실습 3-5
SELECT * from Student;

#실습 3-6
SELECT * from `Register`;

#실습 3-7
SELECT * FROM `Student` where `stdYear`=3;

#실습 3-8
SELECT * FROM `Lecture` where `lecCredit` = 2;

#실습 3-9
update `Register` set `regMidScore` = 36, `regFinalScore`= 42 WHERE `regStdNo`='20201126' AND `regLecNo`=234;
update `Register` set `regMidScore` = 24, `regFinalScore`= 62 WHERE `regStdNo`='20201016' AND `regLecNo`=248;
update `Register` set `regMidScore` = 28, `regFinalScore`= 40 WHERE `regStdNo`='20201016' AND `regLecNo`=253;
update `Register` set `regMidScore` = 37, `regFinalScore`= 57 WHERE `regStdNo`='20201126' AND `regLecNo`=239;
update `Register` set `regMidScore` = 28, `regFinalScore`= 68 WHERE `regStdNo`='20210216' AND `regLecNo`=349;
update `Register` set `regMidScore` = 16, `regFinalScore`= 65 WHERE `regStdNo`='20210326' AND `regLecNo`=349;
update `Register` set `regMidScore` = 18, `regFinalScore`= 38 WHERE `regStdNo`='20201016' AND `regLecNo`=167;
update `Register` set  `regMidScore` = 25, `regFinalScore`= 58 WHERE `regStdNo`='20220416' AND `regLecNo`=349;

SELECT * FROM `Register`;

#실습 3-10
update `Register` set
							`regTotalScore`= `regMidScore` + `regFinalScore`,
							`regGrade` = if(`regTotalScore` >= 90, 'A', 
  										 	 if(`regTotalScore` >= 80, 'B',
											 if(`regTotalScore` >= 70, 'C',
											 if(`regTotalScore` >= 60, 'D', 'F'))));						

SELECT * FROM `Register`;

#실습 3-11
SELECT * FROM `Register` order by `regTotalScore` desc;

#실습 3-12
SELECT * FROM `Register` where `regLecNo`=349 order by `regTotalScore` desc;

#실습 3-13
SELECT * FROM `Lecture` where `lecTime` >= 30;

#실습 3-14
SELECT `lecName`, `lecClass` from `Lecture`;

#실습 3-15
SELECT  `stdNo`, `stdName` from `Student`;

#실습 3-16
SELECT * FROM `Student` where `stdAddress` is null;

#실습 3-17
SELECT * FROM `Student` where `stdAddress` like '부산%';

#실습 3-18
SELECT * 
FROM `Student` AS a 
left join `Register` AS b 
ON a.stdNo = b.regStdNo;

#실습 3-19
SELECT 
	`stdNo`,
	`stdName`,
	`regLecNo`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a, `Register` AS b WHERE a.stdNo = b.regStdNo;

#실습 3-20
SELECT `stdName`, `stdNo`, `regLecNo`
FROM `Student` AS a
JOIN `Register` AS b 
ON a.stdNo = b.regStdNo
WHERE `regLecNo`=349;

#실습 3-21
SELECT
	`stdNo`,
	`stdName`,
	COUNT(`stdNo`) AS `수강신청 건수`,
	SUM(`regTotalScore`) AS `종합점수`,
	SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`	
FROM `Student` AS a
JOIN `Register` AS b 
ON a.stdNo = b.regStdNo
group by `stdNo` order by `stdNo`;

#실습 3-22
SELECT * FROM `Register` AS a
Join `Lecture` as b
ON a.regLecNo = b.lecNo;

#실습 3-23 아래와 같이 조회
select
	`regStdNo`,
    `regLecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `register` as a join `lecture` as b on a.regLecNo = b.lecNo;

#실습 3-24 `사회복지 마케팅` 강좌를 신청한 건수와 평균을 조회
select
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
From `Register` as a join `Lecture` as b
on a.regLecNo = b.lecNo where `lecName` = '사회복지 마케팅';
    
#실습 3-25 'A' 등급을 받은 학번과 강좌명 조회
select
	`regStdNo`,
    `lecName`
from `register` as a join `lecture` as b on a.regLecNo = b.lecNo
where `regGrade` = 'A';

#실습 3-26 학생테이블 수강테이블 그리고 강좌 테이블을 결합
select*from `Student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo;

#실습 3-27 아래와 같이 조회
select
	`stdNO`, `stdName`, 
    `lecNo`, `lecName`,
    `regMidScore`, `regFinalScore`,
    `regTotalScore`, `regGrade`
from `Student` as a 
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c on b.regLecNo = c.lecNo
ORDER BY `regGrade` ASC, `regFinalScore` DESC;

#실습 3-28 `F` 학점을 받은 학번과 이름, 수강과목명, 점수 그리고 등급을 조회하시오.
select
	`stdNo`,
    `stdName`,
    `lecName`,
    `regTotalScore`,
    `regGrade`
From `Student` as a 
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c on b.regLecNo = c.lecNo
where `regGrade`='F';

#실습 3-29
SELECT 
	`stdNo`,
	`stdName`,
	SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c on b.regLecNo = c.lecNo
where `regGrade` != 'F'
group by `stdNo`
order by `stdNo` ASC;

#실습 3-30
SELECT 
	`stdNo`,
	`stdName`,
	GROUP_CONCAT(`lecName`) AS `신청과목`,
	GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c on b.regLecNo = c.lecNo
group by `stdNo`;

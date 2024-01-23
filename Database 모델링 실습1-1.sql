# 학생 데이터 삽입
insert into `students` values ('20101001', '정우성', '760121-1234567', '010-1101-7601', null ,'서울', 'P10101', '10');
insert into `students` values ('20101002', '이정재', '750611-1234567', '010-1102-7506', null ,'서울', 'P10101', '10');
insert into `students` values ('20111011', '전지현', '890530-1234567', '010-1103-8905', 'jjh@naver.com','대전', 'P11103', '11');
insert into `students` values ('20111013', '이나영', '790413-1234567', '010-2101-7904', 'lee@naver.com', '대전','P11103', '11');
insert into `students` values ('20111014', '원빈', '660912-1234567', '010-2104-6609', 'one@daum.net','대전', 'P11104', '11');
insert into `students` values ('21221010', '장동건', '790728-1234567', '010-3101-7907', 'jang@naver.com','대구', 'P22110', '22');
insert into `students` values ('21231002', '고소영', '840615-1234567', '010-4101-8406', 'goso@daum.net','대구', 'P23102', '23');
insert into `students` values ('22311011', '김연아', '651021-1234567', '010-5101-6510', 'yuna@daum.net','대구', 'P31104', '31');
insert into `students` values ('22311014', '유재석', '721128-1234567', '010-6101-7211', '-','부산', 'P31104', '31');
insert into `students` values ('22401001', '강호동', '920907-1234567', '010-7103-9209', null ,'부산', 'P40101', '40');
insert into `students` values ('22401002', '조인성', '891209-1234567', '010-7104-8912', 'join@gmail.com','광주', 'P40101', '40');
insert into `students` values ('22421003', '강동원', '770314-1234567', '010-8101-7703', 'dong@naver.com','광주', 'P42103', '42');

#교수 데이터 삽입 번호/이름/주민/이멜/폰/주소/학과번호
insert into `Professors` values ('P10101', '김유신', '750120-1234567', 'kimys@hg.ac.kr', '010-1101-1976', '서울', '10');
insert into `Professors` values ('P10102', '계백', '740610-1234567', 'gaeback@hg.ac.kr', '010-1102-1975', '서울', '10');
insert into `Professors` values ('P11101', '김관창', '880529-1234567', 'kwanch@hg.ac.kr', '010-1103-1989', '대전', '11');
insert into `Professors` values ('P11103', '김춘추', '780412-1234567', 'kimcc@hg.ac.kr', '010-2101-1979', '대전', '11');
insert into `Professors` values ('P11104', '이사부', '650911-1234567', 'leesabu@hg.ac.kr', '010-2104-1996', '대전', '11');
insert into `Professors` values ('P22110', '장보고', '780727-1234567', 'jangbg@hg.ac.kr', '010-3101-1979', '대구', '22');
insert into `Professors` values ('P23102', '선덕여왕', '830614-1234567', 'gueen@hg.ac.kr', '010-4101-1984', '대구', '23');
insert into `Professors` values ('P31101', '강감찬', '641020-1234567', 'kang@hg.ac.kr', '010-5101-1965', '대구', '31');
insert into `Professors` values ('P31104', '신사임당', '711127-1234567', 'sinsa@hg.ac.kr', '010-6101-1972', '부산', '31');
insert into `Professors` values ('P40101', '이이', '910906-1234567', 'leelee@hg.ac.kr', '010-7103-1992', '부산', '40');
insert into `Professors` values ('P40102', '이황', '881208-1234567', 'hwang@hg.ac.kr', '010-7104-1989', '광주', '40');
insert into `Professors` values ('P42103', '송상현', '760313-1234567', 'ssh@hg.ac.kr', '010-8101-1977', '광주', '42');

#학과 데이터 삽입
insert into `Departments` values ('10', '국어국문학과', '051-510-1010');
insert into `Departments` values ('11', '영어영문학과', '051-510-1011');
insert into `Departments` values ('20', '경영학과', '051-510-1020');
insert into `Departments` values ('21', '경제학과', '051-510-1021');
insert into `Departments` values ('22', '정치외교학과', '051-510-1022');
insert into `Departments` values ('23', '사회복지학과', '051-510-1023');
insert into `Departments` values ('30', '수학과', '051-510-1030');
insert into `Departments` values ('31', '통계학과', '051-510-1031');
insert into `Departments` values ('32', '생명과학과', '051-510-1032');
insert into `Departments` values ('40', '기계공학과', '051-510-1040');
insert into `Departments` values ('41', '전자공학과', '051-510-1041');
insert into `Departments` values ('42', '컴퓨터공학과', '051-510-1042');

#강좌 데이터 삽입
insert into `Lectures` values ('101001', 'P10101', '대학 글쓰기', '2', '10', '본102');
insert into `Lectures` values ('101002', 'P10102', '한국어음운론', '3', '30', '본102');
insert into `Lectures` values ('101003', 'P10102', '한국현대문학사', '3', '30', '본103');
insert into `Lectures` values ('111011', 'P11103', '중세영문학', '3', '25', '본201');
insert into `Lectures` values ('111012', 'P11104', '영미시', '3', '25', '본201');
insert into `Lectures` values ('231110', 'P23102', '사회복지학개론', '1', '8', '별관103');
insert into `Lectures` values ('311002', 'P31101', '통계학의 이해', '2', '16', '별관303');
insert into `Lectures` values ('311003', 'P31104', '기초통계학', '3', '26', '별관303');
insert into `Lectures` values ('401019', 'P40101', '기계역학', '3', '36', '공학관 102');
insert into `Lectures` values ('421012', 'P42103', '데이터베이스', '3', '32', '공학관 103');

#수강 데이터 삽입
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('20101001', '101001', 'P10101');
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('20101001', '101002', 'P10102');
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('20111013', '111011', 'P11103');
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('21231002', '231110', 'P23102');
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('22401001', '401019', 'P40101');
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('22401001', '421012', 'P42103');
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('20101001', '101003', 'P10102');
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('22421003', '311003', 'P31104');
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('22421003', '421012', 'P42103');
insert into `Register` (  `stdNo`, `lecNo`, `proNo`) values ('20111013', '111012', 'P11104');

#5.SQL
#문제1 모든 학생의 학생번호, 이름, 휴대폰, 학과번호, 학과명 조회

select 
`stdNo`, 
`stdName`, 
`stdHp`, 
a.`depNo` 
#백틱(``)은 전체를 묶는 용도
from `students` as a
join `departments` as b on a.depNo = b.depNo;

#문제2 모든 교수의 교수번호, 이름, 휴대폰, 학과번호, 학과명을 조회
select `proNo`,
`proName`,
`proHp`,
a.depNo,
`depName`
from `professors` as a
join `departments` as b on a.depNo = b.depNo;

#문제3 모든 강좌의 강좌번호, 강좌명, 담당교수명, 휴대폰을 조회
select 
`lecNo`, `lecName`,
`proName`, `proHp` 
from `lectures`as a, `professors` as b 
where a.`proNo` = b.`proNo`;

select `lecNo`,
`lecName`,
`proName`,
`proHp`
from `lectures` as a 
join `professors` as b on a.proNo = b.proNo;

#문제4 모든 강좌의 강좌번호, 강좌명, 담당교수번호, 담당교수명, 휴대폰, 학과번호, 학과명을 조회
select `lecNo`, `lecName`,
b.`proNo`, `proName`, `proHp`,
c.`depNo`, `depName`
from `lectures` as a
join `professors` as b on a.proNo = b.proNo 
join `departments` as c on b.depNo = c.depNo;

select 
`lecNo`, `lecName`,
b.`proNo`, `proName`, `proHp`,
c.`depNo`, `depName`
from
	`Lectures` as a,
    `Professors` as b,
    `Departments` as c
where
	a.`proNo` = b.`proNo` and
    b.`depNo` = c.`depNo`;

#문제5 모든 수강 내역에서 학생번호, 학생명, 강좌번호, 강좌명, 교수번호, 교수명 조회
select
`stdNo`, `stdName`,
`lecNo`, `lecName`,
c.`proNo`, `proName`
from `lectures` as a
join `professors` as b on a.proNo = b.proNo
join `students` as c on b.proNo = c.proNo;

#문제6 수강 테이블에 출석점수, 중간고사 점수, 기말고사 점수를 임의로 입력
# update `register` set `regAttenScore` = ceil(rand()* 100), `regMidScore` = ceil(rand()*100), `regFinalScore = ceil(rand()*100);`
update `Register` set `regAttenScore` = '41', `regMidScore` = '85', `regFinalScore` = '91' where `lecNo` = '101001'; 
update `Register` set `regAttenScore` = '45', `regMidScore` = '05', `regFinalScore` = '51' where `lecNo` = '101002'; 
update `Register` set `regAttenScore` = '50', `regMidScore` = '15', `regFinalScore` = '96' where `lecNo` = '111011'; 
update `Register` set `regAttenScore` = '55', `regMidScore` = '25', `regFinalScore` = '97' where `lecNo` = '231110'; 
update `Register` set `regAttenScore` = '60', `regMidScore` = '35', `regFinalScore` = '11' where `lecNo` = '401019'; 
update `Register` set `regAttenScore` = '65', `regMidScore` = '45', `regFinalScore` = '21' where `lecNo` = '421012'; 
update `Register` set `regAttenScore` = '70', `regMidScore` = '55', `regFinalScore` = '31' where `lecNo` = '101003'; 
update `Register` set `regAttenScore` = '75', `regMidScore` = '95', `regFinalScore` = '41' where `lecNo` = '311003'; 
update `Register` set `regAttenScore` = '80', `regMidScore` = '85', `regFinalScore` = '96' where `lecNo` = '421012'; 
update `Register` set `regAttenScore` = '60', `regMidScore` = '75', `regFinalScore` = '86' where `lecNo` = '111012'; 

#문제7 수강 테이블에 출석, 중간, 기말을 더하여 평균을 구해 총점에 입력
update `register` set
					`regTotal` = (`regAttenScore` + `regMidScore` + `regFinalScore`) / 3;

#문제8 수강 테이블에 등급을 입력핫쇼
update `register` set
					`regGrade` = if(`regTotal` >= 90, 'A',
									if(`regTotal` >= 80, 'B',
                                    if(`regTotal` >= 70, 'C',
                                    if(`regTotal` >= 60, 'D', 'F'))));
                                    
#문제9 수강 테이블에서 총점 가장 큰 점수 조회
select * from `register` order by `regTotal` desc limit  1;

#문제10 정우성 학생의 총점 평균을 구하시오
select	
	avg(`regTotal`) as `총점 평균`
from `register` as a
join `students` as b on a.stdNO = b.stdNO
where `stdName` = '정우성';

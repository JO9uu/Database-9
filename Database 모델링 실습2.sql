-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hospital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hospital` DEFAULT CHARACTER SET utf8 ;
USE `Hospital` ;

-- -----------------------------------------------------
-- Table `Hospital`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Departments` (
  `dep_no` CHAR(3) NOT NULL,
  `dep_name` VARCHAR(20) NOT NULL,
  `dep_manager` VARCHAR(20) NOT NULL,
  `dep_tel` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`dep_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Doctors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Doctors` (
  `doc_id` CHAR(7) NOT NULL,
  `doc_name` VARCHAR(45) NOT NULL,
  `doc_birth` CHAR(10) NOT NULL,
  `doc_gen` CHAR(1) NOT NULL,
  `dep_no` CHAR(3) NOT NULL,
  `doc_pos` VARCHAR(45) NOT NULL,
  `doc_phone` VARCHAR(20) NOT NULL,
  `doc_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE INDEX `doc_email_UNIQUE` (`doc_email` ASC) VISIBLE,
  UNIQUE INDEX `doc_phone_UNIQUE` (`doc_phone` ASC) VISIBLE,
  INDEX `fk_Doctors_Departments1_idx` (`dep_no` ASC) VISIBLE,
  CONSTRAINT `fk_Doctors_Departments1`
    FOREIGN KEY (`dep_no`)
    REFERENCES `Hospital`.`Departments` (`dep_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Nurses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Nurses` (
  `nur_id` CHAR(7) NOT NULL,
  `nur_name` VARCHAR(45) NOT NULL,
  `nur_birth` CHAR(10) NOT NULL,
  `nur_gender` CHAR(1) NOT NULL,
  `dep_no` CHAR(3) NOT NULL,
  `nur_pos` VARCHAR(45) NOT NULL,
  `nur_phone` CHAR(13) NOT NULL,
  `nur_email` VARCHAR(45) NULL,
  PRIMARY KEY (`nur_id`),
  UNIQUE INDEX `nur_email_UNIQUE` (`nur_email` ASC) VISIBLE,
  INDEX `fk_Nurses_Departments_idx` (`dep_no` ASC) VISIBLE,
  CONSTRAINT `fk_Nurses_Departments`
    FOREIGN KEY (`dep_no`)
    REFERENCES `Hospital`.`Departments` (`dep_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Patients` (
  `pat_id` CHAR(7) NOT NULL,
  `doc_id` CHAR(7) NOT NULL,
  `nur_id` CHAR(7) NOT NULL,
  `pat_name` VARCHAR(45) NOT NULL,
  `pat_jumin` CHAR(14) NOT NULL,
  `pat_gen` CHAR(1) NOT NULL,
  `pat_addr` VARCHAR(100) NOT NULL,
  `pat_phone` VARCHAR(45) NOT NULL,
  `pat_email` VARCHAR(45) NULL,
  `pat_job` VARCHAR(45) NULL,
  PRIMARY KEY (`pat_id`),
  UNIQUE INDEX `pat_jumin_UNIQUE` (`pat_jumin` ASC) VISIBLE,
  UNIQUE INDEX `pat_phone_UNIQUE` (`pat_phone` ASC) VISIBLE,
  UNIQUE INDEX `pat_email_UNIQUE` (`pat_email` ASC) VISIBLE,
  INDEX `fk_Patients_Nurses1_idx` (`nur_id` ASC) VISIBLE,
  INDEX `fk_Patients_Doctors1_idx` (`doc_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patients_Nurses1`
    FOREIGN KEY (`nur_id`)
    REFERENCES `Hospital`.`Nurses` (`nur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patients_Doctors1`
    FOREIGN KEY (`doc_id`)
    REFERENCES `Hospital`.`Doctors` (`doc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Treatments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Treatments` (
  `treat_no` INT NOT NULL,
  `doc_id` CHAR(7) NOT NULL,
  `pat_id` CHAR(7) NOT NULL,
  `treat_contents` VARCHAR(255) NOT NULL,
  `treat_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`treat_no`, `doc_id`, `pat_id`),
  INDEX `fk_Treatments_Doctors1_idx` (`doc_id` ASC) VISIBLE,
  INDEX `fk_Treatments_Patients1_idx` (`pat_id` ASC) VISIBLE,
  CONSTRAINT `fk_Treatments_Doctors1`
    FOREIGN KEY (`doc_id`)
    REFERENCES `Hospital`.`Doctors` (`doc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Treatments_Patients1`
    FOREIGN KEY (`pat_id`)
    REFERENCES `Hospital`.`Patients` (`pat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Physical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Charts` (
  `chart_id` CHAR(8) NOT NULL,
  `treat_no` INT NOT NULL,
  `doc_id` CHAR(7) NOT NULL,
  `pat_id` CHAR(7) NOT NULL,
  `chart_contents` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`chart_id`, `treat_no`, `doc_id`, `pat_id`),
  INDEX `fk_Physical_Treatments1_idx` (`treat_no` ASC, `doc_id` ASC, `pat_id` ASC) VISIBLE,
  CONSTRAINT `fk_Physical_Treatments1`
    FOREIGN KEY (`treat_no` , `doc_id` , `pat_id`)
    REFERENCES `Hospital`.`Treatments` (`treat_no` , `doc_id` , `pat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use hospital;

#데이터 삽입 departments
insert into `departments` values ('101', '소아과', '김유신', '051-123-0101');
insert into `departments` values ('102', '내과', '김춘추', '051-123-0102');
insert into `departments` values ('103', '외과', '장보고', '051-123-0103');
insert into `departments` values ('104', '피부과', '선덕여왕', '051-123-0104');
insert into `departments` values ('105', '이비인후과', '강감찬', '051-123-0105');
insert into `departments` values ('106', '산부인과', '신사임당', '051-123-0106');
insert into `departments` values ('107', '흉부외과', '류성룡', '051-123-0107');
insert into `departments` values ('108', '정형외과', '송상현', '051-123-0108');
insert into `departments` values ('109', '신경외과', '이순신', '051-123-0109');
insert into `departments` values ('110', '비뇨기과', '정약용', '051-123-0110');
insert into `departments` values ('111', '안과', '박지원', '051-123-0111');
insert into `departments` values ('112', '치과', '전봉준', '051-123-0112');

#데이터 삽입 doctors
insert into `doctors` values ('D101101', '김유신', '1976-01-21', 'M', '101', '과장', '010-1101-1976', 'kimys@bw.com');
insert into `doctors` values ('D101102', '계백', '1975-06-11', 'M', '101', '전문의', '010-1102-1975', 'gaeback@bw.com');
insert into `doctors` values ('D101103', '김관창', '1989-05-30', 'M', '101', '전문의', '010-1103-1989', 'kwanch@bw.com');
insert into `doctors` values ('D102101', '김춘추', '1979-04-13', 'M', '102', '과장', '010-2101-1979', 'kimcc@bw.com');
insert into `doctors` values ('D102104', '이사부', '1966-09-12', 'M', '102', '전문의', '010-2104-1966', 'leesabu@bw.com');
insert into `doctors` values ('D103101', '장보고', '1979-07-28', 'M', '103', '과장', '010-3101-1979', 'jangbg@bw.com');
insert into `doctors` values ('D104101', '선덕여왕', '1984-06-15', 'F', '104', '과장', '010-4101-1984', 'gueen@bw.com');
insert into `doctors` values ('D105101', '강감찬', '1965-10-21', 'M', '105', '과장', '010-5101-1965', 'kang@bw.com');
insert into `doctors` values ('D106101', '신사임당', '1972-11-28', 'F', '106', '과장', '010-6101-1972', 'sinsa@bw.com');
insert into `doctors` values ('D107103', '이이', '1992-09-07', 'M', '107', '전문의', '010-7103-1992', 'leelee@bw.com');
insert into `doctors` values ('D107104', '이황', '1989-12-09', 'M', '107', '전문의', '010-7104-1989', 'hwang@bw.com');
insert into `doctors` values ('D108101', '송상현', '1977-03-14', 'M', '108', '과장', '010-8101-1977', 'ssh@bw.com');

#데이터 삽입 patients
insert into `patients` values ('P102101', 'D102101', 'N102101', '정우성', '760121-1234567', 'M', '서울', '010-1101-7601', NULL, '배우');
insert into `patients` values ('P103101', 'D103101', 'N103101', '이정재', '750611-1234567', 'M', '서울', '010-1102-7506', NULL, '배우');
insert into `patients` values ('P102102', 'D102104', 'N102103', '전지현', '890530-1234567', 'F', '대전', '010-1103-8905', 'jjh@naver.com', '자영업');
insert into `patients` values ('P104101', 'D104101', 'N104101', '이나영', '790413-1234567', 'F', '대전', '010-2101-7904', 'lee@naver.com', '회사원');
insert into `patients` values ('P105101', 'D105101', 'N105101', '원빈', '660912-1234567', 'M', '대전', '010-2104-6609', 'one@daum.net', '배우');
insert into `patients` values ('P103102', 'D103101', 'N103101', '장동건', '790728-1234567', 'M', '대구', '010-3101-7907', 'jang@naver.com', '배우');
insert into `patients` values ('P104102', 'D104101', 'N104101', '고소영', '840615-1234567', 'F', '대구', '010-4101-8406', 'goso@daum.net', '회사원');
insert into `patients` values ('P108101', 'D108101', 'N108101', '김연아', '651021-1234567', 'F', '대구', '010-5101-6510', 'yuna@daum.net', '운동선수');
insert into `patients` values ('P102103', 'D102104', 'N102102', '유재석', '721128-1234567', 'M', '부산', '010-6101-7211', NULL, '개그맨');
insert into `patients` values ('P107101', 'D107104', 'N107101', '강호동', '920907-1234567', 'M', '부산', '010-7103-9209', NULL, '개그맨');
insert into `patients` values ('P105102', 'D105101', 'N105101', '조인성', '891209-1234567', 'M', '광주', '010-7104-8912', 'join@gmail.com', '배우');
insert into `patients` values ('P104103', 'D104101', 'N104101', '강동원', '771314-1234567', 'M', '광주', '010-8101-7703', 'dong@naver.com', '배우');

#데이터 삽입 nurse
insert into `nurses` values ('N101101', '송승헌', '1976-02-21', 'M', '101', '수간호사', '010-1101-7602', 'ssh@bw.com');
insert into `nurses` values ('N102101', '이영애', '1975-07-11', 'F', '102', '수간호사', '010-1102-7507', 'yung@bw.com');
insert into `nurses` values ('N102102', '엄정화', '1989-06-30', 'F', '102', '주임', '010-1103-8906', 'um@bw.com');
insert into `nurses` values ('N102103', '박명수', '1979-05-13', 'M', '102', '주임', '010-2101-7905', 'park@bw.com');
insert into `nurses` values ('N103101', '정준하', '1966-10-12', 'M', '103', '주임', '010-2104-6610', 'jung@bw.com');
insert into `nurses` values ('N104101', '김태희', '1979-08-28', 'F', '104', '주임', '010-3101-7908', 'taeh@bw.com');
insert into `nurses` values ('N105101', '송혜교', '1984-07-15', 'F', '105', '주임', '010-4101-8407', 'song@bw.com');
insert into `nurses` values ('N106101', '공유', '1965-11-21', 'M', '106', '간호사', '010-5101-6511', 'gong@bw.com');
insert into `nurses` values ('N107101', '이병헌', '1972-12-28', 'M', '107', '간호사', '010-6101-7212', 'byung@bw.com');
insert into `nurses` values ('N108101', '송중기', '1992-10-07', 'M', '108', '간호사', '010-7103-9210', 'jungi@bw.com');

#데이터 삽입 treatments
insert into `Treatments` values ('1021001', 'D102101', 'P102101', '감기, 몸살', now());
insert into `Treatments` values ('1031002', 'D103101', 'P103101', '교통사고 외상', now());
insert into `Treatments` values ('1021003', 'D102104', 'P102102', '위염, 장염', now());
insert into `Treatments` values ('1041004', 'D104101', 'P104101', '피부 트러블', now());
insert into `Treatments` values ('1051005', 'D105101', 'P105102', '코막힘 및 비염', now());
insert into `Treatments` values ('1031006', 'D103101', 'P103102', '목 디스크', now());
insert into `Treatments` values ('1041007', 'D104101', 'P104102', '여드름', now());
insert into `Treatments` values ('1081008', 'D108101', 'P108101', '오른쪽 발목 뼈 골절', now());
insert into `Treatments` values ('1021009', 'D102104', 'P102103', '소화불량', now());
insert into `Treatments` values ('1071010', 'D107104', 'P107101', '가슴 통증', now());
insert into `Treatments` values ('1051011', 'D105101', 'P105102', '귀 이명', now());
insert into `Treatments` values ('1041012', 'D104101', 'P104103', '팔목 화상', now());

#데이터 삽입 Charts
insert into `charts` values ('C1021001', '1021001', 'D102101', 'P102101', '감기 주사 및 약 처방');
insert into `charts` values ('C1031002', '1031002', 'D103101', 'P103101', '입원 치료' );
insert into `charts` values ('C1021003', '1021003', 'D102104', 'P102102', '위내시경' );
insert into `charts` values ('C1041004', '1041004', 'D104101', 'P104101', '피부 감연 방지 주사' );
insert into `charts` values ('C1051005', '1051005', 'D105101', 'P105102', '비염치료' );
insert into `charts` values ('C1031006', '1031006', 'D103101', 'P103102', '목 견인치료' );
insert into `charts` values ('C1041007', '1041007', 'D104101', 'P104102', '여드름 치료약 처방' );
insert into `charts` values ('C1081008', '1081008', 'D108101', 'P108101', '발목 깁스' );
insert into `charts` values ('C1021009', '1021009', 'D102104', 'P102103', '주사 처방' );
insert into `charts` values ('C1071010', '1071010', 'D107104', 'P107101', 'MRI 검사' );
insert into `charts` values ('C1051011', '1051011', 'D105101', 'P105102', '귀 청소 및 약 처방' );
insert into `charts` values ('C1041012', '1041012', 'D104101', 'P104103', '화상 크림약 처방' );

#문1 모든 의사의 의사id, 이름, 생년월일, 전공의과 번호, 전공의과 이름 조회
select 
	`doc_id`,
    `doc_name`,
    `doc_birth`,
    a.`dep_no`,
    `dep_name`
from `doctors` as a
join `departments` as b on a.dep_no = b.dep_no;

#문2 모든 간호사의 id, name, birth, dep_no, dep_name 조회
select 
	`nur_id`,
    `nur_name`,
    `nur_birth`,
    a.`dep_no`,
    `dep_name`
from `nurses` as a
join `departments` as b on a.dep_no=b.dep_no;

#문3 모든 환자의 환자 id, name, jumin, hp, 담당의 담당간 이름 조회
select 
	`pat_id`,
	`pat_name`,
    `pat_jumin`,
    `pat_phone`,
    `doc_name`,
    `nur_name`
from `patients` as a
join `doctors` as b on a.doc_id = b.doc_id 
join `nurses` as c on b.dep_no = c.dep_no;    
    
#문4 모든 진료내역에서 환자 이름, 담당의 이름, 진료내용 처방내용, 진료날짜 조회
select 
	`pat_name`,
    `doc_name`,
    `treat_contents`,
    `chart_contents`,    
    `treat_datetime`

from `charts` as a
join `patients` as b on a.`pat_id` = b.`pat_id`
join `doctors` as c on a.`doc_id` = c.`doc_id`
join `treatments` as d on a.`treat_no` = d.`treat_no`;

#문5 모든 진료내역 `외과`에서 진료한 내역 가운데 진료번호, 환자이름, 담당의사이름, 진료내용, 처방내용, 진료날짜 조회
select 
	A.`treat_no`,
    `pat_name`,
    `doc_name`,
    `treat_contents`,
    `chart_contents`,
    `treat_datetime`
    
from `treatments` as a
join `patients` as b on a.pat_id = b.pat_id
join `doctors` as c on a.doc_id = c.doc_id
join `charts` as d on a.treat_no = d.treat_no
join `departments` as e on e.dep_no = c.dep_no
where `dep_name` = '외과';

#문6 
select 
	A.`treat_no`,
    `pat_name`,
    `doc_name`,
    `treat_contents`,
    `chart_contents`,
    `treat_datetime`
    
from `treatments` as a
join `patients` as b on a.pat_id = b.pat_id
join `doctors` as c on a.doc_id = c.doc_id
join `charts` as d on a.treat_no = d.treat_no
join `departments` as e on e.dep_no = c.dep_no
where `treat_contents` like '%화상%';

#문7 
select * from 
(select *, year(now()) - concat('19', substring(`pat_jumin`, 1, 2)) as `age`
from 
	`patients`) as a
where
	`age` between 30 and 40;
    
select * from `patients` 
where year(now()) - concat('19', substring(`pat_jumin`, 1, 2))
between 30 and 40; 

#문8 모든 전공부서 아직 의사id가 부여 되지 않은 의사의 이름과 부서명 조회
select 
`dep_manager`,
`dep_name`
from `departments` as a
left join `doctors` as b on a.dep_no = b.dep_no
where `doc_id` is null;

#문9 
select 
	GROUP_CONCAT(`pat_name` separator '^') aS `환자`
from `Nurses` as a
join `patients` as b On a.nur_id = b.nur_id
where `nur_name` = '김태희';
    
#문10
select 
	a.`nur_id`,
    a.`nur_name`,
	COUNT(*) as '환자수'
from `Nurses` as a
join `patients` as b On a.nur_id = b.nur_id
group by a.`nur_id`
order by `환자수` desc
limit 1;

 
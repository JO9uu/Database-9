#날짜: 2024/01/11
#이름: 정원구
#내용: 연습문제4

create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore'@'%';
grant all privileges on `BookStore`.* to 'jo9'@'%';
flush privileges;

use bookstore;

#실습 4-2 테이블 생성
create table `Customer`(
`custId` int not null primary key auto_increment,
`name` char(10) not null ,
`address` varchar(20) default 'null',
`phone` char(13) default 'null'
);

create table `Book`(
`bookID` int not null primary key,
`bookName` varchar(20) not null,
`publisher` varchar(20) not null,
`price` int default null
);

create table `Order`(
`orderID` int not null primary key auto_increment,
`custID` int not null,
`bookID` int not null,
`salePrice` int not null,
`orderDate` date
);

#실습 4-3 데이터 입력
#고객 테이블
insert into `Customer` values (null, '박지성', '영국 맨체스타', '010-5000-1001');
insert into `Customer` values (null, '김연아', '대한민국 서울', '010-6000-1001');
insert into `Customer` values (null, '장미란', '대한민국 강원도', '010-7000-1001');
insert into `Customer` values (null, '추신수', '미국 클리블랜드', '010-8000-1001');
insert into `Customer` values (null, '박세리', '대한민국 대전', null);

#책 테이블
insert into `Book` values (1, '축구의 역사', '굿스포츠', '7000');
insert into `Book` values (2, '축구아는 여자', '나무수', '13000');
insert into `Book` values (3, '축구의 이해', '대한미디어', '22000');
insert into `Book` values (4, '골프 바이블', '대한미디어', '35000');
insert into `Book` values (5, '피겨 교본', '굿스포츠', '8000');
insert into `Book` values (6, '역도 단계별기술', '굿스포츠', '6000');
insert into `Book` values (7, '야구의 추억', '이상미디어', '20000');
insert into `Book` values (8, '야구를 부탁해', '이상미디어', '13000');
insert into `Book` values (9, '올림픽 이야기', '삼성당', '7500');
insert into `Book` values (10, 'Olympic Champions', 'Pearson', '13000');

#주문 테이블
insert into `Order` values (null, '1', '1', '6000', now()); 
insert into `Order` values (null, '1', '3', '21000', now()); 
insert into `Order` values (null, '2', '5', '8000', now()); 
insert into `Order` values (null, '3', '6', '6000', now()); 
insert into `Order` values (null, '4', '7', '20000', now()); 
insert into `Order` values (null, '1', '2', '12000', now()); 
insert into `Order` values (null, '4', '8', '13000', now()); 
insert into `Order` values (null, '3', '10', '12000', now()); 
insert into `Order` values (null, '2', '10', '7000', now()); 
insert into `Order` values (null, '3', '8', '13000', now()); 

#실습 4-4 회원번호 이름 주소 조회
select `custId`, `name`, `address` from `Customer`;

#실습 4-5 도서의 이름, 가격 조회
select `bookname`, `price` from `Book`;

#실습 4-6 도서의 가격과 이름 조회
select `price`, `bookname` from `book`;

#실습 4-7 도서의 도서번호, 도서이름, 출판사, 가격 조회
select * from `book`;

#실습 4-8 출판사를 모두 조회
select `publisher` from `Book`;

#실습 4-9 출판사 모두 조회 단 중복x
select distinct `publisher` from `Book`;
select `publisher` from `book` group by `publisher`;

#실습 4-10 가격 >= 20000 도서
select * from `book` where `price` >= 20000;

#실습 4-11 가격 < 20000 도서
select * from `book` where `price` < 20000;

#실습 4-12 가격이 10000만 이상 20000이하인 도서
select * from `book` where `price` between 10000 and 20000;
select * from `book` where `price` >= 10000 and `price` <=20000;

#실습 4-13 가격이 15000 이상 30000이하인 도서의 도서번호, 도서명, 도서가격 조회
select `bookid`, `bookname`, `price` from `book` where `price` between 15000 and 30000; 

#실습 4-14 도서번호가 2, 3, 5인 도서 조회
select * from `book` where `bookid` in (2, 3, 5); 

#실습 4-15 도서 번호가 짝수인 도서 조회
select * from `book` where mod(`bookid`, 2)= 0; 
select * from `book` where `bookid` % 2 = 0;

#실습 4-16 박씨 성 고객 조회
select * from `customer` where `name` like '박%';

#실습 4-17 대한민국에 거주하는 고객 조회
select * from `customer` where `address` like '대한민국%';

#실습 4-18 휴대폰 번호가 유효한 고객만 조회
select * from `customer` where `phone` is not null;

#실습 4-19 출판사가 `굿스포츠` 혹은 `대한미디어`인 도서 조회
select * from `book` where `publisher` in ('굿스포츠', '대한미디어');

#실습 4-20 `축구의 역사` 출판사를 조회
select `publisher` from `book` where `bookName` = '축구의 역사';

#실습 4-21 도서이름에 `축구`가 포함된 출판사 조회
select `publisher` from `book` where `bookName` like '축구%';

#실습 4-22 도서이름 왼쪽 두번째위치에 `구`라는 문자열 도서
select * from `book` where `bookName` like '_구%';

#실습 4-23 축구에 관한 도서 중 가격 20000 > 인 책
select * from `book` where `bookName` like '축구%' and `price` >= 20000;

#실습 4-24 도서를 이름순으로 조회
select * from `book` order by `bookName`;

#실습 4-25 도서를 가격순 조회 가격이 같으면 이름 순
select * from `book` order by `price` asc, `bookName` asc;

#실습 4-26 도서의 가격을 내림차순, 가격이 같다면 출판사를 오름차순
select * from `book` order by `price` desc, `publisher` asc;

#실습 4-27 도서 가격이 큰 1, 2, 3 위
select * from `book` order by `price` desc limit 3;

#실습 4-28 도서 가격이 작은 1, 2, 3위
select * from `book` order by `price` asc limit 3;

#실습 4-29 고객이 주문한 도서의 총 판매량
select sum(saleprice)as '총판매액' from `order`;

#실습 4-30 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가 조회
select 
sum(saleprice)as '총판매액', 
avg(saleprice)as "평균값",
min(saleprice)as "최저가",
max(saleprice)as "최고가"
from `order`;

#실습 4-31 도서 판매 건수
select count(orderID)as "판매건수" from `order`;

#실습 4-32 도서제목 야구>농구 변경
update `book`
set `bookName` = replace(`bookName`, '야구', '농구') where `bookname` like '야구%';

select*from `book`; 

#실습 4-33 가격 >= 8000 구매 고객에 대하여 고객별 주문 도서의 총 수량 조회 단, 두권이상 구매한 고객만
select  
	`custid`,
    count(*) as `수량`
from `order` where `saleprice` >= 8000
group by `custId` 
having `수량` >=2
order by `custid`;

#실습 4-34 고객과 고객의 주문에 대한 데이터 조회
select * from `customer` as a
join `order` as b on a.custId = b.custID;

select * from `customer` join `order` using (`custid`);

select * from `customer` as a, `order` as b where a.custid = b.custid;

#실습 4-35 고객과 고객의 주문에 대한 데이터를 고객번호 순으로 정렬하여 조회
select * from `customer` as a
join `order` as b on a.custId = b.custID
order by a.`custId`;

#실습 4-36 고객의 이름과 고객이 주문한 도서의 판매가격을 조회
select 
`name`, `saleprice`
from `customer` as a
join `order` as b on a.custId = b.custID;

#실습 4-37 고객별 주문한 모든 도서의 총 판매액 조회, 고객별 정렬
select 
`name`, 
sum(`saleprice`)
from `customer` as a
join `order` as b on a.custId = b.custID
group by
	`name`
order by `name`;

#실습 4-38 고객 이름과 고객이 주문한 도서의 이름을 조회
select 
	`name`,
	`bookname`
from `customer` as a
join `order` as b on a.custId = b.custId
join `book` as c on b.bookId = c.bookId;

#실습 4-39
select 
	`name`,
	`bookname`
from `customer` as a
join `order` as b on a.custId = b.custId
join `book` as c on b.bookId = c.bookId
where `price` = 20000;

#실습40 도서를 구매하지 않은 고객을 포함 고객명과 주문한 도서의 판매가격 조회
select 
	`name`,
    `saleprice`
FROM `Customer` AS a 
LEFT JOIN `Order` AS b ON a.custId = b.custId;

#실습 41
select
	sum(`saleprice`) as `총매출`
from `Customer` as a
left join `Order` as b on a.custId = b.custId
where `name` = '김연아';

#실습 42 가장 비싼 도서의 이름
select `bookName` from `Book` order by `price` desc limit 1;

#실습 43 도서를 주문하지 않은 고객의 이름
select
	`name`
from `Customer` as a
left join `Order` as b on a.custId = b.custId
where `orderId` is null;

select
	`name`
from `customer`
	where `custid` not in (select distinct `custId` from `order`);
    
#실습 44 book 테이블에 새로운 도서 `스포츠 의학` 삽입 `한솔의학서적`출판 가격 `미정`
insert into `Book` values (11, '스포츠 의학', '한솔의학서적', null);

#실습 45 customer 테이블에서 고객번호가 5인 고객의 주소를 `대한민국 부산`으로 변경
update `customer`
set `address` = '대한민국 부산'
where `address` = '대한민국 대전';

#실습 46 Customer 테이블에서 고객번호가 5인 고객을 삭제
delete from `customer`
where `custid` = '5';
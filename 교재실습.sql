#날짜: 2024/01/08
#이름: 정원구
#내용: 교재 Ch03 SQL 기본문법

#손코딩 p111

use market_db;

#손코딩 p112
use market_db;
select * from member;

#손코딩 p114
select mem_name from member;

#손코딩 p115
#여러개의 열 콤마로 구분, 열 이름의 순서는 테이블 열 순서랑 상관x
select addr, debut_date, mem_name from member;

#손코딩 p116
#where 절은 조회하는 결과에 특정한 조건을 추가해서 원하는 데이터만 보고 싶을 때 사용
#select 열_이름 from 테이블_이름 where 조건식; 으로 구성
select * from member where mem_name = '블랙핑크';

#손코딩 p117
#숫자형 열을 조회할 때는 ''생략 가능
select * from member where mem_number = 4;

#숫자료 표현된 데이터는 범위 지정 가능 관계연산자 사용
select mem_id, mem_name from member where
height <= 162;

#2가지 이상의 조건을 만족하도록 할 수도 있음 논리연산자 사용 and는 두 조건 모두 만족
select mem_name, height, mem_number from member
where height >= 165 and mem_number > 6;

#손코딩 p118
#or은 두 조건 중 하나만 만족
select mem_name, height, mem_number from member
where height >= 165 or mem_number > 6;

#and를 사용 평균 키 163~165인 회원 조회
select mem_name, height from member
where height >= 163 and height <= 165;

#같은 조건은 between ~ and 사용 가능
select mem_name, height from member where height between 163 and 165;

#손코딩 p119
#숫자로 구성된 데이터는 크다/작다의 범위를 지정 할 수 있으므로 between~and 사용 가능
#문자로 표현된 데이터는 or로 일일이 써줘야 함
select mem_name, addr
from member
where addr = '경기' or addr = '전남' or addr = '경남' ;

#같은 경우 in을 사용하면 코드를 훨씬 간결하게 작성 가능
select mem_name, addr
from member
where addr in('경기', '전남', '경남');

#문자열의 일부를 검색하려면 like를 사용 이 경우 제일 앞글자가 우 그 뒤는 무엇이든(%)허용 한다는 뜻
select * from member
where mem_name like '우%';

#손코딩 p120
#한 글자와 매치하기 위해서 언더바_ 사용 앞 두글자는 상관없고 뒤는 핑크인 회원 검색
select * from member
where mem_name like '__핑크';

#손코딩 p125
#order by 절: 결과가 출력되는 순서를 조절, 데뷔 일자가 빠른 순서대로 출력
select mem_id, mem_name, debut_date from member
order by debut_date;

#손코딩 p126
#asc는 오름차순 desc는 내림차순
select mem_id, mem_name, debut_date from member 
order by debut_date desc;

#손코딩 p127
#order by절은 where절 이후에 나와야 함
select mem_id, mem_name, debut_date, height
from member
where height >= 164
order by height desc;

#평균키가 큰 순서대로 정렬하되, 평균키가 같으면 데뷔 일자가 빠른 순서대로 정렬
select mem_id, mem_name, debut_date, height
from member
where height >= 164
order by height desc, debut_date asc;

#손코딩 p128
#limit는 출력하는 개수를 제한, 다음은 전체 중 앞에서 3건만 조회 하는 명령문
select * from member limit 3;

#limit 형식은  limit 시작, 개수 지금과 같이 limit 3만 쓰면 limit 0, 3과 동일
select mem_name, debut_date from member
order by debut_date limit 3;

#손코딩 p129
#필요하다면 중간부터 출력도 가능, 평균키가 큰 순으로 정렬하되, 3번째부터 2건만 조회
select mem_name, height from member order by height desc limit 3, 2;

#distinct는 조회된 결과에서 중복된 데이터를 1개만 남기는 것
select addr from member;

#손코딩 p130
select addr from member order by addr;

#여기서 distinct를 사용하면 중복된 값은 지움
select distinct addr FROM member;

#손코딩 p131
#Group by절은 말 그대로 그룹으로 묶어주는 역할
select mem_id, amount From buy order by mem_id;

#손코딩 p132
#group by 와 함께 주로 사용되는 집계 함수는 다음과 같음
#sum, avg, min, max, count, count(distinct)
#이를 종합해 회원별로 묶고, 구매한 개수를 합치면
select mem_id "회원 아이디", sum(amount) "총 구매 개수"
from buy group by mem_id;

#손코딩 p133
#회원이 구매한 금액의 총합은
select mem_id "회원 아이디", sum(price*amount)"총 구매 금액"
from buy group by mem_id;

#회원이 구매한 물품 개수의 평균
select avg(amount) "평균 구매 개수" from buy;

#손코딩 p134
#각 회원이 한 번 구매 시 평균 몇 개를 구매했는지 회원 id별로 구해야 하므로 group by 사용
select mem_id, avg(amount) "평균 구매 개수" from buy
group by mem_id;

#회원 테이블에 연락처가 있는 회원의 수
select count(*) from member;

#연락처가 있는 회원만 카운트하려면 국번 또는 전화번호의 열 이름을 지정해야 null값 제외 카운트
select count(phone1) "연락처가 있는 회원" from member;

#sum으로 회원별 총 구매액을 구하시오
select mem_id, sum(price*amount)"총 구매 금액"
from buy group by mem_id;

#손코딩 p135
#총 구매금액이 1,000 이상인 회원에게만 사은품 증정 where절이 아닌 having절을 사용 having절은 group by절 뒤에 위치 해야함
select mem_id, sum(price*amount) "총 구매 금액"
from buy
group by mem_id
Having sum(price*amount)>1000;

#손코딩 p136
#만약 총 구매액이 큰 사용자부터 나타내려면 order by를 사용
select mem_id "회원 아이디", sum(price*amount)"총 구매 금액"
from buy
group by mem_id
having sum(price*amount)>1000
order by sum(price*amount) desc;

#손코딩 p141
#insert는 테이블에 데이터를 삽입하는 명령, 테이블 이름 다음에 나오는 열은 생략 가능,
#다만 생략할 경우 values 다음에 나오는 값들의 순서 및 개수는 테이블을 정의 할 때의 열 순서 및 개수와 동일해야 함
use market_db;
create table hongong1(toy_id int, toy_name char(4), age int);
insert into hongong1 values (1, '우디', 25);

#나이를 입력하고 싶지 않다면 테이블 이름 뒤에 입력할 열의 이름을 씀, 나이에는 null값 자동입력
insert into hongong1 (toy_id, toy_name) values(2, '버즈');

#열의 순서를 바꿔서 입력하려면 열 이름과 값을 원하는 순서에 맞춰 써주면 됨
insert into hongong1 (toy_name, age, toy_id) values('제시', 20, 3);

#손코딩 p142
#auto_increment는 1부터 증가하는 값을 입력 반드시 primary key로 지정
create table hongong2(
toy_id int auto_increment primary key,
toy_name char(4),
age int
);

#자동 증가하는 부분은 null입력 나머지는 채우면 됨
insert into hongong2 values (null, '보핍', 25);
insert into hongong2 values (null, '슬링키', 22);
insert into hongong2 values (null, '렉스', 21);
select * from hongong2;

#현재 어느 숫자까지 증가 되었나 확인
select last_insert_id();

#손코딩 p143
#자동 증가하는 부분을 100부터 시작하도록 변경하고 싶다면
alter table hongong2 auto_increment=100;
insert into hongong2 values (null, '재남', 35);
select * from hongong2;

#증가값의 시작을 1,000으로 하고 증가값은 3으로 변경하고 싶다면
create table hongong3(
toy_id int auto_increment primary key,
toy_name char(4),
age int
);
alter table hongong3 auto_increment=1000;
set @@auto_increment_increment=3;

#손코딩 p144
#값을 대입해 위의 내용을 확인
insert into hongong3 values (null, '토마스', 20);
insert into hongong3 values (null, '제임스', 23);
insert into hongong3 values (null, '고든', 25);
select * from hongong3;
#내용이 같다면 한줄로 작성해도 무방

#다른 테이블의 데이터를 한 번에 입력하는 insert into~select
#주의할 점은 select 문의 열 개수는 insert할 테이블의 열 개수와 같아야 함

#손코딩 p145
select count(*) from world.city;

#테이블 구조 출력
desc world.city;

#테이블 데이터 살펴보기
select * from world.city limit 5;

#손코딩 p146
#도시 이름과 인구만 가져오기
create table city_popul (city_name char(35), population int);

#world.city 테이블의 내용을 city_popul 테이블에 입력
insert into city_popul
select name, population from world.city;

#손코딩 p147
#데이터 수정은 update를 이용 함
use market_db;
update city_popul
set city_name = '서울'
where city_name = 'seoul';
select * from city_popul where city_name = '서울';

#손코딩 p148
#필요하다면 한꺼번에 여러 열의 값 수정도 가능
update city_popul
set city_name = '뉴욕', population = 0
where city_name = 'New York';
select * from city_popul where city_name = '뉴욕';

#update절에 where이 없다면 테이블의 모든 행의 값이 변경

#손코딩 p149
#인구 단위를 10,000명으로 변경 하기
update city_popul
	set population = population / 10000;
select * from city_popul limit 5;

#delete: 행 단위로 정보 삭제
delete from city_popul
where city_name like 'New%';
#update와 마찬가지로 where 절이 생략되면 전체 삭제하므로 주의!

#손코딩 p150
delete from city_popul
where city_name like 'New%'
limit 5;

#손코딩 p151
create table big_table1 (select * from world.city, sakila.country);
create table big_table2 (select * from world.city, sakila.country);
create table big_table3 (select * from world.city, sakila.country);

delete from big_table1;
drop table big_table2;
truncate table big_table3; 
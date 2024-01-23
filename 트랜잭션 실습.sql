#날짜: 2024/01/18
#이름: 정원구
#내용: 트랜잭션 실습하기

use bank;

#실습 8-1
 #트랜잭션 시작
start transaction;
select * from `bank_account`;
update `bank_account` set
						`a_balance` = `a_balance` - 10000
					where 
						`a_no` = '101-11-1001';
update `bank_account` set
						`a_balance` = `a_balance` + 10000
                        where
                        `a_no` = '101-11-1212';

 #트랜잭션 작업완료
commit;

select * from `bank_account`;
update `bank_account` set
						`a_balance` = `a_balance` - 10000
					where 
						`a_no` = '101-11-1001';
update `bank_account` set
						`a_balance` = `a_balance` + 10000
                        where
                        `a_no` = '101-11-1212';
select * from `bank_account`;

rollback;
select * from `bank_account`;

#실습 8-3
select @@autocommit;
set autocommit = 0;

update `bank_account` set
						`a_balance` = `a_balance` - 10000
						where
						`a_no` = '101-11-1001';
                        
                        select * from `bank_account`;
                        
#실습 8-4 lock & unlock 병행제어 실습 
select * from `bank_account` where `a_no` = '101-11-1001';

start transaction;

update `bank_account` set
						`a_balance` = `a_balance` - 10000
					where 
						`a_no` = '101-11-1001';
                        
commit;

                        
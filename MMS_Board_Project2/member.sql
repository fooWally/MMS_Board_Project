create table member3(
	id varchar2(6) primary key,
	pw varchar2(15) not null,
	name varchar2(15) not null,
	birth date default sysdate,
	email varchar2(15)
)

select * from member3
drop table member3

insert into member3 (id, pw, name, birth, email) values('test1', 'asdf', 'lee', '14/Sep/1999', 'rud@naver.com')

select id, pw, name, to_char(birth, 'yyyy/mm/dd') birth, email from member3
insert into member3 values('m002', 'abcdc', 'john','27-APR-1999', 'bcd@aa.com')
insert into member3 values('m003', '1234', 'ryu', '10-Jul-1955', 'aaa@bbc.com')
insert into member3 values('m004', 'abc12', 'kim', '21-Jun-1990', 'ddd@korea.com')
insert into member3 values('m005', 'dddd', 'han', '13-Sep-1970', 'abc@mbc.net')
insert into member3 values('m006', 'aaaa', 'choi', '08-Jan-1999', 'dada@abc.com')

commit

insert into member3(id, name, pw, birth, email) values('m001', 'lee', 'abcd', '31-Dec-1980', 'abc@oh.com')
insert into member3 values('m002', 'john', 'abcdc', '27-APR-1999', 'bcd@aa.com')
insert into member3 values('m003', 'ryu', '1234', '10-Jul-1955', 'aaa@bbc.com')
insert into member3 values('m004', 'kim', 'abc12', '21-Jun-1990', 'ddd@korea.com')
insert into member3 values('m005', 'oh', 'dddd', '13-Sep-1970', 'abc@mbc.net')
insert into member3 values('m006', 'cha', 'aaaa', '08-Jan-1999', 'dada@abc.com')


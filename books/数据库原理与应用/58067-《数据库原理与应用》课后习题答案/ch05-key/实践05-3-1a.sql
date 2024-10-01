use library
go
create table 图书(
图书编号 char(6) not null primary key,
书名 varchar(20) not null,
类别 char(12),
作者 varchar(20),
出版社 varchar(20),
出版日期 datetime,
定价 money)

use library
go
create table 借阅(
读者编号char(4) not null,
图书编号char(6) not null 
foreign key  references 图书(图书编号),
借书日期datetime not null,
还书日期datetime)

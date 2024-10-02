use library
go
create table 读者(
	读者编号 char(4) not null,
	姓名 char(6) not null,
	性别 char(2),
	单位 varchar(20),
	电话 varchar(13),
	类型编号 int null,
	已借数量 int null)

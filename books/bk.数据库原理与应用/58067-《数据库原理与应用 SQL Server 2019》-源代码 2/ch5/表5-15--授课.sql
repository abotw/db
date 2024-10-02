use jxgl
go
create table 课程(
课程号 char(2) not null,
课程名称 varchar(20),
课程类型 char(4),
学时 smallint,
学分 tinyint
,备注 varchar(MAX))

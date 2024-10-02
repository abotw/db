use jxgl
go
create table 教师
(工号 char(6) constraint pk_教师_工号 primary key
,姓名 char(6),性别 char(2)
,出生日期 datetime,工作日期 datetime
,职称 char(6),基本工资 int,婚否 bit)

/*做了修改*/
use jxgl
go
create table 学生(
学号 char(8) not null constraint pk_学生 primary key,
姓名 char(6) not null,
性别 char(2) constraint df_学生_性别 default '男',
出生日期 datetime,
总分 int,籍贯 char(4),备注 varchar(MAX),班级号 char(6))

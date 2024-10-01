/*做了修改*/
use jxgl
go
create table 选修(
成绩编码 int identity(1,1)
,学号 char(8) not null constraint fk_学号 foreign key references 学生(学号)
,课程号 char(2) not null
,constraint pk_选修 primary key(学号,课程号)
,成绩 numeric(3,1) check(成绩>=0 and 成绩<=100)	/*check约束也可以设置约束名*/
,备注 varchar(MAX))

use jxgl
go
create table 重修(学号 char(8),课程号 char(2),成绩 tinyint)
go
create proc retake as select 学号,课程号, 成绩 from 选修 where 成绩<60
go
insert into 重修(学号,课程号, 成绩 ) execute retake

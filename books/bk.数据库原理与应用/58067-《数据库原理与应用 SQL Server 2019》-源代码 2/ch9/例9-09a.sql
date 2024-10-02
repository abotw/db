/* 做了普遍性优化，原来程序也行*/
use jxgl
go
if exists(select name from sys.objects
 where name ='proc_score' and type ='p')
drop proc proc_score     --删除已存在的同名存储过程
go
--创建存储过程分组编号1，输出各班的最高分
create procedure proc_score;1
as
select 班级号,max(成绩) as 最高分 from 学生,选修
  where 选修.学号=学生.学号
    group by班级号
go
--创建存储过程分组编号2，输出各班的最低分
create procedure proc_score;2
as
select 班级号,min(成绩) as 最低分
  from 学生,选修
  where 选修.学号=学生.学号
    group by 班级号
 go

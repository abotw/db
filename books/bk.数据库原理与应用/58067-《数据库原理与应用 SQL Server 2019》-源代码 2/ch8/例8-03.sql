use jxgl
go
create view v_不及格
as
select 学生.学号,姓名,课程名称,成绩
  from 学生,选修,课程
  where 学生.学号=选修.学号 
and 选修.课程号=课程.课程号
 and 成绩<60

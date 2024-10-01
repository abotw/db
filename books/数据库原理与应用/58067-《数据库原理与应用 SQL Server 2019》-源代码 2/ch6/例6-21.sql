--语句1：
select 学生.学号,姓名,成绩 from 学生,选修 where 学生.学号=选修.学号
go
--语句2：
select 学生.学号,姓名,成绩 from 学生 inner join 选修 on 学生.学号=选修.学号

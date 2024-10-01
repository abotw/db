--等价语句1：
select 姓名 from 学生,选修where学生.学号= 选修.学号 and 成绩<60
go
--等价语句2：
select 姓名from 学生 where 学号in (select 学号from 选修where 成绩<60)

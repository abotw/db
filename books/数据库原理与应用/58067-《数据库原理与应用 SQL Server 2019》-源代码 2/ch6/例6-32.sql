select 学号,姓名 from 学生
 where not exists (select * from 选修 where 学号= 学生.学号 and 课程号='01')
--等价语句1：
select 学号,姓名from 学生
 where 学号not in (select 学号from 选修 where  课程号='01')
--等价语句2：
select 学号,姓名from 学生
except
select 学号,姓名from 学生 where 学号in (
  select 学号from 选修where 课程号='01')

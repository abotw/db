select 姓名 from 学生
 where exists (select * from 选修 where 学号= 学生.学号 and 成绩<60)

Select * from 选修 a
 where 成绩>(select avg(成绩) from 选修 b where a.学号=b.学号)

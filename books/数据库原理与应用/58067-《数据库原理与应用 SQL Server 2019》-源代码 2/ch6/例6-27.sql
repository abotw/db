select 学号,avg(成绩) as 平均成绩 from 选修 group by 学号
 having avg(成绩)>(select avg(成绩) from 选修)

use jxgl
insert into 选修(学号,课程号,成绩) 
 select 学号,'01',null from 学生 where 班级号 = 
  (select 班级号 from 班级 where 班级名称='20信管（1）班')

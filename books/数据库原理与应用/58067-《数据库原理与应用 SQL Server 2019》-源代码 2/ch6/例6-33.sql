select 姓名 from 学生 where not exists						/*查询学生x*/
 (select * from 课程 where not exists						/*不存在课程y*/
  (select * from 选修 where 学号=学生.学号 and 课程号=课程.课程号)) /*x不选课程*/

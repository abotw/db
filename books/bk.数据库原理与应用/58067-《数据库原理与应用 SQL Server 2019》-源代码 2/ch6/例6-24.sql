select stu.学号,姓名,性别,score.学号,课程号,成绩
 from stu right outer join score on stu.学号=score.学号

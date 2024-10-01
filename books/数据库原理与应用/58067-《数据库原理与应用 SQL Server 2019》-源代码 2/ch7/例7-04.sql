use jxgl
if (select avg(成绩) 
  from 选修 where 学号='19010101')>=60
   begin
     print '该同学通过全部考试，没有挂考'
   end
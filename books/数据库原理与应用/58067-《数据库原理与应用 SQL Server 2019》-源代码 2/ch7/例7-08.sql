/*做了修改*/
use jxgl
update 授课
 set 课酬 = 学时* case 
  when 职称='教授' then 150
  when 职称='副教授' then 120
  when 职称='讲师' then 100
  else 60
  end 
 from 教师,课程,授课
 where 教师.工号=授课.工号 
   and 课程.课程号=授课.课程号
go
select * from 授课

select distinct 学号 from 选修 a where not exists
 (select * from 选修 b where b.学号='19010101' and not exists
  (select * from 选修 c where c.学号=a.学号 and c.课程号=b.课程号))

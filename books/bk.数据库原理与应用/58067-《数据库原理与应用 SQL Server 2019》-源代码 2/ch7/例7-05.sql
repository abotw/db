use jxgl
if (select datediff(year,工作日期,getdate())
 from 教师 where 姓名='李力群')>=30
  print '该教师的工龄至少30年，可以提出退休申请'
else
  print '该教师的工龄不足30年，不可以提出退休申请'

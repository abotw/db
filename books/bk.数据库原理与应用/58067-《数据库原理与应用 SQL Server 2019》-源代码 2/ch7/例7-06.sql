use jxgl
if exists(select * from 课程 where 课程类型='考查')
  select count(*) as '考查课门数' 
   from 课程 where 课程类型='考查'
else
  print '没有考查课'

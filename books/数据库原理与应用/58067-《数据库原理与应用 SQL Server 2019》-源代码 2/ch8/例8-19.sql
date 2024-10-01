/* 做了普遍性优化，原来程序也行*/
use jxgl
declare pass_score scroll cursor
   for 
   select * from 选修 where 班级号='190101' /*优化后的代码*/
      and 成绩>=60 order by 学号
open pass_score					--打开游标
fetch next from pass_score				--读取游标
--循环读取游标
while @@fetch_status=0
begin
 fetch next from pass_score
end

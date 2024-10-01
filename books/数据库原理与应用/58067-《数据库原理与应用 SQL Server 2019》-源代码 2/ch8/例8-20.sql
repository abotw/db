/* 做了普遍性优化，原来程序也行*/

use jxgl
go
declare boy cursor for
  select * from 学生 where 性别='男' for read only	--声明游标
open boy													--打开游标
close boy													--关闭游标
declare boy scroll cursor for							
  select * from 学生 where 性别='男' 
     and 班级号='190101' /*优化后的代码*/	     --声明同名游标
go

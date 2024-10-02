use jxgl
declare boy scroll cursor
   for select * from 学生 where 性别='男'
-- 没有打开游标时，@@cursor_rows返回值为0
print @@cursor_rows
open boy
-- 打开游标后,@@cursor_rows返回当前游标的总行数
if @@cursor_rows > 0
   print @@cursor_rows
go

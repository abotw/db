use jxgl
go
declare status_boy cursor scroll
 for select * from 学生 where 性别='男'
print cursor_status('global','status_boy')	--打开游标前  显示：-1
open status_boy								--打开游标
print cursor_status('global','status_boy')	--打开游标后  显示：1
close status_boy							--关闭游标
print cursor_status('global','status_boy')	--关闭游标后  显示：-1
deallocate status_boy						--释放游标
print cursor_status('global','status_boy')	--释放游标后  显示：-3

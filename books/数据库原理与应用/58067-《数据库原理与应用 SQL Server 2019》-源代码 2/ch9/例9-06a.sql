use jxgl
if exists (select name from sys.objects where name='cursor_选修'and type='p')
drop proc cursor_选修    --删除已存在的同名存储过程
go
create proc cursor_选修
@xh char(8)='19010101',
@js_cursor cursor varying output
as
 set @js_cursor=cursor forward_only static for
 select * from 选修 where 学号=@xh
open @js_cursor

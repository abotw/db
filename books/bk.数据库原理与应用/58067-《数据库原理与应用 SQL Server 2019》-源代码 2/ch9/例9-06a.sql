use jxgl
if exists (select name from sys.objects where name='cursor_ѡ��'and type='p')
drop proc cursor_ѡ��    --ɾ���Ѵ��ڵ�ͬ���洢����
go
create proc cursor_ѡ��
@xh char(8)='19010101',
@js_cursor cursor varying output
as
 set @js_cursor=cursor forward_only static for
 select * from ѡ�� where ѧ��=@xh
open @js_cursor

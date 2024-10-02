declare @xh char(8),@my cursor
set @xh='19010101'
exec cursor_选修 @xh,@my output
fetch next from @my			    --提取数据
while(@@fetch_status=0)
 begin
  fetch next from @my			--提取数据
 end
close @my						--关闭游标
deallocate @my					--删除游标

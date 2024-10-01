use jxgl
go
declare up_score_cursor cursor for
  select 学号,课程号,成绩,备注 from 选修 where 成绩<60
    for update of 备注							--声明游标
open up_score_cursor							--打开游标
  fetch next from up_score_cursor				--读取游标数据
while @@fetch_status=0							--循环更新和读取游标中的数据行
 begin
  update 选修 set 备注='通知补考' 
   where current of up_score_cursor
  fetch next from up_score_cursor
 end
close up_score_cursor					--关闭游标
deallocate up_score_cursor				--释放游标
--查询成绩中小于60的数据行
select 学号,课程号,成绩,备注 from 选修 where 成绩<60

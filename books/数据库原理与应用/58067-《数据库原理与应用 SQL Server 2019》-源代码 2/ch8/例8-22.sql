use jxgl
go 
declare del_score_cursor cursor
for select 学号,课程号,成绩 from 选修 where 成绩 is null
  for update											--声明游标
open del_score_cursor								--打开游标
fetch next from del_score_cursor					--读取游标数据
while @@fetch_status=0								--循环删除和读取游标数据行
 begin
  delete from 选修
    where current of del_score_cursor
  fetch next from del_score_cursor
 end
close del_score_cursor								--关闭游标
deallocate del_score_cursor							--释放游标
--查询成绩中为空的数据行
select 学号,课程号,成绩 from 选修 where 成绩 is null

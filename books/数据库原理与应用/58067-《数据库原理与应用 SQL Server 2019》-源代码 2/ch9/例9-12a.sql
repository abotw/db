use jxgl
go
if exists(select * from sysobjects where name='up_选修' and type ='tr') 
  drop trigger up_选修     --删除已存在的同名触发器
go
create trigger up_选修
on 选修
for update
as
if update(成绩)
begin
 select inserted.学号,inserted.课程号,deleted.成绩 原成绩,inserted.成绩 新成绩
 from deleted,inserted
 where deleted.学号= inserted.学号 and deleted.课程号= inserted.课程号 
end

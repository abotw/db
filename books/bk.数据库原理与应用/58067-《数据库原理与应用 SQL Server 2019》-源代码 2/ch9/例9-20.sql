use jxgl
go
if exists(select * from sysobjects where name='up_学生' and type ='tr') 
drop trigger up_学生    --删除已存在的同名触发器
go
create trigger up_学生
on 学生
for update
as
if update(学号)
update 选修 set 选修.学号=inserted.学号		--选择inserted表
from 选修,inserted,deleted
where 选修.学号=deleted.学号					--选择deleted表

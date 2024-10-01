use library
go 
create trigger ins_借阅
 on 借阅
 instead of insert
as
if not exists(select * from 读者 where 读者编号=(select 读者编号 from inserted))
/* if exists(select * from 读者,inserted where 读者.读者编号=inserted.读者编号)=0*/
print '读者编号不存储在读者表中，不能插入该记录'
else
begin
  insert into 借阅 select * from inserted
  print '已经成功插入记录！'
end 
go
--验证如下：
insert into 借阅(读者编号,图书编号,借书日期,还书日期)
values('1012','TP0004',GETDATE(),null)


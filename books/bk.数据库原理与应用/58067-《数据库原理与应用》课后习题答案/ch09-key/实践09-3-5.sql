use library
go 
create trigger ins_借阅
on 借阅
for insert
as
if (select count(*) from 借阅 where 读者编号=(select 读者编号 from inserted ))>20
begin
 rollback transaction
print ’该读者已经数量已经查过规定借书数量，禁止借书’
end
--验证如下
insert into 借阅(读者编号,借书编号,串号)values('1001','F27505', '11')

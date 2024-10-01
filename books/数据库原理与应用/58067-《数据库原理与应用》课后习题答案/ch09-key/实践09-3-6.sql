create trigger up_图书
on 图书
for update,insert
as
declare @price int
select  @price =单价 from inserted
if @price <20
 begin
  
　rollback transaction
print '单价必须在20元以上'
end
go

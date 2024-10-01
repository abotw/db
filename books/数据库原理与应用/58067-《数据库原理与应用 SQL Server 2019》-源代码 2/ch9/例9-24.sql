core = 成绩 from deleted 
if @score>60
begin
 rollback transaction 
 raiserror('不允许删除成绩大于60的记录',16,1)
end

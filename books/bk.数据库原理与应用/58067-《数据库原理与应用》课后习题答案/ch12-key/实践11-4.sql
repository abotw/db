use library
go
--创建帐户表bank--
if exists(select * from sys.objects where name='bank')
    drop table bank
create table bank(
customerName char(10), --顾客姓名
currentMoney  money   --当前余额
)
go
/**//*--添加约束，帐户不能少于元--*/
alter table bank add constraint CK_currentMoney check(currentMoney>=1)
/**//*--插入测试数据--*/
insert into bank(customerName,currentMoney)
select '张三',1000 union
select '李四',1
select * from bank
go
/**//*--使用事务--*/
use library
go
--恢复原来的数据
--update bank set currentMoney=currentMoney-1000 where customerName='李'
set nocount on    --不显示受影响的行数
print '查看转帐事务前的余额'
select * from bank
go
/**//*--开始事务--*/
begin transaction
declare @errorSum int    --定义变量，用于累计事务执行过程中的错误
/**//*--转帐--*/
update bank set currentMoney=currentMoney-800 where customerName='张三'
set @errorSum=@errorSum+@@error    --累计是否有错误
update bank set currentMoney=currentMoney+800 where customerName='李四'
set @errorSum=@errorSum+@@error --累计是否有错误
print '查看转帐事务过程中的余额'
select * from bank
/**//*--根据是否有错误，确定事务是提交还是回滚--*/
if @errorSum>0
    begin
        print '交易失败，回滚事务.'
        rollback transaction
    end
else
    begin
        print '交易成功，提交事务，写入硬盘，永久保存！'
        commit transaction
    end
go
print '查看转帐后的余额'
select * from bank
go

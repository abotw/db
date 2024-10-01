use jxgl
go
set implicit_transactions off    --使用显式事务模式
select 次数=0,* from 学生			 --检查当前表的内容
begin transaction
  insert into 学生(学号,姓名,性别)values('22010101','司武长','男')
save transaction label
  insert into 学生(学号,姓名,性别)values('22010102','那佳佳','女')
  select 次数=1,* from 学生		--显示插入两条记录
rollback transaction label		--回滚到事务保存点
  select 次数=2,* from 学生		--显示第1次插入的记录被撤销了
rollback transaction
  select 次数=3,* from 学生		--显示第2次插入的记录被撤销了

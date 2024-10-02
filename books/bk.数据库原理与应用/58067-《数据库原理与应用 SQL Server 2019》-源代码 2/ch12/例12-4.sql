use jxgl
go
set implicit_transactions on    --使用隐式事务模式
   insert into 学生(学号,姓名,性别)values('22010102','那佳佳','女')
rollback
   insert into 学生(学号,姓名,性别)values('22010101','司武长','男')
commit
   select * from 学生

use jxgl
Go
set implicit_transactions off    --使用显式事务模式
  insert into 学生(学号,姓名,性别)values('22010101','司武长','男')
rollback

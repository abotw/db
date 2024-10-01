use jxgl
go
set tran isolation level repeatable read
begin transaction
insert into 学生(学号,姓名,性别,总分,籍贯)
 values('22010101','柯崇福','男',550,'山东')
commit transaction

use jxgl
go
create view inform
as
select 学号,姓名,性别, 籍贯,总分
  from 学生
  where left(学号,6)='190201'

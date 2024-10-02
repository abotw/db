use jxgl
go
begin transaction
insert into 学生(学号,姓名,性别,总分,籍贯)
 values('22010104','徐列华','男',550,'山西')
select * from 学生 where 籍贯='山西'
update 学生set 性别='女' where 学号='22010104'
select * from 学生 where 籍贯='山西'
commit transaction

use jxgl
go
create trigger del_学生 on 学生
after delete
as
delete from 选修
where 学号 in (select 学号 from deleted)

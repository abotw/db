insert into borrow_inform ( 读者编号,姓名,性别 ) values ( '1011','郝淑敏','女' )
go
select * from 读者  where 读者编号='1011'
go 
select * from borrow_inform where 读者编号='1011'
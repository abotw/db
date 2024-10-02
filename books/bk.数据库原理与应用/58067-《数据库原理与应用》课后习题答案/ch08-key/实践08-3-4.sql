update borrow_inform set 性别='男' where 读者编号='1011' 
go 
select * from 读者  where 读者编号='1011'
go 
select * from borrow_inform where 读者编号='1011'

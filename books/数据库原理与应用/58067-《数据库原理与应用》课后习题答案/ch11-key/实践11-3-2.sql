--方法一：
use master
go
create login stu_login2 
with password='123',default_database=library
go
use library
grant connect to stu_login2
--方法二：
use library
go
create login stu_login2 
with password='123'

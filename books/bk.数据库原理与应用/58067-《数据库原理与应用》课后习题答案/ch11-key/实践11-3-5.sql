--（1）
use library
go
grant create table to stu_login1_u
--（2）
use library
go
grant select,insert,update,delete on 图书to stu_login1_u
--（3）
use library
go
grant select on 图书(图书编号,定价,出版日期) to myrole with grant option
grant select on 图书(图书编号,定价,出版日期) to stu_login1_u,stu_login2_u with grant option
--(4)
select * from 图书   --无法查询
select 图书编号,定价,出版日期from 图书  ---能查询
--注意：验证需在登录名stu_login1状态下

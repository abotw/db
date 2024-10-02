use library
go
create view borrow_inform
as
select 读者编号,姓名,性别,已借数量
from 读者
where 性别='女'
go

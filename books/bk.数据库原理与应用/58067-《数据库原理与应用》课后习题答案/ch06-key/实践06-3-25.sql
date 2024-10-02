select * from 读者
where exists (select * from 借阅,图书
where 借阅.读者编号=读者.读者编号 and 图书.图书编号=借阅.图书编号
and 书名='数据结构')

go
select * from 读者
where exists (select * from 借阅
where exists (select * from 图书
where 借阅.读者编号=读者.读者编号 and 图书.图书编号=借阅.图书编号
and 书名='数据结构'))
go
select 读者.* from 读者,借阅,图书
where 借阅.读者编号=读者.读者编号 and 图书.图书编号=借阅.图书编号
and 书名='数据结构'
go
select *  from 读者
where 读者编号 in (
select 读者编号 from 借阅 where 图书编号
in ( select 图书编号
from 图书 where 书名='数据结构') 
)
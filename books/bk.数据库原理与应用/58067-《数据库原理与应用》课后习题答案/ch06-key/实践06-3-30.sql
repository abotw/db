select 读者编号,姓名,单位 from 读者 where 单位='管理学院'
go
select 单位,count(*) from 读者 where 单位='管理学院' group by 单位

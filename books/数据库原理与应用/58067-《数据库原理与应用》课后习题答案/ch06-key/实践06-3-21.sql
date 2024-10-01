select * from 读者
where not exists (select * from 借阅 
 where 读者编号=读者.读者编号)
go --或者
select * from 读者
where 读者编号 not in (select 读者编号 from 借阅)
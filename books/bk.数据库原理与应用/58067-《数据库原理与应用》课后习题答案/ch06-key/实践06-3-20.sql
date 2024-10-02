Select * from 读者 where exists (select * from 借阅 where 读者编号=读者.读者编号)
--或
Select * from 读者 where 读者编号 in (select 读者编号 from 借阅)

select 读者.读者编号,读者.姓名,借阅.图书编号,借阅.借书日期 
from 读者,借阅
where 读者.读者编号=借阅.读者编号 and 借阅.图书编号='TP0001' 
and 借阅.借书日期>=all(select 借书日期 from 借阅 where 图书编号='TP0001')
go
--或者，但不建议使用
select top 1 读者.读者编号,读者.姓名,借阅.图书编号,借阅.借书日期 
from 读者,借阅
where 读者.读者编号=借阅.读者编号 and 借阅.图书编号='TP0001' 
order by 读者.读者编号 desc
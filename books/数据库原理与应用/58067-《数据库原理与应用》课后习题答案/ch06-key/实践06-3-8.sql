Select top 3 读者.读者编号,借书日期 
from 借阅,读者,图书 
where 借阅.读者编号=读者.读者编号
and 借阅.图书编号=图书.图书编号
/* and 书名='C程序设计'*/ order by 借书日期 desc
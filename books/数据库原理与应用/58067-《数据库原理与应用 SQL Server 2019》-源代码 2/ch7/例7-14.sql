declare @num money
set @num = 1234.56
select convert(varchar(50), @num, 0)  --不显示千位分隔符，小数点右侧取两位数
select convert(varchar(50), @num, 1)  --显示千位分隔符，小数点右侧取两位数
select convert(varchar(50), @num, 2)  --不显示千位分隔符，小数点右侧取四位数

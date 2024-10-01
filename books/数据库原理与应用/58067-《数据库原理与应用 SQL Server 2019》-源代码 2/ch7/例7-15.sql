declare @num2 float
set @num2 = 1234.56
select convert(varchar(50), @num2, 0) --最多包含6位值，根据需要使用科学记数法
select convert(varchar(50), @num2, 1) --始终为8位值，始终使用科学记数法
select convert(varchar(50), @num2, 2) --始终为16位值，始终使用科学记数法

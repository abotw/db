use library
go
create table book_shop(
原价 float,
实际应付金额 as
case 
when 原价<=100 then 原价*1
when 原价<=500  then 原价*0.9
else 
原价*0.85
end)


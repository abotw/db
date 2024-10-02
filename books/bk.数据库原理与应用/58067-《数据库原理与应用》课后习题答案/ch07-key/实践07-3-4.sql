use library
go
declare @i tinyint,@j tinyint
set @i=1
while @i<=4
begin 
 set @j=2*@i-1
 print space(20-2*@i)+ replicate('* ',@j)
 set @i=@i+1
end

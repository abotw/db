use library
go
create function dbo.quadsum(@n int)
returns bigint
as
begin
declare @i int,@sum bigint
set @i=1
set @sum=0
while @i<=@n
begin
set @sum=@sum+@i*@i
set @i=@i+1
end
return @sum
end

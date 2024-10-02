use library
go
create function dbo.discount(@x float)
returns float
as
begin
declare @y float
set @y=@x*
case 
when @x<=100 then 1
when @x<=500 then 0.9
else
0.85
end 
return @y
end
go
select dbo.discount(119.20)
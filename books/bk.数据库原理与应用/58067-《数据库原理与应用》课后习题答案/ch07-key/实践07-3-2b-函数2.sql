use library
go
create function dbo.discount(@x float)
returns float
as
begin
declare @y float
if @x<=100
set @y=@x
else if @x<=500
set @y=@x*0.9
else
set @y=@x*0.85
return @y
end
go
select dbo.discount(119.20)

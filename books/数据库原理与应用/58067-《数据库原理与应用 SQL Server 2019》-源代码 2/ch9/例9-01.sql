create procedure multi
as
declare @i int,@j int,@out varchar(80)
set @i=1
while @i<=9
begin
 set @out =cast(@i as char(1))+')'
 set @j=1
 while @j<=@i
  begin
   set @out=@out+cast(@i as char(1))+'*'+cast(@j as char(1))+'='+cast(@i*@j as char(2))+space(2)
   set @j=@j+1
  end
  print @out
  set @i=@i+1
end

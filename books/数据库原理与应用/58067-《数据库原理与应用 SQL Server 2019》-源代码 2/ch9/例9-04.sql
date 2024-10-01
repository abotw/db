use jxgl
go
alter proc fact @n int
as
  if @n<100 or @n>999
   print '你输入了的'+cast(@n as varchar(20))+'，请输入3位正数'
  else
   begin
    declare @i int,@j int,@k int
    set @i=@n/100
    set @j=(@n-@I*100)/10
    set @k=@n%10
    if @n=@i*@i*@i+@j*@j*@j+@k*@k*@k
     print cast(@n as char(3))+'是水仙花数'
    else
     print cast(@n as char(3))+'不是水仙花数'
 end

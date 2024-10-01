use library
go
create proc nacrissus
as
declare @n int,@i int,@j int,@k int
 set @n=100
while @n<=999
 begin
    set @i=@n/100
    set @j=(@n-@I*100)/10
    set @k=@n%10
    if @n=@i*@i*@i+@j*@j*@j+@k*@k*@k
     print cast(@n as char(3))+'是水仙花数'
    set @n=@n+1  
 end
 go
exec nacrissus

use jxgl
go
alter proc fact @n int
as
  if @n<100 or @n>999
   print '�������˵�'+cast(@n as varchar(20))+'��������3λ����'
  else
   begin
    declare @i int,@j int,@k int
    set @i=@n/100
    set @j=(@n-@I*100)/10
    set @k=@n%10
    if @n=@i*@i*@i+@j*@j*@j+@k*@k*@k
     print cast(@n as char(3))+'��ˮ�ɻ���'
    else
     print cast(@n as char(3))+'����ˮ�ɻ���'
 end

use jxgl
if exists(select name from sys.objects where name='fact' and type='p')
drop proc fact  --删除已存在的同名存储过程
go
create procedure fact
 @n int,@f int output
 as
  if @n<0
   print '你输入了'+cast(@n as varchar(20))+'，请输入非负数'
  else
   begin
    declare @i int
    set @i=1
    set @f=1
    while @i<=@n
     begin
      set @f=@f*@i
      set @i=@i+1
     end
    print cast(@n as varchar(20))+'的阶乘是：'+cast(@f as varchar(20))
  end

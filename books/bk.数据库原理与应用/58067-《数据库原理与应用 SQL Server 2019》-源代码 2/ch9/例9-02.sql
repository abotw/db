use jxgl
if exists(select name from sys.objects where name='fact' and type='p')
drop proc fact  --ɾ���Ѵ��ڵ�ͬ���洢����
go
create procedure fact
 @n int,@f int output
 as
  if @n<0
   print '��������'+cast(@n as varchar(20))+'��������Ǹ���'
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
    print cast(@n as varchar(20))+'�Ľ׳��ǣ�'+cast(@f as varchar(20))
  end

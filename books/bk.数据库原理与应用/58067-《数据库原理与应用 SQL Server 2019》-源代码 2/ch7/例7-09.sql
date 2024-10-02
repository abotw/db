declare @sum as int
declare @i as smallint
set @sum=0
set @i=0
while @i<=100   /*设置循环执行的条件*/
 begin 
  set @i=@i+1
   if (@i%2)=0  /*判断@i是否被2整除，即判断是否为奇数*/
    continue
   else
    set @sum=@sum+@i
   if @i>=99
    break 
 end   
print '1到100之间的奇数之和为：'
  +convert(char(6),@sum)  /*输出运算结果*/

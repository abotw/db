declare @score float
declare @status int
exec @status = avgscore '19会计（1）班', @score output
-- 检查返回值
if @status = 1
   print'平均成绩:'+ cast(@score as varchar(20))
else
   print '没有对应的记录'

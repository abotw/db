declare @xm char(6), @avgscore float
set @xm='ÍôÊ«Î¢'
exec pro_avg_³É¼¨ @xm,@avgscore output
print @avgscore

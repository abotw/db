use jxgl
declare @f as float
execute fact -3,@f output			--你输入了-3，请输入非负数
print''
execute fact 3,@f output			--3的阶乘是：6

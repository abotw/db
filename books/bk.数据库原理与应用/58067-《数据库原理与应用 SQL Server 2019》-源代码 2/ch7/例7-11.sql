/** 教材中的raiserror语句已过时，请淘汰，建议使用throw语句
【例7-11】在向“选修”表添加数据时，使用抛出异常语句来处理插入语句的插入异常信息。
*/
use jxgl
go
begin try
 insert into 选修(成绩编码,学号,课程号,成绩)
   values(20,'19020104','02',99)
end try 
begin catch
 throw 51000,'成绩编码列上有identity约束，不能人为插入值',1
end catch
/**
7．抛出异常语句
语法格式如下。
throw [{error_number|@local_variable},{message|@local_variable},
       {state|@local_variable}][;]
功能：（在try…catch语句块的catch模块中）抛出异常处理信息。
说明：
（1）error_number|@local_variable：指定异常消息的标识号，可取值50000~2147483647之间的常量或变量，其数据类型为int；
（2）message|@local_variable：指定异常消息的描述文本，可取字符串长度最大值为2048，其数据类型为nvarchar(n)。
（3）state|@local_variable：指定异常消息的状态码，可取值0~255之间的常量或变量，其数据类型为tinyint。
*/
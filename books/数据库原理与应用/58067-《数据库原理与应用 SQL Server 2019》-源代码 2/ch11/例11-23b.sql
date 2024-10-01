use jxgl
--验证数据库用户sqlloginT_U的select权限
select 学号,姓名 from 学生 where 籍贯='安徽'
--授予sqlloginS_U第三方权限
grant select on 学生(学号,姓名,籍贯) to sqlloginS_U as TS_role

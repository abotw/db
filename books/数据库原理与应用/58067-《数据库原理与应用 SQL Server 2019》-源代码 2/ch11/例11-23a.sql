use jxgl
go
create role TS_role                                  --创建数据库角色'TS_role'
alter role TS_role add member sqlloginT_U        --添加数据库用户成员
go
grant select on 学生(学号,姓名,籍贯) to TS_role    --授予数据库角色select权限
 with grant option                                    --允许授予第三方权限

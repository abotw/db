use jxgl
go
create login sqlloginT with password='123456'
create login sqlloginS with password='123456'
go
create user sqlloginT_U for login sqlloginT
create user sqlloginS_U for login sqlloginS
go
grant select on Ñ¡ÐÞ to sqlloginT_U,sqlloginS_U
grant update on Ñ¡ÐÞ(³É¼¨) to sqlloginT_U

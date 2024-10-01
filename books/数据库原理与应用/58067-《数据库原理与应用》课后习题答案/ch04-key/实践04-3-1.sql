create database lx
on
(name=lx_data,filename='d:\stu\lx_data.mdf',size=5,maxsize=10,filegrowth=1),
filegroup dx(
name=sx_data,filename='d:\stu\sx_data.mdf')
log on
(name=lx_log,filename='d:\stu\lx_log.ldf',size=2,maxsize=10,filegrowth=5%)

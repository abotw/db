use master
go
create database library
on(
name=lib_data,
filename='d:\lib\lib_data.mdf')
log on(
name=lib_log,
filename='d:\lib\lib_log.ldf')

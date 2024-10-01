create database library
on(
name=lib_data,
filename='d:\stud\lib_data.mdf'),
(name=liba_data,
filename='d:\stud\liba_data.ndf'
),
filegroup group2
(name=libb_data,
filename='d:\stud\libb_data.ndf'),
filegroup group3
(name=libc_data,
filename='d:\stud\libc_data.ndf'),
filegroup group4
(name=libd_data,
filename='d:\stud\libd_data.ndf')
log on(
name=liba_log,
filename='d:\stud\liba_log.ldf'),
(
name=libb_log,
filename='d:\stud\libb_log.ldf')

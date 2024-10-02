create database test4
on primary 
(name=test4a_data,filename='d:\test\test4a.mdf'),
filegroup group1 
(name=test4b_data,filename='d:\test\test4b.ndf')
log on 
(name='test4a_log',filename='d:\test\test4a_log.ldf',maxsize=10,filegrowth=5%),
(name='test4b_log',filename='d:\test\test4b_log.ldf',maxsize=10,filegrowth=5%)

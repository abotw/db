create database test3
  on (name=test3_data,filename='d:\test\test3.mdf',
     size=100,maxsize=unlimited,filegrowth=10)
  log on (name='test3_log',filename='d:\test\test3_log.ldf',
     size=50,maxsize=100,filegrowth=5%)

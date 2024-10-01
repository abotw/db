create table 班级(
班级号 char(6)constraint pk_班级 primary key , 
班级名称 varchar(20),
班级人数 tinyint,
学制 char(1) constraint df_班级_学制 default '4',
招生性质 char(4))
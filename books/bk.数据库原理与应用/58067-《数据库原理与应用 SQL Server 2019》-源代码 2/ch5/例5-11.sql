use jxgl
alter table 学生 
add 邮政编码 char(6) 
  constraint Ck_学生_邮政编码 check(邮政编码 like '2306[0-9][0-9]')

use jxgl
alter table 选修 
  add constraint Fk_选修_课程号 foreign key(课程号) references 课程(课程号)

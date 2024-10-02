use jxgl
alter table 班级 with nocheck
  add constraint Ck_班级_班级人数 check(班级人数>=40 and 班级人数<=60)

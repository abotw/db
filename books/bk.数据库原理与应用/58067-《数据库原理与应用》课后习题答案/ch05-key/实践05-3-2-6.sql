alter table 借阅
 add constraint df_借阅_借书日期
 default getdate() for 借书日期

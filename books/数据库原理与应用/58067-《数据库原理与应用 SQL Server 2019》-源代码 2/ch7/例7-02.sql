use jxgl
declare @avgscore float,@sumscore float
select @avgscore=avg(成绩),@sumscore=sum(成绩)
 from 学生,选修
where 学生.学号=选修.学号
 and 性别='男'
select  @avgscore,@sumscore

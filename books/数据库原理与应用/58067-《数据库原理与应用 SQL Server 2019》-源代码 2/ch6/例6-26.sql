--语句1：
select stu.*,score.* from stu,score  			  --所影响的行数为 50 行
go
--语句2：
select stu.*,score.* from stu cross join score    --所影响的行数为 50 行

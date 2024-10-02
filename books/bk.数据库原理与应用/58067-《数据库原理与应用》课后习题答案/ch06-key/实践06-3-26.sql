select * from ¶ÁÕß
where  ¶ÁÕß±àºÅ in (select ¶ÁÕß±àºÅ from ½èÔÄ
group by ¶ÁÕß±àºÅ having count(*)>=2)

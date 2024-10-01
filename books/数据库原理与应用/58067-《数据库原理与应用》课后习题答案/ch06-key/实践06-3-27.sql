select Í¼Êé±àºÅ,ÊéÃû from Í¼Êé
where  Í¼Êé±àºÅ in (select Í¼Êé±àºÅ from ½èÔÄ
group by Í¼Êé±àºÅ having count(*)>=2)

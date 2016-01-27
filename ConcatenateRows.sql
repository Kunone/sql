select accref,

		STUFF(

		(select ',' + accountid from tb_accountmaster ac_sub where ac_sub.accref=ac.accref
			for XML PATH(''))

			, 1,1,'') as accountids

from tb_accountmaster ac
where status<>'D' and isnull(clientid,'') <> ''
group by accref having count(distinct(accountid))>=2
order by 1


select accref,

		STUFF(

		(select ', '+accountid from
		 (select distinct(accountid) from tb_accountmaster ac_sub where ac_sub.accref=ac.accref) ac_sub2
			for XML PATH(''))

			, 1,2,'') as accountids

from tb_accountmaster ac
where status<>'D' and isnull(clientid,'') <> ''
group by accref having count(distinct(accountid))>=2
order by 1


select ','+accountid from
(select distinct(accountid) from tb_accountmaster where accref='001FF027') ac
for XML PATH('')

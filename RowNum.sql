

SELECT row_number() OVER(PARTITION BY eSalesAccountId ORDER BY [lastUpdatedDate] desc) as RowNum, eSalesAccountId, lastUpdatedDate
from vw_AccountMaster (nolock) where isnull(eSalesAccountId,'')<>''


CREATE TABLE AAPL_2017 (

	Date		TEXT PRIMARY KEY,
	Open		DECIMAL(12,2),
	High		DECIMAL(12,2),
	Low			DECIMAL(12,2),
	Close		DECIMAL(12,2),
	Volume	NUMERIC
);


--count the number of days when AAPLE close price is between 95 and 100
create table price_bt_95_100_5 as
select count(*) as num_of_days
-- select count(Date)
from Wiki_AAPL
where close between 95 and 100
--or where close between '95' and '100' if 95 and 100 are texts
--or where close >= 95 and Close <= 100
--
;


-- create daily price volatility
Select high, low, round((high-low)/([open]+[close])*2,2) as vol from [dbo].[WIKI_AAPL]

select high, low, Cast(format(round((high-low)/([open]+[close])*2,2) *100, 'N2') as varchar) + '%' as vol
from [dbo].[WIKI_AAPL]

;


-- calculate the average closing price of each month
select SUBSTRING([date],6,2) as Month, format(avg([close]),'N2') as avg_cp FROM [dbo].[WIKI_AAPL]
GROUP BY SUBSTRING([date],6,2)

;

-- quert the 8th and 9th records from APPL table
SELECT TOP 2 * from  (SELECT TOP 9 * From [dbo].[WIKI_AAPL] order by [date] asc) annyTable
order by [date] desc

with annyTable as  (
  select ROW_NUMBER() over ( order by [dbo].[WIKI_AAPL].[date] desc) as row, * from [dbo].[WIKI_AAPL] 
)

select * from annyTable where row in ( 8, 9, 100)
;



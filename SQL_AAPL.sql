-- Q#1

CREATE TABLE AAPL_2017 (
-- Both `Date` and Date are correct when defining/referencing a column
-- primary key definition is suggested yet optional
	Date		TEXT PRIMARY KEY,
	Open		DECIMAL(12,2),
	High		DECIMAL(12,2),
	Low			DECIMAL(12,2),
	Close		DECIMAL(12,2),
	Volume	NUMERIC
);

-- Then import the data from .csv file using SqliteStudio Import Function


-- Q#2
create table price_bt_95_100_5 as
select count(*) as num_of_days
-- select count(Date)
from Wiki_AAPL
-- if you import close as numeric/decimal then 95/100; if text then '95'/'100'
where close between 95 and 100
--where close between '95' and '100'
--
-- method #2
--where close >= 95 and Close <= 100
--
-- method #3  (not working)
--where 95 <= Close <=100 
--where close >= 95 or close <=100
;

-- Q#3
create table price_vol_round_3 as
-- (my method)
-- better give a game to the new variable!
select high, low, 
--round((high-low)/(open+close)*2,2) as vol
--
--Cast(round((high-low)/(open+close)*2,2) *100 as varchar) || '%' as vol
--
--printf("%.2f%", (high-low)/(open+close)*2*100) as vol
--
--(high-low)/(open+close)*2 as vol
--
-- method #1 (not good enough; gap =/= vol)
--select high, low, high-low as vol
--
--method #2 (decent!)
-- select high, low, high/low-1 as vol
--
-- method #3 (incorrect)
--select open, close, (close-open)/close as vol

from wiki_AAPL
;


-- Q#4

create table avg_cp as
select strftime('%m', date) as Month,
printf("%.2f", avg(close)) as avg_cp,
-- avg(close) as avg_cp,
-- round(avg(close),2) as avg_cp,
-- someone used sum()/count(), technically also correct
printf("%.0f",avg(volume)) as avg_vol
from wiki_aapl
group by month
-- if you didn't define alias Month up front, you have to use "group by strftime('%m', date)" here
order by month
-- optional
;

-- Q#5
create table limit_query as
select * 
from wiki_AAPL
-- from the 8th record and get 2 records
limit 7,2
;



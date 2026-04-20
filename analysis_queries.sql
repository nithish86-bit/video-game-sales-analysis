SELECT *
FROM [dbo].[sql sol(video_game_sales)];

EXEC sp_rename 'dbo.[sql sol(video_game_sales)]', 'VideoGames';

create procedure v as
begin
select * from videogames
end

/*1 Retrieve the total sales for each genre, sorted in descending order. (7 Marks)
Hint:
Aggregate Total Sales by Genre. Sort by Total Sales in desc order.
Output should contain Genre name along with Total Sales
Total Sales = NA_Sales + EU_SALES + JP_Sales + Other_Sales.*/
v

select genre,sum(NA_Sales + EU_SALES + JP_Sales + Other_Sales) as total_sales
from videogames
group by genre
order by genre desc

select genre,sum(total_global_Sles) as total_sales
from videogames
group by genre
order by genre desc
/*2 Find the top 3 genres for each decade based on total sales. (7 Marks)
Hint:
Use CASE WHEN to create decade bins using date column.
Aggregate Total Sales by Decade and Genre.
Use Window Rank functions to find top 3 Genres of each decade.
Total Sales = NA_Sales + EU_SALES + JP_Sales + Other_Sales.*/
v

with cte as(select genre,
case when publish_year between '2000-01-01' and '2009-12-31' then'2000s'
when publish_year between '1980-01-01' and '1989-12-31' then'1980s'
when publish_year between '1990-01-01' and '1999-12-31' then '1990s'
else '2010s'
end as decade,
(NA_Sales + EU_SALES + JP_Sales + Other_Sales) as tot_sal
from videogames),
agg as(select genre,decade,sum(tot_sal)as tot_sales
from cte
group by genre,decade),

ranked as(select *, dense_rank()over(partition by decade order by tot_sales desc) as rnk
from agg)
select * from ranked
where rnk<=3


/*3. Calculate the percentage contribution of each genre to total global sales. (8 Marks)
Hint:
Aggregate Total Sales by each Genre.
Calculate Total Sales using Sub-query and Calculate the percentage contribution by Genre.
Total Sales = NA_Sales + EU_SALES + JP_Sales + Other_Sales.*/
v

with genre_sale as(select genre,sum(NA_Sales + EU_SALES + JP_Sales + Other_Sales) as total_sales
from videogames
group by genre)
select genre,total_sales,
(total_sales*100.0/sum(total_sales) over()) as percent_con
from genre_sale

/*4. Identify the least popular genre in terms of total sales and the number of games released. (8 Marks)
Hint:
Aggregate Total Sales by genre and get the genre in the output having the least sales.
Aggregate by Total Games by genre and get the genre in the output having the least count.
Append both these outputs.
Total Sales = NA_Sales + EU_SALES + JP_Sales + Other_Sales.*/
 v
with sales_cte as(select genre,sum(NA_Sales + EU_SALES + JP_Sales + Other_Sales) as tot_sale
from videogames
group by genre),

count_cte as(select genre,count(*) as count_genre
from videogames
group by genre)

select genre,
tot_sale as value,
'least sales' as category
from sales_cte
where tot_sale=(select min(tot_sale) from sales_cte)

union

select genre,
count_genre as value,
'least sales' as category
from count_cte
where count_genre=(select min(count_genre) from count_cte)







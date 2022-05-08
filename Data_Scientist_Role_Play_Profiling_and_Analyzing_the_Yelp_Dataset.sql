

Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000 
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000 
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000 (id)
vi. Checkin = 493
vii. Photo = 10000
viii. Tip = 3979 (business_id)
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no
	
	
	SQL code used to arrive at answer:
	
select * 
from user u
where id is null OR
name is null OR
review_count is null OR
yelping_since is null OR
useful is null OR
funny is null OR
cool is null OR
fans is null OR
average_stars is null OR
compliment_hot is null OR
compliment_more is null OR
compliment_profile is null OR
compliment_cute is null OR
compliment_list is null OR
compliment_note is null OR
compliment_plain is null OR
compliment_cool is null OR
compliment_funny is null OR
compliment_writer is null OR
compliment_photos is null
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:	1	max: 5		avg: 3.7082
		
	ii. Table: Business, Column: Stars
	
		min:	1	max:	5	avg: 3.6549
	
	iii. Table: Tip, Column: Likes
	
		min:	0	max:	2	avg: 0.0144
	
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	53	avg: 1.9414
	
	v. Table: User, Column: Review_count
	
		min:	0	max:	2000	avg: 24.2995


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
	select b.city,count(r.id) as Reviews_Count
	from review r inner join business b on r.business_id=b.id
	group by b.city
	order by Reviews_Count desc

	Copy and Paste the Result Below:
	
+-----------------+---------------+
| city            | Reviews_Count |
+-----------------+---------------+
| Las Vegas       |           193 |
| Phoenix         |            65 |
| Toronto         |            51 |
| Scottsdale      |            37 |
| Henderson       |            30 |
| Tempe           |            28 |
| Pittsburgh      |            23 |
| Chandler        |            22 |
| Charlotte       |            21 |
| MontrÃ©al        |            18 |
| Madison         |            16 |
| Gilbert         |            13 |
| Mesa            |            13 |
| Cleveland       |            12 |
| North Las Vegas |             6 |
| Edinburgh       |             5 |
| Glendale        |             5 |
| Lakewood        |             5 |
| Cave Creek      |             4 |
| Champaign       |             4 |
| Markham         |             4 |
| North York      |             4 |
| Mississauga     |             3 |
| Surprise        |             3 |
| Avondale        |             2 |
+-----------------+---------------+
(Output limit exceeded, 25 of 67 total rows shown)
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

select stars as 'Star Rating',count(stars) as 'Star_Count'
from business
where city='Avon'
group by stars
order by stars desc


Copy and Paste the Resulting Table Below (2 columns - star rating and count):

+-------------+------------+
| Star Rating | Star_Count |
+-------------+------------+
|         5.0 |          1 |
|         4.5 |          1 |
|         4.0 |          2 |
|         3.5 |          3 |
|         2.5 |          2 |
|         1.5 |          1 |
+-------------+------------+





ii. Beachwood

SQL code used to arrive at answer:

select stars as 'Star Rating',count(stars) as 'Star_Count'
from business
where city='Beachwood'
group by stars
order by stars desc

Copy and Paste the Resulting Table Below (2 columns - star rating and count):
		
+-------------+------------+
| Star Rating | Star_Count |
+-------------+------------+
|         5.0 |          5 |
|         4.5 |          2 |
|         4.0 |          1 |
|         3.5 |          2 |
|         3.0 |          2 |
|         2.5 |          1 |
|         2.0 |          1 |
+-------------+------------+


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
select id,name,review_count
from user
order by review_count desc
limit 3

		
	Copy and Paste the Result Below:
+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+

8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	
Posing more reviews do not correlate with more fans.

For example Amy has the most fans with 503 person but her review count is well below the maximum review count.

Another example is, G has one fan but he has 27 review which is more than the average of review count by 3 point.


+------+--------------+------+
| name | review_count | fans |
+------+--------------+------+
| Amy  |           609| 503  |
| G    |            27|  1   |
+------+--------------+------+

9. Are there more reviews with the word "love" or with the word "hate" in them?
	Answer: Love word is used more than hate word.
+------------+
| Love_Count |
+------------+
|       1780 |
+------------+
+------------+
| Hate_Count |
+------------+
|        232 |
+------------+
	
	SQL code used to arrive at answer:

select count(id) as Love_Count
from review
where text like '%love%'

select count(id) as Hate_Count
from review
where text like '%hate%'
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:

select id,name,fans
from user
order by fans desc
limit 10

	Copy and Paste the Result Below:
+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+		
Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
City=Phoenix / Category=Restaurants

i. Do the two groups you chose to analyze have a different distribution of hours?
+---------+-------+-------------+-------------+
| city    | stars | hours       | Hours_Count |
+---------+-------+-------------+-------------+
| Phoenix |   4.5 | 11:00-18:00 |           6 |
| Phoenix |   4.5 | 13:00-16:00 |           1 |
| Phoenix |   4.0 | 11:00-22:00 |           7 |
| Phoenix |   3.0 | 09:00-00:00 |           1 |
| Phoenix |   3.0 | 09:00-02:00 |           1 |
| Phoenix |   3.0 | 11:00-00:00 |           3 |
| Phoenix |   3.0 | 11:00-20:00 |           2 |
| Phoenix |   2.0 | 05:00-00:00 |           2 |
| Phoenix |   2.0 | 05:00-23:00 |           5 |
+---------+-------+-------------+-------------+

ii. Do the two groups you chose to analyze have a different number of reviews?

+---------+-------+--------------+
| city    | stars | Review_Count |
+---------+-------+--------------+
| Phoenix |   4.5 |           49 |
| Phoenix |   4.0 |         3017 |
| Phoenix |   3.0 |          420 |
| Phoenix |   2.0 |           56 |
+---------+-------+--------------+
      
   
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
+---------+-------+----------+
| city    | stars | latitude |
+---------+-------+----------+
| Phoenix |   5.0 |       77 |
| Phoenix |   4.5 |       28 |
| Phoenix |   4.0 |       64 |
| Phoenix |   3.0 |       63 |
| Phoenix |   2.0 |       21 |
+---------+-------+----------+











SQL code used for analysis:
i.
select b.city,b.stars,substr(h.hours,-11) hours,
--removing weekdays from the data only getting hours
count(b.id) Hours_Count
from business b inner join category c on b.id=c.business_id
inner join hours h on b.id=h.business_id
where c.category='Restaurants' and b.city='Phoenix'
and (b.stars between 2 and 3 or b.stars between 4 and 5)
group by city,stars,hours
order by stars desc

ii.

select b.city,b.stars,sum(review_count) as Review_Count
from business b inner join category c on b.id=c.business_id
inner join hours h on b.id=h.business_id
where c.category='Restaurants' and b.city='Phoenix'
and (b.stars between 2 and 3 or b.stars between 4 and 5)
group by city,stars
order by stars desc

iii.		
select b.city,b.stars,count(substr(latitude,1,3)) as latitude
from business b inner join category c on b.id=c.business_id
inner join hours h on b.id=h.business_id
where  b.city='Phoenix'
and (b.stars between 2 and 3 or b.stars between 4 and 5)
group by city,stars
order by stars desc
	
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
     
There are 1520 closed and 8480 open businesses. There is a huge gap between open and closed ones.
         
ii. Difference 2:
         
Majority of open restaurants consist of mostly 3-5 star restaurants.

Open restaurants with stars 1-3 are quite lower than 3-5 star restaurants.
+-----------------+-------+
| Open_Businesses | stars |
+-----------------+-------+
|            1427 |   5.0 |
|            1249 |   4.5 |
|            1679 |   4.0 |
|            1483 |   3.5 |
|            1124 |   3.0 |
|             722 |   2.5 |
|             472 |   2.0 |
|             182 |   1.5 |
|             142 |   1.0 |
+-----------------+-------+
         
SQL code used for analysis:

	Difference 1:
select count(is_open) Open_Businesses -- for open ones
from business
where is_open=1

select count(is_open) Closed_Businesses -- for closed ones
from business
where is_open=0

	Difference 2:
select count(is_open) Open_Businesses,stars -- for open ones
from business
where is_open=1
group by stars
order by stars desc
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         
Determine if there is a connection between total yelping years, number of people yelping in those years and their average review numbers.

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

I came to the following conclusions:        
â€¢	Majority of people star yelping after 2010. People starting yelping between 2005-2009 only make up %10 percent of all data. So the interest have grown highly after 2010 for yelp.
â€¢	People who are yelping for 7 to 15 years also are yelping the most according to the average reviews.           
                  






iii. Output of your finished dataset:
+---------------+--------------------------+----------------+
| Yelping_Years | Number_of_People_Yelping | Average_Review |
+---------------+--------------------------+----------------+
|            17 |                       13 |            204 |
|            16 |                       49 |            605 |
|            15 |                      133 |           1170 |
|            14 |                      273 |           1697 |
|            13 |                      513 |           2377 |
|            12 |                      801 |           2833 |
|            11 |                     1233 |           3560 |
|            10 |                     1282 |           2833 |
|             9 |                     1369 |           2353 |
|             8 |                     1541 |           1999 |
|             7 |                     1438 |           1862 |
|             6 |                     1019 |            816 |
|             5 |                      336 |            197 |
+---------------+--------------------------+----------------+         
         
iv. Provide the SQL code you used to create your final dataset:

select ((2022- strftime('%Y',yelping_since))) as Yelping_Years, -- Getting difference between 2022 and yelping starting year
count(((2022- strftime('%Y',yelping_since))) ) as Number_of_People_Yelping
,sum(review_count)/((2022- strftime('%Y',yelping_since))) Average_Review
from user
group by Yelping_Years
order by Yelping_Years  desc

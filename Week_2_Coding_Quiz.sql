--Question 1
  --Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.
select *
from tracks
where Milliseconds>5000000

  --Answer
  
  --  +---------+-------------------------+---------+-------------+---------+----------+--------------+------------+-----------+
  --| TrackId | Name                    | AlbumId | MediaTypeId | GenreId | Composer | Milliseconds |      Bytes | UnitPrice |
  --+---------+-------------------------+---------+-------------+---------+----------+--------------+------------+-----------+
  --|    2820 | Occupation / Precipice  |     227 |           3 |      19 |     None |      5286953 | 1054423946 |      1.99 |
  --|    3224 | Through a Looking Glass |     229 |           3 |      21 |     None |      5088838 | 1059546140 |      1.99 |
  --+---------+-------------------------+---------+-------------+---------+----------+--------------+------------+-----------+
  
  --Question 2
  
  --Find all the invoices whose total is between $5 and $15 dollars.
  
  select * 
  from invoices
  where total between 5 and 15
  order by total desc
  
   --Answer
   
--   +-----------+------------+---------------------+-------------------------+-------------+--------------+----------------+-------------------+-------+
--| InvoiceId | CustomerId | InvoiceDate         | BillingAddress          | BillingCity | BillingState | BillingCountry | BillingPostalCode | Total |
--+-----------+------------+---------------------+-------------------------+-------------+--------------+----------------+-------------------+-------+
--|       193 |         37 | 2011-04-23 00:00:00 | Berger Straße 10        | Frankfurt   |         None | Germany        | 60316             | 14.91 |
--|         5 |         23 | 2009-01-11 00:00:00 | 69 Salem Street         | Boston      |           MA | USA            | 2113              | 13.86 |
--|        12 |          2 | 2009-02-11 00:00:00 | Theodor-Heuss-Straße 34 | Stuttgart   |         None | Germany        | 70174             | 13.86 |
--|        19 |         40 | 2009-03-14 00:00:00 | 8, Rue Hanovre          | Paris       |         None | France         | 75002             | 13.86 |
--|        26 |         19 | 2009-04-14 00:00:00 | 1 Infinite Loop         | Cupertino   |           CA | USA            | 95014             | 13.86 |
--|        33 |         57 | 2009-05-15 00:00:00 | Calle Lira, 198         | Santiago    |         None | Chile          | None              | 13.86 |
--|        40 |         36 | 2009-06-15 00:00:00 | Tauentzienstraße 8      | Berlin      |         None | Germany        | 10789             | 13.86 |
--|        47 |         15 | 2009-07-16 00:00:00 | 700 W Pender Street     | Vancouver   |           BC | Canada         | V6C 1G8           | 13.86 |
--|        54 |         53 | 2009-08-16 00:00:00 | 113 Lupus St            | London      |         None | United Kingdom | SW1V 3EN          | 13.86 |
--|        61 |         32 | 2009-09-16 00:00:00 | 696 Osborne Street      | Winnipeg    |           MB | Canada         | R3L 2B9           | 13.86 |
--+-----------+------------+---------------------+-------------------------+-------------+--------------+----------------+-------------------+-------+
--(Output limit exceeded, 10 of 168 total rows shown)


  --Question 3
  
  --Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
  
select * 
from customers
where state in ('RJ','DF','AB','BC','CA','WA','NY')
  
   --Answer
   
--   +------------+-----------+----------+-----------------------+---------------------------+----------------+-------+---------+------------+--------------------+--------------------+-------------------------------+--------------+
--| CustomerId | FirstName | LastName | Company               | Address                   | City           | State | Country | PostalCode | Phone              | Fax                | Email                         | SupportRepId |
--+------------+-----------+----------+-----------------------+---------------------------+----------------+-------+---------+------------+--------------------+--------------------+-------------------------------+--------------+
--|         12 | Roberto   | Almeida  | Riotur                | Praça Pio X, 119          | Rio de Janeiro | RJ    | Brazil  | 20040-020  | +55 (21) 2271-7000 | +55 (21) 2271-7070 | roberto.almeida@riotur.gov.br |            3 |
--|         13 | Fernanda  | Ramos    | None                  | Qe 7 Bloco G              | Brasília       | DF    | Brazil  | 71020-677  | +55 (61) 3363-5547 | +55 (61) 3363-7855 | fernadaramos4@uol.com.br      |            4 |
--|         14 | Mark      | Philips  | Telus                 | 8210 111 ST NW            | Edmonton       | AB    | Canada  | T6G 2C7    | +1 (780) 434-4554  | +1 (780) 434-5565  | mphilips12@shaw.ca            |            5 |
--|         15 | Jennifer  | Peterson | Rogers Canada         | 700 W Pender Street       | Vancouver      | BC    | Canada  | V6C 1G8    | +1 (604) 688-2255  | +1 (604) 688-8756  | jenniferp@rogers.ca           |            3 |
--|         16 | Frank     | Harris   | Google Inc.           | 1600 Amphitheatre Parkway | Mountain View  | CA    | USA     | 94043-1351 | +1 (650) 253-0000  | +1 (650) 253-0000  | fharris@google.com            |            4 |
--|         17 | Jack      | Smith    | Microsoft Corporation | 1 Microsoft Way           | Redmond        | WA    | USA     | 98052-8300 | +1 (425) 882-8080  | +1 (425) 882-8081  | jacksmith@microsoft.com       |            5 |
--|         18 | Michelle  | Brooks   | None                  | 627 Broadway              | New York       | NY    | USA     | 10012-2612 | +1 (212) 221-3546  | +1 (212) 221-4679  | michelleb@aol.com             |            3 |
--|         19 | Tim       | Goyer    | Apple Inc.            | 1 Infinite Loop           | Cupertino      | CA    | USA     | 95014      | +1 (408) 996-1010  | +1 (408) 996-1011  | tgoyer@apple.com              |            3 |
--|         20 | Dan       | Miller   | None                  | 541 Del Medio Avenue      | Mountain View  | CA    | USA     | 94040-111  | +1 (650) 644-3358  | None               | dmiller@comcast.com           |            4 |
--+------------+-----------+----------+-----------------------+---------------------------+----------------+-------+---------+------------+--------------------+--------------------+-------------------------------+--------------+

 --Question 4
  
  --Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00. What was the invoice date for invoice ID 315?
  
select *
from invoices 
where customerid in ('56','58')
and total between 1 and 5 and InvoiceId ='315'
  
   --Answer -> 10-27-2012
   
 --Question 5
  
  -- Find all the tracks whose name starts with 'All'.
   --While only 10 records are shown, the query will indicate how many total records there are for this query - enter that number below.
  
Select * 
from tracks 
where name like 'All%'
  
   --Answer -> 15
   
   
 --Question 6
  
  -- Find all the customer emails that start with "J" and are from gmail.com.
  --Enter the one email address returned (you will likely need to scroll to the right) below.
  
Select * 
from tracks 
where name like 'All%'
  
   --Answer -> jubarnett@gmail.com
   
   
   
 --Question 7
  
  -- Find all the customer emails that start with "J" and are from gmail.com.
  -- What is the total invoice amount of the first record returned? Enter the number below without a $ sign. 
  -- Remember to sort in descending order to get the correct answer.
  
select * 
from invoices 
where billingcity in ('Brasília','Edmonton','Vancouver')
order by invoiceid desc
  
   --Answer -> 13.86
   
   
 --Question 8
  
  -- Find all the customer emails that start with "J" and are from gmail.com.
  -- What is the number of items placed for the 8th person on this list? Enter that number below.
  
select customerid,count(invoiceid) A
from invoices
group by customerid
order by A desc
  
   --Answer -> 7
  
   --Question 9
  
  -- Find the albums with 12 or more tracks.
  -- While the number of records returned is limited to 10, the query, if run correctly, will indicate how many total records there are. Enter that number below.
  
select albumid,
count(name) toplam 
from tracks
group by albumid
having toplam>=12
  
   --Answer -> 158

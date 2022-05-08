   --Question 1
  
  -- Using a subquery, find the names of all the tracks for the album "Californication".
  -- What is the title of the 8th track?
  
SELECT * 
from tracks t where t.albumid in (select albumid from albums 
where albums.title='Californication')
  
   --Answer -> Porcelain

   --Question 2
  
  -- Find the total number of invoices for each customer along with the customer's full name, city and email.
  -- After running the query described above, what is the email address of the 5th person, František Wichterlová? Enter the answer below (feel free to copy and paste).
  
select c.firstname,c.lastname,c.city,c.email,count(i.invoiceid) toplam
from customers c inner join invoices i on c.customerid=i.customerid
group by c.firstname,c.lastname,c.city,c.email
having c.firstname='František'
  
   --Answer -> frantisekw@jetbrains.com

   --Question 3
  
  -- Retrieve the track name, album, artistID, and trackID for all the albums.
  -- What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.
  
SELECT t.name,b.title,a.artistid,t.trackid 
from albums b left join tracks t on b.albumid=t.albumid 
left join artists a on a.artistid=b.artistid
where trackid='12'
  
   --Answer -> Breaking The Rules


   --Question 4
  
  -- Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
  -- After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?
  
select distinct c1.lastname--,c2.lastname
from employees c1 --, employees c2 on c1.reportsto=c2.employeeid
where c1.reportsto=6
  
   --Answer -> Callahan - King
   
   
   --Question 5
  
  -- Find the name and ID of the artists who do not have albums. 
  -- After running the query described above, two of the records returned have the same last name. Enter that name below.
  
select a.name,a.artistid
from artists a left join albums b on a.artistid=b.artistid
where b.albumid is null
  
   --Answer -> Gilberto
   

   --Question 6
  
  -- Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
  -- After running the query described above, determine what is the last name of the 6th record? Enter it below. Remember to order things in descending order to be sure to get the correct answer.
  
SELECT firstname,lastname FROM employees e 
union
SELECT firstname,lastname from customers c 
order by lastname desc
  
   --Answer -> Taylor
   

   --Question 7
  
  -- See if there are any customers who have a different city listed in their billing city versus their customer city.
  -- Indicate your answer below.
  
select c.customerid,c.city,i.billingcity
from customers c left join invoices i on c.customerid=i.customerid
where c.city<>i.billingcity
  
   --Answer -> No customers have a different city listed in their billing city versus customer city.

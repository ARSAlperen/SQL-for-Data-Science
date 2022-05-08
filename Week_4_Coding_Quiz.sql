--Question 1 

  --Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. 
  --Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
  --What is the city and country result for CustomerID 16?
  
  --Query
  select customerid,(firstname || lastname) fullname,
  address,UPPER((city||' '||+country)) MEKAN
  from customers 
  --Answer -> MOUNTAIN VIEW USA
  
  
--Question 2

  --Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. 
  --Make the new field lower case and pull each individual step to show your work.
  --What is the final result for Robert King?
  
  --Query
  select LOWER(substr(firstname,1,4) || substr(lastname,1,2)),
  (firstname || ' ' || lastname)
  from employees
  
  --Answer -> robeki
  
    
--Question 3

  --Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
  --What is the lastname of the last person on the list returned?

  --Query
  select firstname,lastname,strftime('%Y %m %d',hiredate) ,strftime('%Y %m %d','now'),
  (strftime('%Y %m %d',hiredate) -strftime('%Y %m %d','now')) fark
  from employees 
  order by lastname asc
  --Answer -> Peacock
  
--Question 4

  --Profiling the Customers table, answer the following question.
  --Are there any columns with null values? Indicate any below. Select all that apply.

  --Query
  select * from
  customers
  where phone is null
  --Answer -> Fax, Company, Postal Code, and Phone
  
--Question 5

  --Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
  --Select all of the correct "AstridGruber" entries that are returned in your results below. Select all that apply.
  
  --Query
  select city,count(customerid) aa
  from customers 
  group by city
  having aa=2
  --Answer -> AstridGruber273, AstridGruber296, and AstridGruber370
  
  
--Question 6

  --Find the cities with the most customers and rank in descending order.
  --Which of the following cities indicate having 2 customers?
  
  --Query
  select distinct c.firstname || c.lastname ||  d.invoiceid 
  from customers c left join invoices d on c.customerid=d.customerid
  where (c.firstname || c.lastname)='AstridGruber'
  order by firstname,lastname,invoiceid
  --Answer -> Mountain View, São Paulo, and London

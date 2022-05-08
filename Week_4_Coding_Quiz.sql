--Question 1 

  --Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. 
  --Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
  --What is the city and country result for CustomerID 16?
  
  --Query
  select customerid,(firstname || lastname) fullname,
  address,UPPER((city||' '||+country)) MEKAN
  from customers 
  --Answer -> MOUNTAIN VIEW USA
  
  

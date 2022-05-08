   --Question 1
  
  -- Find the albums with 12 or more tracks.
  -- While the number of records returned is limited to 10, the query, if run correctly, will indicate how many total records there are. Enter that number below.
  
select albumid,
count(name) toplam 
from tracks
group by albumid
having toplam>=12
  
   --Answer -> 158

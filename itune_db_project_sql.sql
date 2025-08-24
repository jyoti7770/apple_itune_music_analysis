use itune_db;
# Q1. Who is the senior most employee based on job title?
select * from employee;

select first_name,last_name,title
from employee
order by levels desc
limit 1;

# Q2.Which countries have the most Invoices?

select * from invoice;

select billing_country, count(invoice_id) as Invoices
from invoice
group by billing_country
order by Invoices desc;

# Q3. What are top 3 values of total invoice?

select total as total_invoice
from invoice
order by total_invoice desc
limit 3;

# Q4.Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals.
select * from invoice;
select * from customer;
select c.customer_id,i.billing_city,
sum(i.total) as total_spent 
from customer c join invoice i
on c.customer_id = i.customer_id
group by c.customer_id, i.billing_city
order by total_spent
limit 1;

# Q5.Who is the best customer? The customer who has spent the most money will be declared the best customer.
select c.customer_id,c.first_name,
c.last_name,sum(i.total) total_spent
from customer c join invoice i
on c.customer_id = i.customer_id
group by c.customer_id,c.first_name,c.last_name
order by total_spent
limit 1;

# Q6. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A 

select c.email,c.first_name,c.last_name
,g.name as genre
from customer c
join invoice i
on c.customer_id=i.customer_id
join invoice_line il
on i.invoice_id=il.invoice_id
join track t
on il.track_id=t.track_id
join genre g
on t.genre_id=g.genre_id
where g.name ="Rock"
group by c.email,c.first_name,c.last_name
order by c.email asc;

# Q7.Let's invite the artists who have written the most rock music in our dataset. 
-- Write a query that returns the Artist name and total track count of the top 10 rock bands.
select * from track;

select a.name,count(g.name) as rock_music
from artist a join album al
on a.artist_id=al.artist_id
join track t 
on al.album_id=t.album_id
join genre g 
on t.genre_id=g.genre_id
group by a.artist_id,a.name
order by rock_music desc
limit 10;

# Q8.Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

select name,milliseconds
from track
where milliseconds>(select avg(milliseconds) from track)
order by milliseconds desc;

# Q9.Find how much amount spent by each customer on artists. Write a query to return the customer name, artist name, and total spent.

select concat(c.first_name,' ',c.last_name) as customer_name,ar.name as artist_name,sum(il.unit_price*il.quantity) as total_spent
from customer c join invoice i
on c.customer_id=i.customer_id
join invoice_line il
on i.invoice_id=il.invoice_id
join track t 
on t.track_id=il.track_id
join album a
on a.album_id=t.album_id
join artist ar
on ar.artist_id=a.artist_id
group by c.customer_id,customer_name,artist_name
order by customer_name,total_spent desc;

# Q10.We want to find out the most popular music Genre for each country. 
--  We determine the most popular genre as the genre with the highest amount of purchases. 
--  Write a query that returns each country along with the top Genre. 
--  For countries where the maximum number of purchases is shared return all Genres.
select * from invoice;
select 
    sub.billing_country,
    sub.genrename,
    sub.purchasecount
from (
    select 
        i.billing_country,
        g.Name AS GenreName,
        COUNT(il.invoice_line_id) AS PurchaseCount,
        RANK() OVER (
            PARTITION BY i.billing_country 
            ORDER BY COUNT(il.invoice_line_id) DESC
        ) AS GenreRank
    FROM Invoice i
    JOIN Invoice_Line il 
        ON i.Invoice_id = il.Invoice_Id
    JOIN Track t 
        ON il.Track_Id = t.Track_Id
    JOIN Genre g 
        ON t.Genre_Id = g.Genre_Id
    GROUP BY i.billing_country, g.Genre_Id, g.Name
) sub
WHERE sub.GenreRank = 1
ORDER BY sub.Billing_Country, sub.GenreName;

# Q11. Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how much they spent. 
-- For countries where the top amount spent is shared, provide all customers who spent this amount.

select 
    sub.Country,
    sub.CustomerName,
    sub.TotalSpent
from (
    select 
        c.Country,
        concat(c.First_Name, ' ', c.Last_Name) as CustomerName,
        sum(il.Unit_Price * il.Quantity) as TotalSpent,
        rank() over (
            partition by c.Country
            order by SUM(il.Unit_Price * il.Quantity) desc
        ) as SpendRank
    from Customer c
    join Invoice i 
        on c.Customer_Id = i.Customer_Id
    join Invoice_line il 
        on i.Invoice_Id = il.Invoice_Id
    group by c.Country, c.Customer_Id, c.First_Name, c.Last_Name
) sub
where sub.SpendRank = 1
order by sub.Country, sub.CustomerName;

# Q12. Who are the most popular artists?

select
    c.Country,
    CONCAT(c.First_Name, ' ', c.Last_Name) as CustomerName,
    SUM(il.Unit_Price * il.Quantity) as TotalSpent
from Customer c
join Invoice i 
    on c.Customer_Id = i.Customer_Id
join Invoice_Line il 
    on i.Invoice_Id = il.Invoice_Id
group by c.Country, c.Customer_Id, c.First_Name, c.Last_Name
having TotalSpent = (
    select MAX(sub.TotalSpent)
    from (
        select 
            c2.Country,
            c2.Customer_Id,
            sum(il2.Unit_Price * il2.Quantity) as TotalSpent
        from Customer c2
        join Invoice i2 
            on c2.Customer_Id = i2.Customer_Id
        join Invoice_Line il2 
            on i2.Invoice_Id = il2.Invoice_Id
        where c2.Country = c.Country 
        group by c2.Country, c2.Customer_Id
    ) sub
)
order by c.Country, CustomerName;

#Q13. Which is the most popular song?

select 
    ar.Name as ArtistName,
    COUNT(il.Invoice_Line_Id) as PurchaseCount
from Artist ar
join Album al 
    on ar.Artist_Id = al.Artist_Id
join Track t 
    on al.Album_Id = t.Album_Id
join Invoice_Line il 
    on t.Track_Id = il.Track_Id
group by ar.Artist_Id, ar.Name
order by PurchaseCount desc
limit 10;

# Q14. What are the average prices of different types of music?

select 
    t.Name as TrackName,
    COUNT(il.Invoice_Line_Id) as PurchaseCount
from Track t
join Invoice_Line il 
    on t.Track_Id = il.Track_Id
group by t.Track_Id, t.Name
order by PurchaseCount desc
limit 1;

# Q15. What are the most popular countries for music purchases?
select 
    billing_Country,
    COUNT(Invoice_Id) as PurchaseCount
from Invoice
group by Billing_Country
order by PurchaseCount desc;


























 
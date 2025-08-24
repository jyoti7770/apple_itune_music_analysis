# Apple_Itune_Music_analysis

![image](https://github.com/jyoti7770/apple_itune_music_analysis/blob/main/itune%20img.jpeg)

## Project Overview
This project analyzes a Apple Itune digital music store database using SQL.The main goal is to answer important business questions about customers, employees, sales, and music preferences. I extracted insights about top customers, revenue-generating cities, most popular genres, artists, and songs.

## The Database includes:
-  Customers
-  Employees
-  Invoices
-  Invoice_Items
-  Tracks
-  Albums
-  Artists
-  Genres

## Tools & Technologies
- SQL (MYSQL)

## Schema
``` SQL
use itune_db;
drop table album;
create table album (
album_id int primary key,
title varchar(100),
artist_id int);

select * from album;

create table artist (
artist_id int,
name varchar(100) );

select * from artist;

create table customer (
customer_id	int,
first_name	varchar(25),
last_name	varchar(25),
address	varchar (50),
city	varchar (25),
country	varchar (25),
email	varchar (50),
support_rep_id int );

select * from customer;

create table employee (
employee_id	int,
last_name	varchar(25),
first_name	varchar(25),
title	varchar(25),
reports_to	int,
levels	varchar(2),
birthdate	date,
hire_date	date,
address	varchar(50),
city	varchar(25),
state	varchar (2),
country	varchar (10),
postal_code	varchar(10),
email varchar(25) );

select * from employee;

create table genre (
genre_id int,	
name varchar (25) );

select * from genre;

create table invoice (
invoice_id	int primary key,
customer_id	int,
invoice_date date,
billing_address	varchar(25),
billing_city	varchar(25),
billing_state	varchar(10),
billing_country	varchar(25),
total decimal(10,2) );

select * from invoice;

create table invoice_line (
invoice_line_id	int primary key,
invoice_id	int,
track_id	int,
unit_price	int,
quantity int);

select * from invoice_line;

create table media_type (
media_type_id	int primary key,
name varchar(25));

select * from media_type;

create table playlist (
playlist_id	int primary key,
name varchar(25));

select * from playlist;

create table playlist_track (
playlist_id	int,
track_id int );

select *from playlist_track;

create table track (
track_id	int,
name	varchar(100),
album_id	int,
media_type_id	int,
genre_id	int,
milliseconds	int,
bytes	int,
unit_price int)
```


## Key Business Questions & Queries
### Customer & Employee Analysis
- Q1. Who is the senior-most employee based on job title?

- Q5. Who is the best customer ?

- Q6. List Rock Music listeners .

- Q9. How much did each customer spend on each artist?

- Q11. Top customer by spending in each country.

### Country & City Insights

- Q2. Which countries have the most invoices?

- Q4. Which city has the best customers ?

- Q10. Most popular music genre in each country .

- Q15. Most popular countries for music purchases.

### Sales & Invoice Analysis
- Q3. What are the top 3 invoice totals?

- Q13. Which is the most popular song ?

- Q14. What are the average prices of different types of music?

### Artist & Genre Trends
- Q7. Top 10 rock artists (by number of tracks).

- Q8. Tracks longer than the average song length.

- Q12. Who are the most popular artists (by sales)?

## Insights Derived
- Identified top-spending customers overall and within each country.

- Found the most profitable city & country for targeted events.

- Ranked genres & songs to spot popular listening trends.

- Discovered Rock music fans and created a customer segment list.

- Highlighted top artists by sales and track contributions.

- Compared track durations against the average to filter long compositions.

- Calculated average music prices by type.

## Resolve queries link
**How to run this project:**[Data Analyis](https://github.com/jyoti7770/apple_itune_music_analysis/blob/main/itune_db_project_sql.sql)

  

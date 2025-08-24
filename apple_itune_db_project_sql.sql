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
unit_price int);

select * from track;














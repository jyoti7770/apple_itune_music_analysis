use itune_db;

select * from album;
# to check duplicate value
select album_id,count(*) as count
from album
group by album_id
having count>1;

select * from artist;
# to check duplicate
select artist_id,count(*) as count
from artist
group by artist_id
having count>1;

select * from customer ;
# to check duplicate
select customer_id,count(*) as count
from customer
group by customer_id
having count>1;

select * from employee;
# to check duplicate
select employee_id,count(*) as count
from employee
group by employee_id
having count>1;

select * from genre;
# to check duplicate
select genre_id,count(*) as count
from genre
group by genre_id
having count>1;

select * from invoice;
# to check duplicate

select invoice_id,count(*) as count
from invoice
group by invoice_id
having count>1;

select * from invoice_line;
# to check duplicate
select invoice_line_id,count(*) as count
from invoice_line
group by invoice_line_id
having count>1;

select * from media_type;
select * from playlist;
select * from playlist_track;
# to check duplicate using multiple column
select playlist_id,track_id,count(*) as count
from playlist_track
group by playlist_id,track_id
having count>1;

select * from track;

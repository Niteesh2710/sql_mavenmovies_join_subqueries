use mavenmovies;
-- Q1. Joins Practice
-- Write a query to display customer's first name , last name , email and city they live in??
select customer.first_name,last_name,email,city
 from customer inner join city
 on customer.customer_id=city.city_id;
-- Q3. join(Multiple join)
-- list the customer name , rental date, film title for each rental made. 
-- Include customer who have never rented a film??
select first_name, rental_date, title from customer 
inner join rental on customer.customer_id=rental.rental_id 
inner join film on rental.rental_id=film.film_id;
-- Q5. join(Aliases)
-- Display the first_name, last name ,emails from customers alon with rental date , 
-- film title and rental return date??
select first_name, last_name, email, title, rental_date, return_date 
from customer as C inner join rental as R on 
C.customer_id=R.rental_id inner join film as F on R.rental_id=F.film_id;
-- Q7. join(aggregation)
-- Show the total no. of rentals made by each customer along with their first name and last names??
select first_name, last_name, count(rental_id) from customer inner join rental 
on customer.customer_id=rental.rental_id group by rental_id; 
-- Q9. join(self join)
-- display the customer first name, last name and email along with the 
-- names of the customers living in the same city??
select c.first_name,last_name,email,city from customer as c
, city as b
where c.customer_id = b.city_id;
-- Q2. subquery(single row)
-- Retrieve the film title, description and release year for the film that has longest duration??
select title , description, release_year,rental_duration from film where rental_duration = 
(select max(rental_duration) from film);
-- Q6. subquery(conditional)
-- Retrieve the film titles that are rented by customers whose email domain ends with '.net'??
select title,email from film inner join customer on 
film.film_id=customer.customer_id
where email like "%.org";
select title  from film where film_id in (select customer_id from customer where email like "%.org"); 

 



 

 
 
  

 





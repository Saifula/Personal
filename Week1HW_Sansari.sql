use flights;

-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
-- Show the SQL query(s) that support your conclusion.		Longest distance flight was from JFK to Honolulu. See query below.
-- 
-- 
-- ANSWER: Longest distance flight was from JFK to Honolulu. See query below.

drop temporary table if exists LongestFlight;

create temporary table if not exists
	LongestFlight
as
	select
		flight, origin, dest, max(distance) as 'distance'
	from
		flights
	group by
		flight, origin, dest
	order by
		max(distance) desc
	limit
		1;
        
select
	flight.origin, origins.name as 'OriginAirport', flight.dest, destinations.name as 'DestinationAirport', flight.distance
from
	LongestFlight as flight
join
	airports as origins on flight.origin = origins.faa
join
	airports as destinations on flight.dest = destinations.faa;


-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
-- the most number of seats? Show the SQL statement(s) that support your result.

select engines as 'NumberOfEngines', count(*) as 'NumberOfPlanes', max(seats) as 'NumberOfSeats' from planes group by engines order by engines

-- 3. Show the total number of flights.

select count(*) as 'NumberOfFlights' from flights;

-- 4. Show the total number of flights by airline (carrier).

select flights.carrier, airlines.name, count(*) from flights left join airlines on flights.carrier = airlines.carrier group by carrier;

-- 5. Show all of the airlines, ordered by number of flights in descending order.

select flights.carrier, airlines.name, count(*) from flights left join airlines on flights.carrier = airlines.carrier group by carrier order by count(*) desc;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

select flights.carrier, airlines.name, avg(distance), count(*) from flights left join airlines on flights.carrier = airlines.carrier group by carrier order by count(*) desc limit 5;

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
-- flights in descending order.

select flights.carrier, airlines.name, avg(distance), count(*) from flights left join airlines on flights.carrier = airlines.carrier
where distance >= 1000 group by carrier order by count(*) desc limit 5;


-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
-- write down both the question, and the query that answers the question.
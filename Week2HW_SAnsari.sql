-- loadvideos.sql
USE videodb;

DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS reviews;

CREATE TABLE videos (
	videoid INT PRIMARY KEY,
	title VARCHAR(30) NOT NULL,
	length INT,
	url VARCHAR(100)
  );

INSERT INTO videos(videoid, title, length, url) VALUES (1,'SQL Server Tutorial - Part 1',2605,'https://www.youtube.com/watch?v=2qwd7x17LKQ');
INSERT INTO videos(videoid, title, length, url) VALUES (2,'MySQL Database Tutorial - 1',451,'https://www.youtube.com/watch?v=KgiCxe-ZW8o');
INSERT INTO videos(videoid, title, length, url) VALUES (3,'Oracle Database tutorials 1',533,'https://www.youtube.com/watch?v=0NLsJQCvKXY');

CREATE TABLE reviews (
	videoid INT,
	username VARCHAR(30) NOT NULL,
    rating INT,
    review VARCHAR(512)
  );

INSERT INTO reviews(videoid, username, rating, review) values (1,'Eric',3,'Please use more anotations next time.');
INSERT INTO reviews(videoid, username, rating, review) values (1,'Donna',4,'Thank you, very helpful.');
INSERT INTO reviews(videoid, username, rating, review) values (2,'Nick',4,'Love this free DB!');
INSERT INTO reviews(videoid, username, rating, review) values (2,'Roadie',1,'No support for last version smh');
INSERT INTO reviews(videoid, username, rating, review) values (3,'Jesse',NULL,'Can you please post the next video?');
INSERT INTO reviews(videoid, username, rating, review) values (3,'Matt',3,'Thanks, not much info out there on oracle.');

SELECT videos.*, username, rating, review
FROM videos LEFT JOIN reviews
ON videos.videoid = reviews.videoid
ORDER BY videos.videoid, rating DESC;



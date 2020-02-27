/* Write a query in SQL to find the name and year of the movies.
• Write a query in SQL to find the year when the movie American Beauty released. 
• Write a query in SQL to find the movie which was released in the year 1999
• Write a query in SQL to find the movies which was released before 1998
• Write a query in SQL to find the movie which was released in the year 1999
• Write a query in SQL to return the name of all reviewers and name of movies together in a single 
list
• Write a query in SQL to find the name of all reviewers who have rated 7 or more stars to their 
rating
• Write a query in SQL to find the titles of all movies that have no ratings.
• Write a query in SQL to find the name of all reviewers who have rated their ratings with a NULL 
value
• Write a query in SQL to find the name of movie and director (first and last names) who directed a 
movie that casted a role for 'Eyes Wide Shut'.*/

select MovieTitle,MovieYear from Movie;
select MovieYear from Movie where MovieTitle = 'American Beauty';
select MovieTitle from Movie where MovieYear = '1999';
select MovieTitle from Movie where MovieYear < '1998';
select MovieTitle from Movie where MovieYear = '1999';
select ReviewerName from Reviewer union select MovieTitle from Movie;
select Reviewer.ReviewerName, Rating.ReviewStar from Reviewer, Rating where Rating.ReviewerId = Reviewer.ReviewerId and Rating.ReviewStar > 6;
select Movie.MovieTitle, Rating.ReviewStar FROM Movie, Rating WHERE Movie.MovieId = Rating.MovieId AND Rating.ReviewStar = 0;
select Reviewer.ReviewerId, Rating.Num_O_rating FROM Reviewer, Rating WHERE Reviewer.ReviewerId = Rating.ReviewerId AND Num_O_rating = NULL;
select MovieDirection.DirectorId, Movie.MovieTitle, Director.DirectorFirstName, Director.DirectorLastName FROM Movie, Director, MovieDirection WHERE Movie.MovieId = MovieDirection.MovieId AND MovieTitle = 'Eyes Wide Shut';

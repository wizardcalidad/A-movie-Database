USE movie_base;

CREATE TABLE Movie(
	MovieId					Integer				NOT NULL,
	MovieTitle				Char(50)			NOT NULL,
    MovieYear				Integer				NOT NULL,
    MovieTime				Integer				NULL,
    MovieLanguage			Char(50)			NOT NULL,
    MovieReleaseDate		Date				NOT NULL,
    MovieReleaseCountry		Char(5)				NOT NULL,
    CONSTRAINT				Movie_PK			PRIMARY KEY(MovieId)
);
    
CREATE TABLE Actor (
	ActorId					Integer				NOT NULL,
    ActorFirstName			Char(50)			NOT NULL,
    ActorLastName			Char(50)			NOT NULL,
    ActorGender				Char(1)				NOT NULL,
    CONSTRAINT				Actor_PK			PRIMARY KEY(ActorId)
);

CREATE TABLE MovieCast (
	ActorId					Integer				NOT NULL,
	MovieId					Integer				NOT NULL,
    Role					Char(30)			NOT NULL,
    CONSTRAINT				MovieCast_PK		PRIMARY KEY(MovieId,ActorId),
	CONSTRAINT 		    	Actor_FK 			FOREIGN KEY (ActorId)
							REFERENCES  		Actor (ActorId),
	CONSTRAINT 		    	Movie_FK 			FOREIGN KEY (MovieId)
							REFERENCES  		Movie (MovieId)
);

CREATE TABLE Director (
	DirectorId				Integer				NOT NULL,
    DirectorFirstName		Char(20)			NOT NULL,
    DirectorLastName		Char(20)			NOT NULL,
    CONSTRAINT				Director_PK			PRIMARY KEY(DirectorId)
);

CREATE TABLE MovieDirection (
	DirectorId				Integer				NOT NULL,
    MovieId					Integer				NOT NULL,
    CONSTRAINT				Director_FK			FOREIGN KEY(DirectorId)
							References			Director(DirectorId),
    CONSTRAINT				Movie_FK			FOREIGN KEY(MovieId)
							references			Movie(MovieId)
);

CREATE TABLE Reviewer (
	ReviewerId				Integer				NOT NULL,
    ReviewerName			Char(30)			NOT NULL,
    CONSTRAINT				Reviewer_PK			PRIMARY KEY(ReviewerId)
);

CREATE TABLE Rating (
	MovieId					Integer				NOT NULL,
    ReviewerId				Integer				NOT NULL,
    ReviewStar				Integer				NOT NULL,
    Num_O_rating			Integer				NOT NULL,
    CONSTRAINT				Rating_PK			PRIMARY KEY(MovieId,ReviewerId),
    CONSTRAINT 		    	Movie_FK 			FOREIGN KEY (MovieId)
							REFERENCES			Movie(MovieId),                                                                                                                            
	 CONSTRAINT 		   	Reviewer_FK 		FOREIGN KEY (ReviewerId)
							REFERENCES			Reviewer(ReviewerId)
);

CREATE TABLE Genre (
	GenreId					Integer				NOT NULL,
    GenreTitle				Char(30)			NOT NULL
);

CREATE TABLE MovieGenre (
	MovieId					Integer				NOT NULL,
    GenreId					Integer				NOT NULL
);

CREATE table "Music".Genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) NOT NULL
);

CREATE table "Music".Singers (
	singer_id SERIAL PRIMARY KEY,
	singer_name VARCHAR(80) NOT NULL
);

CREATE table "Music".Genre_Singer (
	singer_id INTEGER REFERENCES "Music".Singers(singer_id),
	genre_id INTEGER REFERENCES "Music".Genres(genre_id),
	CONSTRAINT pk PRIMARY KEY (singer_id, genre_id)
);

CREATE table "Music".Albums (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(80) NOT NULL,
	release_year INTEGER
);

CREATE table "Music".Album_Singer (
	singer_id INTEGER REFERENCES "Music".Singers(singer_id),
	album_id INTEGER REFERENCES "Music".Albums(album_id),
	CONSTRAINT p_k PRIMARY KEY (singer_id, album_id)
);
	
CREATE table "Music".Tracks (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(80) NOT NULL,
	track_length INTEGER,
	album_id INTEGER REFERENCES "Music".Albums(album_id)
);

CREATE table "Music".Collections (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(80) NOT NULL,
	release_year INTEGER
);
	
CREATE table "Music".Collection_Track (
	track_id INTEGER REFERENCES "Music".Tracks(track_id),
	collection_id INTEGER REFERENCES "Music".Collections(collection_id),
	CONSTRAINT p__k PRIMARY KEY (track_id, collection_id) 
);
 
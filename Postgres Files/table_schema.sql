-- Schema code file for homework 9!

-- First, create all tables
CREATE TABLE episode_info (
	SEID VARCHAR(5) PRIMARY KEY, -- Primary key for episode table 
	season SMALLINT (1) NOT NULL,
	episode_no SMALLINT (2) NOT NULL,
	ep_title VARCHAR (45) NOT NULL,
	air_date DATE NOT NULL,
);

CREATE TABLE writers (
	SEID VARCHAR(5) PRIMARY KEY, -- Primary key for writers table
	writer_0 VARCHAR (30),
	writer_1 VARCHAR (30),
	writer_2 VARCHAR (30),
	writer_3 VARCHAR (30),
	writer_4 VARCHAR (30),
	writer_5 VARCHAR (30),
	writer_6 VARCHAR (30),
	writer_7 VARCHAR (30),
	writer_8 VARCHAR (30),
	writer_9 VARCHAR (30)
)

CREATE TABLE us_viewer_count (
	SEID VARCHAR(5) PRIMARY KEY, -- Primary key for us_viewer_count table
	FOREIGN KEY (SEID) REFERENCES episode_info (SEID), -- FK from episode table 
	viewer_count DECIMAL (3,1) NOT NULL,
);

CREATE TABLE scripts (
	SEID VARCHAR(5) PRIMARY KEY, -- Primary key for episode table
	FOREIGN KEY (SEID) REFERENCES episode_info (SEID), -- FK from episode table
	character_name VARCHAR (15) NOT NULL,
	dialogue TEXT,
	episode_no SMALLINT (2) NOT NULL,
	ep_title VARCHAR(30) NOT NULL
);

CREATE TABLE guest_stars (
	actor_name VARCHAR (30),
	ep_title VARCHAR(30) NOT NULL
);


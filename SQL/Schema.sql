--- Create table to use with Episode_info csv
Create table Episode_info (
	index int,
	Season int,
	EpisodeNo int,
	Title varchar ,
	AirDate date,
	Writers varchar,
	Director varchar,
	SEID varchar
);

---Drop index from Episode_info table, do not need column for further joins

Alter Table Episode_info 
Drop Column index;

---Change Good News, Bad News SEID to Pilot to make it easier to join to other tables.
---Doing this change will push Pilot episode to bottom so sort by descending to see.

Update Episode_info
Set seid = 'Pilot'
where title = 'Good News, Bad News';

---Now add primary key to table, could not specify before the update since there were 2 same values

ALTER TABLE Episode_info
ADD PRIMARY KEY (seid);

---Create table to use with scripts csv
Create table Scripts (
	index int,
	Character_name varchar,
	Dialogue varchar,
	EpisodeNo int,
	SEID varchar,
	Season int
);

---Drop index from Scripts table, do not need column for further joins
Alter Table Scripts 
Drop Column index;

--- Create table to use with Episode_data csv
Create table Episode_data (
	index int,
	Season int,
	EpisodeNo varchar,
	Title varchar ,
	AirDate date,
	Director varchar,
	SEID varchar,
	Writer_0 varchar,
	Writer_1 varchar,
	Writer_2 varchar,
	Writer_3 varchar,
	Writer_4 varchar,
	Writer_5 varchar,
	Writer_6 varchar,
	Writer_7 varchar,
	Writer_8 varchar,
	Writer_9 varchar
);

--- Drop index column, no longer needed
Alter Table Episode_data
Drop Column index;

---Update seid so there are no duplicate values
Update Episode_data
Set seid = 'Pilot'
where title = 'Good News, Bad News';

---Declare seid now that all variables are unique
ALTER TABLE Episode_data
ADD PRIMARY KEY (seid);

--Create table to use with Wiki_data
Create table Wiki_Data(
	index int,
	SEID varchar,
	Production_ID int,
	ViewerCount varchar
);

---Drop index column
Alter Table Wiki_Data 
Drop Column index;

---Declare seid
ALTER TABLE Wiki_data
ADD PRIMARY KEY (seid);


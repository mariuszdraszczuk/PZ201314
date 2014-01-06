sqlite_query(
	$local_db,”CREATE TABLE notes (
		noteid INTEGER PRIMARY KEY , 
		cr_date VARCHAR(100) , 
		mod_date VARCHAR(100) , 
		note VARCHAR(100) “) );
		
sqlite_query(
	$local_db,”CREATE TABLE tags (
		tagid INTEGER PRIMARY KEY , 
		tag VARCHAR(100) ) “) );
		
sqlite_query(
	$local_db,”CREATE TABLE tag_to_notes (
		id INTEGER PRIMARY KEY , 
		tagid INTEGER ,
		noteid INTEGER ) “) );
		
-----------------------------

sqlite_query(
	$local_db,”CREATE TABLE notes (
		noteid INTEGER PRIMARY KEY , 
		userid INTEGER , 
		cr_date VARCHAR(100) , 
		mod_date VARCHAR(100) , 
		note VARCHAR(10000) “) );

sqlite_query(
	$local_db,”CREATE TABLE users (
		userid INTEGER PRIMARY KEY , 
		mail VARCHAR(100) ,
		pass_hash VARCHAR(100) ) “) );
		
sqlite_query(
	$local_db,”CREATE TABLE tags (
		tagid INTEGER PRIMARY KEY , 
		tag VARCHAR(100) ,
		userid INTEGER ) “) );
		
sqlite_query(
	$local_db,”CREATE TABLE tag_to_notes (
		id INTEGER PRIMARY KEY , 
		tagid INTEGER ,
		noteid INTEGER ) ,
		userid INTEGER “) );
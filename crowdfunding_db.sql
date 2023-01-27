CREATE TABLE category (
	cat_ids varchar PRIMARY KEY,
	category varchar

);

CREATE TABLE subcategory (
	scat_ids varchar PRIMARY KEY,
	subcategory varchar

);

CREATE TABLE contacts (
	contact_id int PRIMARY KEY,
	first_name varchar,
	last_name varchar,
	email varchar
);

CREATE TABLE campaign (
	cf_id int PRIMARY KEY,
	contact_id int,
	company_name varchar,
	description varchar,
	goal float,
	pledged float,
	outcome varchar,
	backers_count int,
	country varchar,
	currency varchar,
	launch_date date,
	end_date date,
	cat_ids varchar,
	scat_ids varchar,
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (cat_ids) REFERENCES category(cat_ids),
	FOREIGN KEY (scat_ids) REFERENCES subcategory(scat_ids)
);

SELECT* 
FROM category

SELECT* 
FROM subcategory

SELECT* 
FROM contacts

SELECT* 
FROM campaign
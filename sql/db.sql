CREATE DATABASE crm
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_unicode_ci;
USE crm;

CREATE TABLE client(
	id INT AUTO_INCREMENT,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	email VARCHAR(255),
	phone VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE vehicle(
	id INT AUTO_INCREMENT,
	model VARCHAR(255),
	year_of_production INT,
	licence_number VARCHAR(255),
	next_inspection_date DATE,
	client_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(client_id)
	REFERENCES client(id)
);
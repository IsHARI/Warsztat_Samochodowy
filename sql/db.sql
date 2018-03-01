CREATE DATABASE crm
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_unicode_ci;
USE crm;
SET sql_mode='';

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
	next_inspection_date TIMESTAMP,
	client_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(client_id)
	REFERENCES client(id)
);

CREATE TABLE employee(
	id INT AUTO_INCREMENT,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	address VARCHAR(255),
	phone VARCHAR(255),
	note TEXT,
	cost_per_hour NUMERIC(12,2),
	PRIMARY KEY(id)
);

CREATE TABLE orders(
	id INT AUTO_INCREMENT,
	take_in_date TIMESTAMP,
	planned_repair_begin_date TIMESTAMP,
	repair_begin_date TIMESTAMP,
	repair_end_date TIMESTAMP,
	employee_id INT,
	problem_description TEXT,
	repair_description TEXT,
	status VARCHAR(255),
	vehicle_id INT,
	cost_for_client NUMERIC(12,2),
	cost_of_parts NUMERIC(12, 2),
	cost_per_hour NUMERIC(12, 2),
	work_hours INT,
	PRIMARY KEY(id),
	FOREIGN KEY(employee_id)
	REFERENCES employee(id),
	FOREIGN KEY(vehicle_id)
	REFERENCES vehicle(id)
);

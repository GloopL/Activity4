CREATE DATABASE veterinary;

CREATE TABLE owners(
    owner_id INT PRIMARY KEY,
    ofirstname VARCHAR(50) NOT NULL,
    olastname VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE animals(
    animal_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    species VARCHAR(50) NOT NULL,
    breed VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    color VARCHAR(50) NOT NULL,
    owner_id INT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

CREATE TABLE appointments(
    appoint_id INT PRIMARY KEY,
    animal_id INT NOT NULL,
    appoint_date DATE NOT NULL,
    reason VARCHAR(255),
    FOREIGN KEY (animal_id) REFERENCES animals(animal_id)
);

CREATE TABLE doctors(
    doctor_id INT PRIMARY KEY,
    d_first_name VARCHAR(50) NOT NULL,
    d_last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE invoices(
    invoice_id INT PRIMARY KEY,
    appoint_id INT NOT NULL,
    total_amount NUMERIC (10,2) NOT NULL,
    payment_date TIME NOT NULL,
    FOREIGN KEY (appoint_id) REFERENCES appointments(appoint_id)
);

CREATE TABLE medicalrecords(
	record_id INT PRIMARY KEY,
	animal_id INT NOT NULL,
	record_date TIMESTAMP NOT NULL,
	doctor_id INT NOT NULL,
	diagnosis TEXT,
	prescription TEXT,
	notes TEXT,
	FOREIGN KEY (animal_id) REFERENCE animals(animal_id)
);

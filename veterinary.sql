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
)
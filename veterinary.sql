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

INSERT INTO owners(owner_id, ofirstname, olastname, address, phone, email)
VALUES
      (1, 'Juan', 'Dela Cruz', '123 Main St. Manila', '123-456-7890', 'juan@example.com'),
      (2, 'Maria', 'Santos', '456 Elm St, Quezon City', '987-654-3210', 'maria@example.com'),
      (3, 'Antonio', 'Gonzales', '789 Oak St, Cebu', '555-123-4567', 'antonio@example.com'),
      (4, 'Elena', 'Rodrigez', '345 Pine St, Davao' '777-888-9999', 'elena@example.com'),
      (5, 'Ricardo', 'Lim', '987 Cedar St, Makati', '222-333-4444', 'ricardo@example.com'),
      (6, 'Isabel', 'Reyes', '111 Acacia St, Pasig', '999-000-1111', 'isabel@example.com'),
      (7, 'Luis', 'Torres', '555 Magpie St, Mandaluyong', '123-555-7777', 'luis@example.com'),
      (8, 'Carmen', 'Fernandez', '222 Birch St, Taguig', '333-222-1111', 'carmen@example.com'),
      (9, 'Pedro', 'Santillan', '888 Spruce St, Bacolod', '888-777-6666', 'pedro@example.com'),
      (10, 'Sofia', 'Villanueva', '777 Walnut St, Iloilo', '111-999-3333', 'sofia@example.com');

      
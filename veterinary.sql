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

INSERT INTO animals (animal_id, name, species, breed, date_of_birth, gender, color)
VALUES
	(1, 'Fido', 'Dog', 'Golden Retriever', '2018-03-15', 'Male', 'Golden'),
	(2, 'Whiskers', 'Cat', 'Siamese', '2019-07-20', 'Female', 'Cream'),
	(3, 'Rocky', 'Dog', 'German Shepherd', '2017-05-10', 'Male', 'Black and Tan'),
	(4, 'Fluffy', 'Cat', 'Persian', '2020-01-30', 'Male', 'White'),
	(5, 'Luna', 'Dog', 'Larbrador Retriever', '2019-11-25', 'Female', 'Yellow'),
	(6, 'Mochi', 'Cat', 'Maine Coon', '2018-09-12', 'Male', 'Brown Tabby'),
	(7, 'Bella', 'Dog', 'Poodle', '2020-04-05', 'Female', 'White'),
	(8, 'Simba', 'Cat', 'Bengal', '2018-06-18', 'Male', 'Spotted Rosetted'),
	(9, 'Max', 'Dog', 'Dachshund', '2020-07-14', 'Male', 'Black and Tan'),
	(10,'Cleo', 'Cat', 'Ragdoll', '2019-12-22', 'Female', 'Seal Point');

INSERT INTO appointments (appoint_id, appoint_date, reason)
VALUES
    (1, '2023-01-05', 'Annual check-up'),
    (2, '2023-01-10', 'Vaccination'),
    (3, '2023-02-02', 'Injury assessment'),
    (4, '2023-02-15', 'Dental cleaning'),
    (5, '2023-03-05', 'Skin condition'),
    (6, '2023-03-10', 'Check for fleas'),
    (7, '2023-04-12', 'Vaccination'),
    (8, '2023-04-18', 'Spaying/neutering'),
    (9, '2023-05-02', 'Allergy treatment'),
    (10, '2023-05-20', 'Eye infection');

INSERT INTO doctors (doctor_id, d_first_name, d_last_name, specialty, phone, email)
VALUES
	(1, 'Dr. Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
	(2, 'Dr. Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
	(3, 'Dr. Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
	(4, 'Dr. Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@example.com'),
	(5, 'Dr. Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
	(6, 'Dr. Carmen', 'Fernandez', 'Ophthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
    (1, 1, 50.00, '09:30:00'),
    (2, 2, 75.00, '14:15:00'),
    (3, 3, 100.00, '11:00:00'),
    (4, 4, 200.00, '13:45:00'),
    (5, 5, 80.00, '10:30:00'),
    (6, 6, 30.00, '15:00:00'),
    (7, 7, 75.00, '09:15:00'),
    (8, 8, 150.00, '16:30:00'),
    (9, 9, 60.00, '14:45:00'),
    (10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (record_id, record_date, diagnosis, prescription, notes)
VALUES 
    (1, '2023-01-05 00:00:00', 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, '2023-01-10 00:00:00', 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, '2023-02-02 00:00:00', 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, '2023-02-15 00:00:00', 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, '2023-03-10 00:00:00', 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, '2023-03-10 00:00:00', 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, '2023-04-12 00:00:00', 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, '2023-04-18 00:00:00', 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, '2023-05-02 00:00:00', 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, '2023-05-20 00:00:00', 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registered_date DATE;
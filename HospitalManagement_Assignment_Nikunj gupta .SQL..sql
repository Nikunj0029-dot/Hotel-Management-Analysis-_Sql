create database hospital_management_system;

use hospital_management_system;
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender ENUM('M', 'F'),
    date_of_birth DATE
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    specialization VARCHAR(255)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    appointment_date DATE,
    patient_id INT,
    doctor_id INT,
    status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    treatment_type VARCHAR(255),
    cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
-- Insert data into Patients table
INSERT INTO Patients (patient_id, first_name, last_name, gender, date_of_birth)
VALUES (1, 'Anubhav', 'Kumar', 'M', '1990-01-01'),
       (2, 'Nikunj', 'Sharma', 'M', '1985-05-20'),
       (3, 'Nupur', 'Verma', 'F', '1979-09-10'),
       (4, 'Rekha', 'Patel', 'F', '1992-12-15'),
       (5, 'Pawan', 'Singh', 'M', '2000-07-30');

-- Insert data into Doctors table
INSERT INTO Doctors (doctor_id, first_name, last_name, specialization)
VALUES (1, 'Varsha', 'Gupta', 'Cardiology'),
       (2, 'Nikunj', 'Sharma', 'Neurology'),
       (3, 'Rekha', 'Patel', 'Pediatrics'),
       (4, 'Pawan', 'Singh', 'Orthopedics');

-- Insert data into Appointments table
INSERT INTO Appointments (appointment_id, appointment_date, patient_id, doctor_id, status)
VALUES (1, '2024-03-05', 1, 1, 'Scheduled'),
       (2, '2024-02-10', 2, 2, 'Completed'),
       (3, '2024-01-15', 3, 3, 'Cancelled'),
       (4, '2024-04-01', 4, 4, 'Scheduled'),
       (5, '2024-03-20', 1, 2, 'Completed');

-- Insert data into Treatments table
INSERT INTO Treatments (treatment_id, appointment_id, treatment_type, cost)
VALUES (1, 1, 'Surgery', 1500.00),
       (2, 2, 'Consultation', 300.00),
       (3, 3, 'Therapy', 200.00),
       (4, 4, 'Medication', 100.00),
       (5, 5, 'Surgery', 2000.00);
       SELECT * FROM Patients WHERE gender = 'M';
    SELECT * FROM Doctors ORDER BY specialization ASC;
SELECT * FROM Appointments ORDER BY appointment_date DESC LIMIT 5;
SELECT doctor_id, COUNT(*) AS appointment_count 
FROM Appointments 
GROUP BY doctor_id;
SELECT doctor_id 
FROM Appointments 
GROUP BY doctor_id 
HAVING COUNT(*) > 10;
SELECT treatment_type, AVG(cost) AS avg_cost 
FROM Treatments 
GROUP BY treatment_type 
HAVING COUNT(*) > 3 
ORDER BY avg_cost DESC;
SELECT * 
FROM Treatments 
ORDER BY cost DESC 
LIMIT 3;
SELECT * 
FROM Patients 
ORDER BY date_of_birth ASC;
SELECT gender, COUNT(*) AS patient_count 
FROM Patients 
GROUP BY gender;
SELECT gender, COUNT(*) AS patient_count 
FROM Patients 
GROUP BY gender 
HAVING COUNT(*) > 20;
SELECT status, COUNT(*) AS appointment_count 
FROM Appointments 
GROUP BY status 
HAVING COUNT(*) > 5 
ORDER BY appointment_count DESC;
SELECT * 
FROM Appointments 
WHERE appointment_date < '2024-01-01';
SELECT * 
FROM Treatments 
ORDER BY cost ASC 
LIMIT 5;
SELECT treatment_type, AVG(cost) AS avg_cost 
FROM Treatments 
GROUP BY treatment_type 
HAVING AVG(cost) > 300;
SELECT * 
FROM Appointments 
WHERE appointment_date > '2024-03-01' 
ORDER BY appointment_date ASC 
LIMIT 3;

    


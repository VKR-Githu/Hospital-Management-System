-- Create database
CREATE DATABASE IF NOT EXISTS hospital_management;
USE hospital_management;

-- Departments table
CREATE TABLE IF NOT EXISTS Departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    UNIQUE KEY (name)
) ENGINE=InnoDB;

-- Doctors table
CREATE TABLE IF NOT EXISTS Doctors (
    doc_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    contact VARCHAR(50) NOT NULL,
    license_no VARCHAR(50) NOT NULL UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Patients table
CREATE TABLE IF NOT EXISTS Patients (
    pat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    address TEXT,
    contact VARCHAR(50) NOT NULL,
    blood_type ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
    registration_date DATE DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;

-- Appointments table
CREATE TABLE IF NOT EXISTS Appointments (
    appt_id INT AUTO_INCREMENT PRIMARY KEY,
    pat_id INT NOT NULL,
    doc_id INT NOT NULL,
    date_time DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (pat_id) REFERENCES Patients(pat_id) ON DELETE CASCADE,
    FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Medical Records table
CREATE TABLE IF NOT EXISTS Medical_Records (
    rec_id INT AUTO_INCREMENT PRIMARY KEY,
    pat_id INT NOT NULL,
    doc_id INT NOT NULL,
    diagnosis TEXT NOT NULL,
    treatment TEXT,
    date DATE DEFAULT (CURRENT_DATE),
    notes TEXT,
    FOREIGN KEY (pat_id) REFERENCES Patients(pat_id) ON DELETE CASCADE,
    FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Medications table
CREATE TABLE IF NOT EXISTS Medications (
    med_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    manufacturer VARCHAR(100),
    UNIQUE KEY (name)
) ENGINE=InnoDB;

-- Prescriptions table
CREATE TABLE IF NOT EXISTS Prescriptions (
    presc_id INT AUTO_INCREMENT PRIMARY KEY,
    rec_id INT NOT NULL,
    med_id INT NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    frequency VARCHAR(50) NOT NULL,
    duration VARCHAR(50) NOT NULL,
    instructions TEXT,
    FOREIGN KEY (rec_id) REFERENCES Medical_Records(rec_id) ON DELETE CASCADE,
    FOREIGN KEY (med_id) REFERENCES Medications(med_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Staff table
CREATE TABLE IF NOT EXISTS Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role ENUM('Nurse', 'Administrator', 'Receptionist') NOT NULL,
    contact VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Users table for authentication
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'doctor', 'nurse', 'receptionist') NOT NULL,
    doc_id INT,
    staff_id INT,
    FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Create indexes for performance
CREATE INDEX idx_appointments_patient ON Appointments(pat_id);
CREATE INDEX idx_appointments_doctor ON Appointments(doc_id);
CREATE INDEX idx_appointments_date ON Appointments(date_time);
CREATE INDEX idx_medical_records_patient ON Medical_Records(pat_id);
CREATE INDEX idx_prescriptions_record ON Prescriptions(rec_id);

USE hospital_management;

-- Insert departments
INSERT INTO Departments (name, location) VALUES
('Cardiology', 'Building A, Floor 1'),
('Neurology', 'Building A, Floor 2'),
('Pediatrics', 'Building B, Floor 1'),
('General Surgery', 'Building C, Floor 1');

-- Insert doctors
INSERT INTO Doctors (name, specialization, contact, license_no, dept_id) VALUES
('Dr. John Smith', 'Cardiologist', 'john.smith@hospital.com', 'MD123456', 1),
('Dr. Sarah Johnson', 'Neurologist', 'sarah.johnson@hospital.com', 'MD654321', 2),
('Dr. Michael Brown', 'Pediatrician', 'michael.brown@hospital.com', 'MD789012', 3),
('Dr. Emily Davis', 'General Surgeon', 'emily.davis@hospital.com', 'MD210987', 4);

-- Insert patients
INSERT INTO Patients (name, dob, gender, address, contact, blood_type) VALUES
('Robert Wilson', '1980-05-15', 'Male', '123 Main St, Cityville', '555-0101', 'A+'),
('Jennifer Lee', '1992-08-22', 'Female', '456 Oak Ave, Townsville', '555-0202', 'B-'),
('David Kim', '1975-11-30', 'Male', '789 Pine Rd, Villageton', '555-0303', 'O+'),
('Lisa Garcia', '1988-03-10', 'Female', '321 Elm Blvd, Hamlet City', '555-0404', 'AB+');

-- Insert appointments
INSERT INTO Appointments (pat_id, doc_id, date_time, status, notes) VALUES
(1, 1, '2023-06-15 09:00:00', 'Completed', 'Annual heart checkup'),
(2, 2, '2023-06-16 10:30:00', 'Scheduled', 'Follow-up for migraines'),
(3, 3, '2023-06-17 11:15:00', 'Scheduled', 'Child wellness visit'),
(4, 4, '2023-06-18 14:00:00', 'Scheduled', 'Post-surgery check'),
(1, 1, '2023-07-15 09:00:00', 'Scheduled', 'Follow-up after tests');

-- Insert medical records
INSERT INTO Medical_Records (pat_id, doc_id, diagnosis, treatment, date, notes) VALUES
(1, 1, 'Hypertension', 'Prescribed medication and lifestyle changes', '2023-06-15', 'Patient to return in 1 month'),
(2, 2, 'Migraine', 'Prescribed pain management plan', '2023-05-20', 'Patient reports reduced frequency'),
(3, 3, 'Common cold', 'Rest and fluids recommended', '2023-06-10', 'Follow up if symptoms persist'),
(4, 4, 'Appendectomy recovery', 'Post-surgical care instructions provided', '2023-05-25', 'Healing well');

-- Insert medications
INSERT INTO Medications (name, description, manufacturer) VALUES
('Lisinopril', 'ACE inhibitor for hypertension', 'PharmaCorp'),
('Sumatriptan', 'For migraine headaches', 'MediSolutions'),
('Amoxicillin', 'Antibiotic', 'DrugsInc'),
('Ibuprofen', 'NSAID pain reliever', 'PharmaGlobal');

-- Insert prescriptions
INSERT INTO Prescriptions (rec_id, med_id, dosage, frequency, duration, instructions) VALUES
(1, 1, '10mg', 'Once daily', '30 days', 'Take in the morning'),
(2, 2, '50mg', 'As needed', '10 doses', 'Take at onset of migraine'),
(3, 3, '500mg', 'Three times daily', '7 days', 'Take with food'),
(4, 4, '400mg', 'Every 6 hours as needed', '5 days', 'Do not exceed 6 tablets in 24 hours');

-- Insert staff
INSERT INTO Staff (name, role, contact, dept_id) VALUES
('Nancy White', 'Nurse', 'nancy.white@hospital.com', 1),
('James Miller', 'Nurse', 'james.miller@hospital.com', 2),
('Patricia Taylor', 'Administrator', 'patricia.taylor@hospital.com', NULL),
('Richard Anderson', 'Receptionist', 'richard.anderson@hospital.com', NULL);

-- Create user accounts
INSERT INTO Users (username, email, password_hash, role, doc_id, staff_id) VALUES
-- Admin
('admin', 'admin@hospital.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'admin', NULL, NULL),
-- Doctors
('jsmith', 'john.smith@hospital.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'doctor', 1, NULL),
('sjohnson', 'sarah.johnson@hospital.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'doctor', 2, NULL),
-- Nurses
('nwhite', 'nancy.white@hospital.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'nurse', NULL, 1),
('jmiller', 'james.miller@hospital.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'nurse', NULL, 2),
-- Receptionist
('randerson', 'richard.anderson@hospital.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'receptionist', NULL, 4);

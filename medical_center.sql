-- from the terminal run:
-- psql < medical_center.sql


CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    specialty VARCHAR(255) NOT NULL,
    years_of_experience INTEGER NOT NULL 
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth TIMESTAMP NOT NULL,
    contact_number TEXT NOT NULL,
    email_address TEXT NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER NOT NULL, 
    disease_id INTEGER NOT NULL REFERENCES diseases(id), 
    notes TEXT NOT 
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES doctors(id),
    patient_id INTEGER NOT NULL REFERENCES patients(id),
    date TIMESTAMP NOT NULL,
    PRIMARY KEY (doctor_id, patient_id, visit_date)
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);
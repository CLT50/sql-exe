DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    DOB VARCHAR NOT NULL,
    phone_number INTEGER
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    visit_date DATE,
    doctor_id INTEGER REFERENCES doctors (id), ON DELETE CASCADE
    patient_id INTEGER REFERENCES patients (id) ON DELETE CASCADE
); 

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT,
    symptoms TEXT
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits (id) ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases (id) ON DELETE CASCADE,
    notes TEXT,
    prescriptions TEXT,
);



INSERT INTO doctors (first_name, last_name)
VALUES ('John', 'Doe');

INSERT INTO patients (first_name, last_name, DOB, phone_number)
VALUES ('Jane', 'Doe', '01-01-1970', 123-456-7890);

INSERT INTO visits (visit_date, doctor_id, patient_id)
VALUES ('04-03-2023', 1, 1);

INSERT INTO diseases (disease_name, symptoms)
VALUES ('flu', 'cough');

INSERT INTO diagnoses (visit_id, disease_id, notes, prescriptions)
VALUES (1, 1, 'patient has flu', 'none');
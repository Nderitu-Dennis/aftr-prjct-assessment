CREATE DATABASE crop_insurance_app;
USE crop_insurance_app;

show tables;
select * from crop_master;
select * from farmer_application;
select * from season_master;

CREATE TABLE season_master (
    season_id INT PRIMARY KEY AUTO_INCREMENT,
    season_name VARCHAR(20) NOT NULL 
);

CREATE TABLE crop_master (
    crop_id INT PRIMARY KEY AUTO_INCREMENT,
    crop_name VARCHAR(50) NOT NULL,
    season_id INT, 
    FOREIGN KEY (season_id) REFERENCES season_master(season_id) 
);

CREATE TABLE farmer_application (
    farmer_id INT PRIMARY KEY AUTO_INCREMENT,
    farmer_name VARCHAR(50) NOT NULL,
    aadhaar_no VARCHAR(12) NOT NULL,
    father_name VARCHAR(12) NOT NULL,
    address VARCHAR(250) NOT NULL,
    farmer_category VARCHAR(20) NOT NULL,
    season_id INT,
    crop_id INT,
    FOREIGN KEY (season_id) REFERENCES season_master(season_id),
    FOREIGN KEY (crop_id) REFERENCES crop_master(crop_id),
    UNIQUE KEY unique_aadhaar_crop (aadhaar_no, crop_id) 
);

INSERT INTO season_master (season_name) VALUES ('Kharif'), ('Rabi');

INSERT INTO crop_master (crop_name, season_id) VALUES 
('Paddy', 1), ('Maize', 1), 
('Wheat', 2), ('Mustard', 2);
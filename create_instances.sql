INSERT INTO Person (dni, name, phone, address, city, country) VALUES
('dni-1', 'Goku', '555123456', 'Kame House', 'West City', 'Dragon Ball'),
('dni-2', 'Vegeta', '555654321', 'Capsule Corp', 'West City', 'Dragon Ball'),
('dni-3', 'Piccolo', NULL, 'Mountains', 'East City', 'Dragon Ball'),
('dni-4', 'Krillin', '555987654', 'Kame House', 'West City', 'Dragon Ball'),
('dni-5', 'Bulma', '555876543', 'Capsule Corp', 'West City', 'Dragon Ball'),
('dni-6', 'Chi-Chi', '555234567', 'Son House', 'West City', 'Dragon Ball'),
('dni-7', 'Gohan', '555345678', 'Son House', 'West City', 'Dragon Ball'),
('dni-8', 'Goten', '555456789', 'Son House', 'West City', 'Dragon Ball'),
('dni-9', 'Trunks', '555567890', 'Capsule Corp', 'West City', 'Dragon Ball'),
('dni-10', 'Pan', '555678901', 'Son House', 'West City', 'Dragon Ball'),
('dni-11', 'Cell', '555789012', 'Cell Arena', 'South City', 'Dragon Ball'),
('dni-12', 'Frieza', '555890123', 'Frieza Ship', 'North City', 'Dragon Ball'),
('dni-13', 'Majin Buu', '555901234', 'Majin House', 'West City', 'Dragon Ball'),
('dni-14', 'Beerus', '555012345', 'Beerus Planet', 'North City', 'Dragon Ball'),
('dni-15', 'Whis', '555123456', 'Whis Planet', 'North City', 'Dragon Ball'),
('dni-16', 'Jiren', '555234567', 'Jiren House', 'West City', 'Dragon Ball'),
('dni-17', 'Hit', '555345678', 'Hit House', 'West City', 'Dragon Ball'),
('dni-18', 'Zamasu', '555456789', 'Zamasu House', 'West City', 'Dragon Ball'),
('dni-19', 'Black', '555567890', 'Black House', 'West City', 'Dragon Ball'),
('dni-20', 'Broly', '555678901', 'Broly House', 'West City', 'Dragon Ball'),
('dni-21', 'Raditz', '555789012', 'Raditz House', 'West City', 'Dragon Ball'),
('dni-22', 'Nappa', '555890123', 'Nappa House', 'West City', 'Dragon Ball');

INSERT INTO Visitor (dni, profession) VALUES
('dni-1', 'Warrior'),
('dni-2', 'Prince'),
('dni-3', 'Warrior'),
('dni-4', 'Engineer'),
('dni-5', 'Engineer'),
('dni-6', 'Housewife'),
('dni-7', 'Student'),
('dni-8', 'Student'),
('dni-9', 'Student'),
('dni-10', 'Student');

INSERT INTO Staff (dni, salary, mobile_phone, social_security_id) VALUES
('dni-11', 1000.00, '555123456', 'SS123456'),
('dni-12', 2000.50, '555234567', 'SS234567'),
('dni-13', 3000.75, '555345678', 'SS345678'),
('dni-14', 4000.00, '555456789', 'SS456789'),
('dni-15', 5000.25, '555567890', 'SS567890'),
('dni-16', 6000.10, '555678901', 'SS678901'),
('dni-17', 7000.50, '555789012', 'SS789012'),
('dni-18', 8000.75, '555890123', 'SS890123'),
('dni-19', 9000.00, '555901234', 'SS901234'),
('dni-20', 10000.25, '555012345', 'SS012345'),
('dni-21', 11000.50, '555123456', 'SS123456'),
('dni-22', 12000.75, '555234567', 'SS234567');

INSERT INTO Survey (calificacion, visitor_dni, date) VALUES
(5, 'dni-1', '2024-12-01 10:30:00'),
(4, 'dni-2', '2024-12-02 11:30:00'),
(3, 'dni-3', '2024-12-03 12:30:00'),
(2, 'dni-4', '2024-12-04 13:30:00'),
(1, 'dni-5', '2024-12-05 14:30:00'),
(5, 'dni-6', '2024-12-06 15:30:00'),
(4, 'dni-7', '2024-12-07 16:30:00'),
(3, 'dni-8', '2024-12-08 17:30:00'),
(2, 'dni-9', '2024-12-09 18:30:00'),
(1, 'dni-10', '2024-12-10 19:30:00'),
(1, 'dni-6', '2024-11-06 15:30:00'),
(3, 'dni-7', '2024-11-07 16:30:00'),
(5, 'dni-8', '2024-11-08 17:30:00'),
(3, 'dni-9', '2024-11-09 18:30:00'),
(2, 'dni-10', '2024-11-10 19:30:00');

INSERT INTO Hostel (category, capacity) VALUES
(5, 50),
(4, 40),
(3, 30),
(2, 20),
(1, 10);

INSERT INTO Booking (visitor_dni, hostel_id, beds, start_date, end_date) VALUES
('dni-1', 1, 1, '2024-12-01', '2024-12-05'),
('dni-2', 2, 2, '2024-12-02', '2024-12-06'),
('dni-3', 3, 3, '2024-12-03', '2024-12-07'),
('dni-4', 4, 4, '2024-12-04', '2024-12-08'),
('dni-5', 5, 5, '2024-12-05', '2024-12-09'),
('dni-6', 1, 1, '2024-11-06', '2024-11-10'),
('dni-7', 2, 2, '2024-11-07', '2024-11-11'),
('dni-8', 3, 3, '2024-11-08', '2024-11-12'),
('dni-9', 4, 4, '2024-11-09', '2024-11-13'),
('dni-10', 5, 5, '2024-11-10', '2024-11-14'),
('dni-6', 1, 1, '2024-12-06', '2024-12-10'),
('dni-7', 2, 2, '2024-12-07', '2024-12-11'),
('dni-8', 3, 3, '2024-12-08', '2024-12-12'),
('dni-9', 4, 4, '2024-12-09', '2024-12-13'),
('dni-10', 5, 5, '2024-12-10', '2024-12-14');

INSERT INTO Zone (id, name, area) VALUES
(1, 'Namekusei Zone', 1500.50),
(2, 'Saiyan Zone', 1200.75);

INSERT INTO Entrance (id, zone_id, number) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 1),
(4, 2, 2),
(5, 2, 3);

INSERT INTO Trip (hostel_id, zone_id, type, start_date, end_date, capacity) VALUES
(1, 1, 'VEHICLE', '2024-12-01 08:00:00', '2024-12-01 18:00:00', 10),
(2, 2, 'WALKING', '2024-12-02 09:00:00', '2024-12-02 17:00:00', 15),
(3, 1, 'VEHICLE', '2024-12-03 10:00:00', '2024-12-03 16:00:00', 8),
(4, 2, 'WALKING', '2024-12-04 11:00:00', '2024-12-04 15:00:00', 20),
(5, 1, 'VEHICLE', '2024-12-05 07:00:00', '2024-12-05 13:00:00', 12),
(1, 2, 'VEHICLE', '2024-11-06 08:00:00', '2024-11-06 18:00:00', 10),
(2, 1, 'WALKING', '2024-11-07 09:00:00', '2024-11-07 17:00:00', 15),
(3, 1, 'VEHICLE', '2024-11-08 10:00:00', '2024-11-08 16:00:00', 8),
(4, 1, 'WALKING', '2024-11-09 11:00:00', '2024-11-09 15:00:00', 20),
(5, 1, 'VEHICLE', '2024-11-10 07:00:00', '2024-11-10 13:00:00', 12),
(1, 2, 'VEHICLE', '2024-12-06 08:00:00', '2024-12-06 18:00:00', 10),
(2, 2, 'WALKING', '2024-12-07 09:00:00', '2024-12-07 17:00:00', 15),
(3, 2, 'VEHICLE', '2024-12-08 10:00:00', '2024-12-08 16:00:00', 8),
(4, 2, 'WALKING', '2024-12-09 11:00:00', '2024-12-09 15:00:00', 20),
(5, 1, 'VEHICLE', '2024-12-10 07:00:00', '2024-12-10 13:00:00', 12);

INSERT INTO Species (id, name, scientific_name) VALUES
(1, 'Cow', 'cow'),
(2, 'Lion', 'lion'),
(3, 'Pig', 'pig'),
(4, 'Plant 1', 'plant-1'),
(5, 'Plant 2', 'plant-2'),
(6, 'Amber', 'amber'),
(7, 'Diamond', 'diamond');

INSERT INTO Animal (id, diet_type, mating_season) VALUES
(1, 'HERBIVORE', 'Spring'),
(2, 'CARNIVORE', 'Summer'),
(3, 'OMNIVORE', 'Fall');

INSERT INTO Vegetal (id, has_flowering, flowering_period) VALUES
(4, TRUE, 'Spring'),
(5, FALSE, NULL);

INSERT INTO Mineral (id, type) VALUES
(6, 'ROCK'),
(7, 'CRYSTAL');

INSERT INTO Population (zone_id, species_id, size) VALUES
(1, 1, 50),
(2, 2, 75),
(1, 3, 40),
(2, 4, 100),
(2, 5, 20),
(1, 6, 10),
(1, 7, 5);

INSERT INTO Manager (dni, entrance_id) VALUES
('dni-11', 1),
('dni-12', 2),
('dni-13', 3),
('dni-14', 4),
('dni-15', 5);

INSERT INTO Maintenance (dni, speciality, zone_id) VALUES
('dni-16', 'Electricity', 1),
('dni-17', 'Engineering', 2);

INSERT INTO Surveillance (dni, zone_id) VALUES
('dni-18', 1),
('dni-19', 2);

INSERT INTO Researcher (dni, title) VALUES
('dni-20', 'Scientist'),
('dni-21', 'PhD'),
('dni-22', 'Scientist');

INSERT INTO Research (researcher_dni, species_id, budget, start_date, end_date) VALUES
('dni-20', 1, 1000.00, '2024-01-01', '2024-06-01'),
('dni-21', 2, 1500.50, '2024-02-01', '2024-07-01'),
('dni-22', 3, 2000.75, '2024-03-01', '2024-08-01'),
('dni-20', 4, 2500.00, '2024-04-01', '2024-09-01'),
('dni-21', 5, 3000.50, '2024-05-01', '2024-10-01'),
('dni-22', 6, 3500.75, '2024-06-01', '2024-11-01'),
('dni-20', 7, 4000.00, '2024-07-01', '2024-12-01'),
('dni-21', 1, 4500.50, '2024-08-01', '2025-01-01'),
('dni-22', 2, 5000.75, '2024-09-01', '2025-02-01');

INSERT INTO Vehicle (license_plate, type, owner_dni) VALUES
('DBZ001', 'CAR', 'dni-18'),
('DBZ002', 'BIKE', 'dni-19');
CREATE TABLE Person (
    dni VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

CREATE TABLE Visitor (
    dni VARCHAR(255) PRIMARY KEY,
    profession VARCHAR(255) NOT NULL,
    FOREIGN KEY (dni) REFERENCES Person(dni)
);

CREATE TABLE Staff (
    dni VARCHAR(255) PRIMARY KEY,
    salary DECIMAL(10, 2) NOT NULL,
    mobile_phone VARCHAR(255),
    social_security_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (dni) REFERENCES Person(dni)
);

CREATE TABLE Survey (
    id INT PRIMARY KEY AUTO_INCREMENT,
    calificacion TINYINT NOT NULL CHECK (calificacion BETWEEN 1 AND 5),
    visitor_dni VARCHAR(255) NOT NULL,
    date DATETIME NOT NULL,
    FOREIGN KEY (visitor_dni) REFERENCES Visitor(dni)
);

CREATE TABLE Hostel (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category TINYINT NOT NULL CHECK (category BETWEEN 1 AND 5),
    capacity INT NOT NULL
);

CREATE TABLE Booking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    visitor_dni VARCHAR(255) NOT NULL,
    hostel_id INT NOT NULL,
    beds INT DEFAULT 1 CHECK (beds >= 1),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (visitor_dni) REFERENCES Visitor(dni),
    FOREIGN KEY (hostel_id) REFERENCES Hostel(id)
);

CREATE TABLE Zone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    area DECIMAL(10, 2)
);

CREATE TABLE Trip (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hostel_id INT NOT NULL,
    zone_id INT NOT NULL,
    type ENUM('VEHICLE', 'WALKING') NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    capacity INT DEFAULT 1 CHECK (capacity >= 1),
    FOREIGN KEY (hostel_id) REFERENCES Hostel(id),
    FOREIGN KEY (zone_id) REFERENCES Zone(id)
);

CREATE TABLE Seat (
    id INT PRIMARY KEY AUTO_INCREMENT,
    visitor_dni VARCHAR(255) NOT NULL,
    trip_id INT NOT NULL,
    FOREIGN KEY (visitor_dni) REFERENCES Visitor(dni),
    FOREIGN KEY (trip_id) REFERENCES Trip(id)
);

CREATE TABLE Entrance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    zone_id INT NOT NULL,
    number INT NOT NULL,
    FOREIGN KEY (zone_id) REFERENCES Zone(id)
);

CREATE TABLE Species (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    scientific_name VARCHAR(255) NOT NULL
);

CREATE TABLE Population (
    id INT PRIMARY KEY AUTO_INCREMENT,
    zone_id INT NOT NULL,
    species_id INT NOT NULL,
    size INT NOT NULL CHECK (size >= 0),
    FOREIGN KEY (zone_id) REFERENCES Zone(id),
    FOREIGN KEY (species_id) REFERENCES Species(id)
);

CREATE TABLE Animal (
    id INT PRIMARY KEY,
    diet_type ENUM('HERBIVORE', 'CARNIVORE', 'OMNIVORE') NOT NULL,
    mating_season VARCHAR(255) NOT NULL,
    FOREIGN KEY (id) REFERENCES Species(id)
);

CREATE TABLE Vegetal (
    id INT PRIMARY KEY,
    has_flowering BOOLEAN NOT NULL,
    flowering_period VARCHAR(255),
    FOREIGN KEY (id) REFERENCES Species(id)
);

CREATE TABLE Mineral (
    id INT PRIMARY KEY,
    type ENUM('ROCK', 'CRYSTAL') NOT NULL,
    FOREIGN KEY (id) REFERENCES Species(id)
);

CREATE TABLE Predator (
    id INT PRIMARY KEY AUTO_INCREMENT,
    predator_species_id INT NOT NULL,
    prey_species_id INT NOT NULL,
    FOREIGN KEY (predator_species_id) REFERENCES Species(id),
    FOREIGN KEY (prey_species_id) REFERENCES Species(id)
);

CREATE TABLE Researcher (
    dni VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    FOREIGN KEY (dni) REFERENCES Staff(dni)
);

CREATE TABLE Research (
    id INT PRIMARY KEY AUTO_INCREMENT,
    researcher_dni VARCHAR(255) NOT NULL,
    species_id INT NOT NULL,
    budget DECIMAL(10, 2) NOT NULL CHECK (budget >= 0),
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    FOREIGN KEY (researcher_dni) REFERENCES Researcher(dni),
    FOREIGN KEY (species_id) REFERENCES Species(id)
);

CREATE TABLE Manager (
    dni VARCHAR(255) PRIMARY KEY,
    entrance_id INT NOT NULL,
    FOREIGN KEY (dni) REFERENCES Staff(dni),
    FOREIGN KEY (entrance_id) REFERENCES Entrance(id)
);

CREATE TABLE Maintenance (
    dni VARCHAR(255) PRIMARY KEY,
    speciality VARCHAR(255) NOT NULL,
    zone_id INT NOT NULL,
    FOREIGN KEY (dni) REFERENCES Staff(dni),
    FOREIGN KEY (zone_id) REFERENCES Zone(id)
);

CREATE TABLE Surveillance (
    dni VARCHAR(255) PRIMARY KEY,
    zone_id INT NOT NULL,
    FOREIGN KEY (dni) REFERENCES Staff(dni),
    FOREIGN KEY (zone_id) REFERENCES Zone(id)
);

CREATE TABLE Vehicle (
    license_plate VARCHAR(255) PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    owner_dni VARCHAR(255) NOT NULL,
    FOREIGN KEY (owner_dni) REFERENCES Surveillance(dni)
);
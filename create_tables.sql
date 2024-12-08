CREATE TABLE Person (
    DNI VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);


CREATE TABLE Visitor (
    DNI VARCHAR(255) PRIMARY KEY,
    profession VARCHAR(255) NOT NULL,
    FOREIGN KEY (DNI) REFERENCES Person(DNI)
);

CREATE TABLE Staff (
    DNI VARCHAR(255) PRIMARY KEY,
    salary DECIMAL NOT NULL,
    mobile_phone VARCHAR(255),
    social_security_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (DNI) REFERENCES Person(DNI)
);

CREATE TABLE Survey (
    id INT PRIMARY KEY,
    calificacion TINYINT NOT NULL CHECK (calificacion BETWEEN 1 AND 5),
    visitor_dni VARCHAR(255) NOT NULL,
    date DATETIME NOT NULL,
    FOREIGN KEY (visitor_dni) REFERENCES Visitor(DNI)
);

CREATE TABLE Hostel (
    id INTEGER PRIMARY KEY,
    category TINYINT CHECK (category BETWEEN 1 AND 5) NOT NULL,
    capacity INTEGER NOT NULL
);

CREATE TABLE Booking (
    id INTEGER PRIMARY KEY,
    visitor_dni VARCHAR(255) NOT NULL,
    hostel_id INTEGER NOT NULL,
    beds INTEGER DEFAULT 1 CHECK (beds >= 1) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (visitor_dni) REFERENCES Visitor(dni),
    FOREIGN KEY (hostel_id) REFERENCES Hostel(id)
);

CREATE TABLE Trip (
    id INTEGER PRIMARY KEY,
    hostel_id INTEGER NOT NULL,
    zone_id INTEGER NOT NULL,
    type ENUM('VEHICLE', 'WALKING') NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    capacity INTEGER DEFAULT 1 CHECK (capacity >= 1) NOT NULL,
    FOREIGN KEY (hostel_id) REFERENCES Hostel(id),
    FOREIGN KEY (zone_id) REFERENCES Zone(id)
);

CREATE TABLE Seat (
    id INTEGER PRIMARY KEY,
    visitor_dni VARCHAR(255) NOT NULL,
    trip_id INTEGER NOT NULL,
    FOREIGN KEY (visitor_dni) REFERENCES Visitor(dni),
    FOREIGN KEY (trip_id) REFERENCES Trip(id)
);

CREATE TABLE Zone (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    area DECIMAL(10, 2)
);

CREATE TABLE Entrance (
    id INTEGER PRIMARY KEY,
    zone_id INTEGER NOT NULL,
    number INTEGER NOT NULL,
    FOREIGN KEY (zone_id) REFERENCES Zone(id)
);

CREATE TABLE Species (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    scientific_name VARCHAR(255) NOT NULL
);

CREATE TABLE Population (
    id INTEGER PRIMARY KEY,
    zone_id INTEGER NOT NULL,
    species_id INTEGER NOT NULL,
    size INTEGER NOT NULL CHECK (size >= 0),
    FOREIGN KEY (zone_id) REFERENCES Zone(id),
    FOREIGN KEY (species_id) REFERENCES Species(id)
);

CREATE TABLE Animal (
    id INTEGER PRIMARY KEY,
    diet_type ENUM('HERBIVORE', 'CARNIVORE', 'OMNIVORE') NOT NULL,
    mating_season VARCHAR(255) NOT NULL,
    FOREIGN KEY (id) REFERENCES Species(id)
);

CREATE TABLE Vegetal (
    id INTEGER PRIMARY KEY,
    has_flowering BOOLEAN NOT NULL,
    flowering_period VARCHAR(255),
    FOREIGN KEY (id) REFERENCES Species(id)
);

CREATE TABLE Mineral (
    id INTEGER PRIMARY KEY,
    type ENUM('ROCK', 'CRYSTAL') NOT NULL,
    FOREIGN KEY (id) REFERENCES Species(id)
);

CREATE TABLE Predator (
    id INTEGER PRIMARY KEY,
    predator_species_id INTEGER NOT NULL,
    prey_species_id INTEGER NOT NULL,
    FOREIGN KEY (predator_species_id) REFERENCES Species(id),
    FOREIGN KEY (prey_species_id) REFERENCES Species(id)
);

CREATE TABLE Research (
    id INT PRIMARY KEY,
    researcher_id INT NOT NULL,
    species_id INT NOT NULL,
    budget DECIMAL(10, 2) NOT NULL CHECK (budget >= 0),
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    FOREIGN KEY (researcher_id) REFERENCES Researcher(id),
    FOREIGN KEY (species_id) REFERENCES Species(id)
);

CREATE TABLE Researcher (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    FOREIGN KEY (id) REFERENCES Staff(id)
);

CREATE TABLE Manager (
    id INT PRIMARY KEY,
    entrance_id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES Staff(id),
    FOREIGN KEY (entrance_id) REFERENCES Entrance(id)
);

CREATE TABLE Maintenance (
    id INT PRIMARY KEY,
    speciality VARCHAR(255) NOT NULL,
    zone_id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES Staff(id),
    FOREIGN KEY (zone_id) REFERENCES Zone(id)
);

CREATE TABLE Surveillance (
    id INT PRIMARY KEY,
    zone_id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES Staff(id),
    FOREIGN KEY (zone_id) REFERENCES Zone(id)
);

CREATE TABLE Vehicle (
    license_plate VARCHAR(255) PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    owner_id INT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES Surveillance(id)
);
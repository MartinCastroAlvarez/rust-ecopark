-- Given the 'Saiyan Zone' zone, find the staff members who are in charge of surveillance.
SELECT Person.name, Zone.name
FROM Surveillance
LEFT JOIN Person ON Person.dni = Surveillance.dni
LEFT JOIN Zone ON Zone.id = Surveillance.zone_id
WHERE Zone.name = 'Saiyan Zone';

-- Given the 'Saiyan Zone' zone, find the staff members who do maintenance.
SELECT Person.name, Zone.name
FROM Maintenance
LEFT JOIN Person ON Person.dni = Maintenance.dni
LEFT JOIN Zone ON Zone.id = Maintenance.zone_id
WHERE Zone.name = 'Saiyan Zone';

-- Given the 'Saiyan Zone' zone, how many different researchers live there?
SELECT COUNT(DISTINCT Population.species_id)
FROM Population
LEFT JOIN Zone ON Zone.id = Population.zone_id
WHERE Zone.name = 'Saiyan Zone';

-- Given the 'Broly' researcher, does he study minerals?
SELECT COUNT(DISTINCT Research.id)
FROM Research
LEFT JOIN Person ON Person.dni = Research.researcher_dni
LEFT JOIN Species ON Species.id = Research.species_id
LEFT JOIN Mineral ON Mineral.id = Species.id
WHERE Person.name = 'Broly'
AND Mineral.id IS NOT NULL;

-- Given the 'Broly' researcher, find out how many projects he participated in.
SELECT COUNT(DISTINCT Research.id)
FROM Research
LEFT JOIN Person ON Person.dni = Research.researcher_dni
WHERE Person.name = 'Broly';

-- Given the 'Broly' researcher, find out the total budget of the projects he participated in.
SELECT SUM(Research.budget)
FROM Research
LEFT JOIN Person ON Person.dni = Research.researcher_dni
WHERE Person.name = 'Broly';

-- Given the 'Earth Hostel' Hosterl, how many surveys have been conducted with a score below 3?
SELECT COUNT(Survey.score)
FROM Survey
LEFT JOIN Hostel ON Hostel.id = Survey.hostel_id
WHERE Hostel.name = 'Earth Hostel'
AND Survey.score < 3;

-- Find all the hostels that have received a score of 1 at least once.
SELECT DISTINCT Hostel.name
FROM Survey
LEFT JOIN Hostel ON Hostel.id = Survey.hostel_id
WHERE Survey.score = 1;

-- Given the 'Plant 1' species, who are its predators?
SELECT Species.name
FROM Predator
LEFT JOIN Species ON Species.id = Predator.predator_species_id
LEFT JOIN Species AS Prey ON Prey.id = Predator.prey_species_id
WHERE Prey.name = 'Plant 1';

-- Given the 'Plant 1' species, how many of its predators are in the 'Saiyan Zone' zone?
SELECT COUNT(DISTINCT Predator.predator_species_id)
FROM Population
LEFT JOIN Predator ON Predator.predator_species_id = Population.id
LEFT JOIN Zone ON Zone.id = Population.zone_id
LEFT JOIN Species AS Prey ON Prey.id = Predator.prey_species_id
WHERE Prey.name = 'Plant 1'
AND Zone.name = 'Saiyan Zone';

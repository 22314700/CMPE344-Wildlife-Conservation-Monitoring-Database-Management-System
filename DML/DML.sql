INSERT INTO "Species" ("speciesID","scientificName", "commonName", "conservationStatus") VALUES 
(1,'Panthera leo', 'Lion', 'Vulnerable'),
(2,'Loxodonta africana', 'African Elephant', 'Endangered'),
(3,'Gorilla beringei', 'Mountain Gorilla', 'Critically Endangered'),
(4,'Acinonyx jubatus', 'Cheetah', 'Vulnerable'),
(5,'Diceros bicornis', 'Black Rhinoceros', 'Critically Endangered'),
(6,'Ursus maritimus', 'Polar Bear', 'Vulnerable'),
(7,'Ailuropoda melanoleuca', 'Giant Panda', 'Vulnerable'),
(8,'Panthera tigris', 'Tiger', 'Endangered'),
(9,'Equus quagga', 'Zebra', 'Least Concern'),
(10,'Giraffa camelopardalis', 'Giraffe', 'Vulnerable');

INSERT INTO "Location" ("locationID","areaName", "gpsCoordination", "habitatType") VALUES 
(1,'Northern Region', 412356, 'Savanna'),
(2,'Deep Forest', 987654, 'Rainforest'),
(3,'Riverbed', 554433, 'Wetland'),
(4,'High Hills', 112233, 'Mountain'),
(5,'Eastern Plains', 998877, 'Grassland'),
(6,'Southern Swamp', 334455, 'Swamp'),
(7,'Western Rocks', 667788, 'Rocky'),
(8,'Central Lake', 221100, 'Lakeside'),
(9,'Hidden Valley', 776655, 'Valley'),
(10,'Coastal Strip', 889900, 'Coast');

INSERT INTO "Staff" ("staffID","staffName", "staffRole", "staffSalary") VALUES 
(1,'Mert Yılmaz', 'Admin', 25000),
(2,'Ayşe Demir', 'Director', 22000),
(3,'Can Kaya', 'Biologist', 18000),
(4,'Ece Suna', 'Field Officer', 15000),
(5,'Ali Kurt', 'Technician', 14500),
(6,'Zeynep Aras', 'Veterinarian', 19000),
(7,'Murat Can', 'Security', 13000),
(8,'Selin Işık', 'Researcher', 17500),
(9,'Hakan Uzun', 'Logistics', 14000),
(10,'Deniz Akel', 'Observer', 15500);

INSERT INTO "Animal" ("animalID","speciesID", "sex", "age", "healthStatus") VALUES 
(1,1, 'Male', 5, 'Healthy'),
(2,2, 'Female', 12, 'Injured'),
(3,3, 'Male', 8, 'Healthy'),
(4,4, 'Female', 3, 'Under Observation'),
(5,5, 'Male', 15, 'Critical'),
(6,6, 'Male', 7, 'Healthy'),
(7,7, 'Female', 4, 'Healthy'),
(8,8, 'Male', 6, 'Recovering'),
(9,9, 'Female', 2, 'Healthy'),
(10,10, 'Male', 9, 'Healthy');

INSERT INTO "Patrol" ("patrolID","staffID", "startTime", "endTime", "patrolType") VALUES 
(1,4, '08:00:00', '16:00:00', 'Routine'),
(2,7, '20:00:00', '04:00:00', 'Night Shift'),
(3,4, '09:00:00', '17:00:00', 'Anti-Poaching'),
(4,10, '10:00:00', '12:00:00', 'Management Control'),
(5,3, '06:00:00', '14:00:00', 'Scientific Study'),
(6,5, '12:00:00', '18:00:00', 'Technical Maintenance'),
(7,6, '08:00:00', '14:00:00', 'Health Screening'),
(8,8, '14:00:00', '22:00:00', 'Data Collection'),
(9,9, '07:00:00', '15:00:00', 'Logistics Support'),
(10,1, '09:00:00', '17:00:00', 'General Inspection');

INSERT INTO "Observation" 
("observationID","animalID", "locationID", "staffID", "behavior", "individualCount", "dateTime") 
VALUES 
(1,1, 1, 3, 'Hunting', 1, '2025-01-12 08:15:00'),
(2,2, 3, 6, 'Drinking Water', 2, '2025-02-03 14:40:00'),
(3,3, 2, 8, 'Feeding', 1, '2025-02-18 10:25:00'),
(4,4, 5, 10, 'Resting', 3, '2025-03-07 16:50:00'),
(5,5, 4, 6, 'Migrating', 1, '2025-03-29 07:30:00'),
(6,6, 1, 3, 'Playing', 2, '2025-04-11 13:05:00'),
(7,7, 2, 8, 'Sleeping', 1, '2025-04-26 21:10:00'),
(8,8, 8, 10, 'Running', 1, '2025-05-02 09:45:00'),
(9,9, 9, 4, 'Grazing', 5, '2025-05-14 18:20:00'),
(10,10, 10, 4, 'Drinking Water', 1, '2025-05-21 11:55:00');

INSERT INTO "Users"
("userID","userName","password")
VALUES
(1,'Admin','123'),
(2,'Staff','1234'),
(3,'Customer','1235');


DELETE FROM Animal
WHERE age > 14;

DELETE FROM Staff
WHERE staffID = 7;

DELETE FROM Users
WHERE userName = 'Staff';


UPDATE Animal
SET healthStatus = 'Recovering'
WHERE healthStatus = 'Injured';

UPDATE Location
SET areaName = 'Dense Forest'
WHERE areaName = 'Deep Forest';

UPDATE Staff
SET staffSalary = staffSalary * 1.10
WHERE staffRole = 'Veterinarian';
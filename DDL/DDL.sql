CREATE TABLE "Species" (
    "speciesID" INT PRIMARY KEY,
    "scientificName" VARCHAR(100) NOT NULL,
    "commonName" VARCHAR(100) NOT NULL,
    "conservationStatus" VARCHAR(50) NOT NULL
);

CREATE TABLE "Location" (
    "locationID" INT PRIMARY KEY,
    "areaName" VARCHAR(100) NOT NULL,
    "gpsCoordination" VARCHAR(50) NOT NULL,
    "habitatType" VARCHAR(50) NOT NULL
);

CREATE TABLE "Staff" (
    "staffID" INT PRIMARY KEY,
    "staffName" VARCHAR(100) NOT NULL,
    "staffRole" VARCHAR(50) NOT NULL,
    "staffSalary" DECIMAL(10,2) NOT NULL
);

CREATE TABLE "Animal" (
    "animalID" INT PRIMARY KEY,
    "speciesID" INT NOT NULL,
    "sex" VARCHAR(10) NOT NULL,
    "age" INT NOT NULL,
    "healthStatus" VARCHAR(50) NOT NULL,
    FOREIGN KEY ("speciesID") REFERENCES "Species"("speciesID")
);

CREATE TABLE "Patrol" (
    "patrolID" INT PRIMARY KEY,
    "staffID" INT NOT NULL,
    "startTime" TIME NOT NULL,
    "endTime" TIME NOT NULL,
    "patrolType" VARCHAR(50) NOT NULL,
    FOREIGN KEY ("staffID") REFERENCES "Staff"("staffID")
);

CREATE TABLE "Observation" (
    "observationID" INT PRIMARY KEY,
    "animalID" INT NOT NULL,
    "locationID" INT NOT NULL,
    "staffID" INT NOT NULL,
    "behavior" VARCHAR(100) NOT NULL,
    "individualCount" INT NOT NULL,
    "dateTime" TIMESTAMP NOT NULL,
    FOREIGN KEY ("animalID") REFERENCES "Animal"("animalID"),
    FOREIGN KEY ("locationID") REFERENCES "Location"("locationID"),
    FOREIGN KEY ("staffID") REFERENCES "Staff"("staffID")
);

CREATE TABLE "Users" (
    "userID" INT PRIMARY KEY,
    "userName" VARCHAR(100) NOT NULL,
    "password" VARCHAR(100) NOT NULL
);
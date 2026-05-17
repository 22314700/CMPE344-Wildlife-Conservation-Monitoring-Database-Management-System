SELECT s.commonName, COUNT(a.animalID) AS total_animals
FROM Species s
JOIN Animal a ON s.speciesID = a.speciesID
GROUP BY s.commonName
ORDER BY total_animals DESC;

SELECT staffRole, AVG(staffSalary) AS avg_salary
FROM Staff
GROUP BY staffRole
ORDER BY avg_salary DESC;

SELECT st.staffName, SUM(EXTRACT(HOUR FROM (endTime - startTime))) AS total_hours
FROM Patrol p
JOIN Staff st ON p.staffID = st.staffID
GROUP BY st.staffName
ORDER BY total_hours DESC;

SELECT l.areaName, COUNT(o.observationID) AS total_observations
FROM Observation o
JOIN Location l ON o.locationID = l.locationID
GROUP BY l.areaName
ORDER BY total_observations DESC;

SELECT a.animalID, s.commonName, a.healthStatus
FROM Animal a
JOIN Species s ON a.speciesID = s.speciesID
WHERE a.healthStatus <> 'Healthy';

SELECT st.staffName, COUNT(o.observationID) AS obs_count
FROM Observation o
JOIN Staff st ON o.staffID = st.staffID
GROUP BY st.staffName
ORDER BY obs_count DESC;

SELECT s.commonName, AVG(a.age) AS avg_age
FROM Animal a
JOIN Species s ON a.speciesID = s.speciesID
GROUP BY s.commonName
HAVING AVG(a.age) > 7;
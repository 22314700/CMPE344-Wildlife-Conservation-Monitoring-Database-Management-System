DELIMITER //
CREATE PROCEDURE increase_salary(IN p_staffID INT, IN p_percent DECIMAL(5,2))
BEGIN
	UPDATE Staff
	SET staffSalary = staffSalary + (staffSalary * p_percent / 100)
	WHERE staffID = p_staffID;
END //
DELIMITER;

CALL increase_salary(3,10);
SELECT * FROM Staff WHERE staffID = 3;


DELIMITER //
CREATE FUNCTION avg_age_by_species(p_speciesID INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
	DECLARE v_avg DECIMAL(5,2);
	SELECT AVG(age) INTO v_avg
	FROM Animal
	WHERE speciesID = p_speciesID;
	RETURN v_avg;
END //
DELIMITER;

SELECT avg_age_by_species(2);


DELIMITER //
CREATE TRIGGER check_salary
BEFORE INSERT ON Staff
FOR EACH ROW
BEGIN
	IF NEW.staffSalary < 0 THEN
	  SIGNAL SQLSTATE '45000'
	  SET MESSAGE_TEXT = 'Salary cannot be negative';
	END IF;
END //
DELIMITER;

INSERT INTO Staff(staffID, staffName, staffRole, staffSalary)
VALUES (11,'Test User', 'Intern', -5000);


DELIMITER //
CREATE FUNCTION endangered_species_count()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE v_count INT;
	SELECT COUNT(*) INTO v_count
	FROM Species
	WHERE conservationStatus IN ('Endangered', 'Critically Endangered');
	RETURN v_count;
END //
DELIMITER;

SELECT endangered_species_count()


DELIMITER //
CREATE PROCEDURE avg_salary_by_role(IN p_role VARCHAR(50))
BEGIN
	SELECT staffRole, AVG(staffSalary) AS avg_salary
	FROM Staff
	WHERE staffRole = p_role
	GROUP BY staffRole;
END //
DELIMITER;

CALL avg_salary_by_role('Biologist');
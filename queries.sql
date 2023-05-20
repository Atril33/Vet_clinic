/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth >='2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts  FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.3 AND weight_kg <= 17.3;

/* Day 2. */
BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
END;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
END;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
SAVEPOINT save_point;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT save_point;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(animals) FROM animals WHERE escape_attempts <= 0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts), neutered FROM animals GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-12-31' AND date_of_birth <= '2000-01-01' GROUP BY species;

/* Day 3. */
SELECT OWNER.* FROM owners OWNER JOIN animals ANIMAL_NAME ON OWNER.owner_id LIKE '%' || ANIMAL_NAME.name || '%' WHERE OWNER.full_name = 'Melody Pond';


SELECT animals.name AS animal_name, owners.full_name AS owner_name FROM owners JOIN animals ON animals.id= owners.id;
SELECT animals.name FROM species INNER JOIN animals ON animals.id = species.id WHERE species_id = 'Pokemon';
SELECT animals.name, owners.full_name FROM owners INNER JOIN animals ON animals.id = owners.id;
SELECT animals.species_id, COUNT(animals.id) AS total_animals FROM animals INNER JOIN species ON animals.id = species.id GROUP BY animals.species_id;
SELECT owners.full_name AS name, animals.name AS Animal_name, animals.species_id AS Animal_species FROM animals JOIN owners ON animals.id = owners.id WHERE species_id = 'Digimon' AND full_name = 'Jennifer Orwell';
SELECT owners.full_name As name, animals.name AS animal_name FROM animals JOIN owners ON animals.id = owners.id WHERE full_name = 'Dean Winchester ' AND escape_attempts = 0;
SELECT owners.full_name, COUNT(owners.age) AS total_animals FROM owners JOIN animals ON owners.id = animals.id GROUP BY full_name ORDER BY total_animals DESC LIMIT 1; 

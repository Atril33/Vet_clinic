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
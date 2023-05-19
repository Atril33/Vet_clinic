/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
   (1, 'Agumon', '2020-02-03', 0, true, 10.23),
   (2, 'Gabumon', '2018-11-15', 2, true, 8),
   (3, 'Pikachu', '2021-1-7', 1, false, 15.04),
   (4, 'Devimon', '2017-5-12', 5, true, 11);

/* Day 2. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
   (5, 'Angemon', '2005-06-12', 1, true, -45),
   (6, 'Boarmon', '2005-06-07', 7, true, 20.4),
   (7, 'Blossom', '1998-10-13', 3, true, 17),
   (8, 'Ditto', '2022-05-14', 4, true, 22),
   (9, 'Charmander', '2020-02-08', 0, false, -11),
   (10, 'Plantmon', '2021-11-15', 2, true, -5.7),
   (11, 'Squirtle', '1993-04-02', 3, false, -12.13);

/* Day 3. */

INSERT INTO owners(id, full_name, age)
VALUES
   (1, 'Sam Smith', 34),
   (2, 'Jennifer Orwell', 19),
   (3, 'Jennifer Orwell', 19),
   (4, 'Bob', 45),
   (5, 'Bob', 45),
   (6, 'Melody Pond', 77),
   (7, 'Melody Pond', 77),
   (8, 'Melody Pond', 77),
   (9, 'Dean Winchester', 14),
   (10, 'Dean Winchester', 14),
   (11, 'Jodie Whittaker', 38);

INSERT INTO species(id, name) 
VALUES
   (1, 'Agumon'),
   (2, 'Gabumon'),
   (3, 'Pikachu'),
   (4, 'Devimon'),
   (5, 'Angemon'),
   (6, 'Boarmon'),
   (7, 'Blossom'), 
   (8, 'Ditto'),
   (9, 'Charmander'),
   (10, 'Plantmon'),
   (11, 'Squirtle');

ALTER TABLE animals ADD COLUMN species_id VARCHAR(255);
UPDATE animals SET species_id = 
CASE
      WHEN name LIKE '%mon' THEN 'Digimon'
         Else 'Pokemon'
         END;

UPDATE owners SET owner_id = 'Agumon' WHERE id = 1;
UPDATE owners SET owner_id = 'Gabumon' WHERE id = 2;
UPDATE owners SET owner_id = 'Pikachu' WHERE id = 3;
UPDATE owners SET owner_id = 'Devimon' WHERE id = 4;
UPDATE owners SET owner_id = 'Plantmon' WHERE id = 5;
UPDATE owners SET owner_id = 'Charmander' WHERE id = 6;
UPDATE owners SET owner_id = 'Squirtle' WHERE id = 7;
UPDATE owners SET owner_id = 'Blossom' WHERE id = 8;
UPDATE owners SET owner_id = 'Angemon' WHERE id = 9;
UPDATE owners SET owner_id = 'Boarmon' WHERE id = 10;
UPDATE owners SET owner_id = NULL WHERE id = 11;

UPDATE animals SET owner_id = 'Agumon' WHERE id = 1;
UPDATE animals SET owner_id = 'Gabumon' WHERE id = 2;
UPDATE animals SET owner_id = 'Pikachu' WHERE id = 3;
UPDATE animals SET owner_id = 'Devimon' WHERE id = 4;
UPDATE animals SET owner_id = 'Plantmon' WHERE id = 5;
UPDATE animals SET owner_id = 'Charmander' WHERE id = 6;
UPDATE animals SET owner_id = 'Squirtle' WHERE id = 7;
UPDATE animals SET owner_id = 'Blossom' WHERE id = 8;
UPDATE animals SET owner_id = 'Angemon' WHERE id = 9;
UPDATE animals SET owner_id = 'Boarmon' WHERE id = 10;
UPDATE animals SET owner_id = NULL WHERE id = 11;


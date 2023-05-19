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
   (3, 'Bob', 45),
   (4, 'Melody Pond', 77),
   (5, 'Dean Winchester', 14),
   (6, 'Jodie Whittaker', 38);

INSERT INTO species(id, name) 
VALUES
   (1, 'Pokemon'),
   (2, 'Digimon');

ALTER TABLE animals ADD COLUMN species_id VARCHAR(255);
UPDATE animals SET species_id = 
CASE
      WHEN name LIKE '%mon' THEN 'Digimon'
         Else 'Pokemon'
         END;

INSERT INTO owners(owner_id) 
VALUES
('Agumon'),
('Gabumon and Pikachu'),
('Devimon and Plantmon'),
('Charmander, Squirtle, and Blossom'),
('Angemon and Boarmon');

UPDATE owners SET owner_id = 'Agumon' WHERE id = 1;
UPDATE owners SET owner_id = 'Gabumon and Pikachu' WHERE id = 2;
UPDATE owners SET owner_id = 'Devimon and Plantmon' WHERE id = 3;
UPDATE owners SET owner_id = 'Charmander, Squirtle, and Blossom' WHERE id = 4;
UPDATE owners SET owner_id = 'Angemon and Boarmon' WHERE id = 5;
UPDATE owners SET owner_id = NULL WHERE id = 6;

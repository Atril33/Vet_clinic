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
   (2, 'Digimon'),

   UPDATE animals
   SET species_id = (SELECT id from species WHERE name = 'Digimon')
   WHERE name like '%mon';

   UPDATE animals
   SET species_id = (SELECT id from species WHERE name = 'Pokemon')
   WHERE species_id IS NULL;

  UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
   WHERE name = 'Agumon';

   UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
   WHERE name = 'Gabumon' OR name = 'Pikachu';

   UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')
   WHERE name = 'Devimon' OR name = 'Plantmon';

   UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
   WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

   UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
   WHERE name = 'Angemon'  OR name = 'Boarmon';

/* Day 4. */

INSERT INTO vets (id, name, age, date_of_graduation) 
   VALUES 
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');


INSERT INTO specialties (vet_name, specialization)
VALUES ('Vet William Tatcher', 'Pokemon');

INSERT INTO specialties (vet_name, specialization)
VALUES ('Vet Stephanie Mendez', 'Digimon');

INSERT INTO specialties (vet_name, specialization)
VALUES ('Vet Stephanie Mendez', 'Pokemon');

INSERT INTO specialties (vet_name, specialization)
VALUES ('Vet Jack Harkness', 'Digimon');


INSERT INTO visits (vet_id_vets, animals_id, date_of_visit)
OVERRIDING SYSTEM VALUE
VALUES
  (DEFAULT, 1, '2020-05-24'),
  (DEFAULT, 3, '2020-07-22'),
  (DEFAULT, 4, '2021-02-02'),
  (DEFAULT, 2, '2020-01-05'),
  (DEFAULT, 2, '2020-03-08'),
  (DEFAULT, 2, '2020-05-14'),
  (DEFAULT, 3, '2021-05-04'),
  (DEFAULT, 4, '2021-02-24'),
  (DEFAULT, 2, '2019-12-21'),
  (DEFAULT, 1, '2020-08-10'),
  (DEFAULT, 2, '2021-04-07'),
  (DEFAULT, 3, '2019-09-29'),
  (DEFAULT, 4, '2020-10-03'),
  (DEFAULT, 4, '2020-11-04'),
  (DEFAULT, 2, '2019-01-24'),
  (DEFAULT, 2, '2019-05-15'),
  (DEFAULT, 2, '2020-02-27'),
  (DEFAULT, 2, '2020-08-03'),
  (DEFAULT, 3, '2020-05-24'),
  (DEFAULT, 1, '2021-01-11');

ALTER TABLE specializations DISABLE TRIGGER ALL;

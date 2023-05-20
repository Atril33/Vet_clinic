/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

\c vet_clinic;

CREATE TABLE animals (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
date_of_birth date,
escape_attempts integer,
neutered boolean,
weight_kg decimal
);

/* Day 2. */

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

/* Day 3. */

CREATE TABLE owners (
  id INTEGER,
  full_name VARCHAR(100),
  age INTEGER,
  PRIMARY KEY(id)
  );


CREATE TABLE species (
id INTEGER,
name VARCHAR(255),
PRIMARY KEY(id)
);

ALTER TABLE aniamls DROP COLUMN species;

ALTER TABLE species ADD COLUMN species_id VARCHAR(255);
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id VARCHAR(255);
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);
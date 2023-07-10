/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	date_of_birth DATE,
	escape_attempts INTEGER,
	neutered BOOLEAN,
	weight_kg DECIMAL
);

ALTER TABLE animals
  ADD species VARCHAR(250);

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR,
	age INTEGER
);

CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name VARCHAR
);

--modify animals table

CREATE SEQUENCE animals_id_seq;

ALTER TABLE animals
    DROP CONSTRAINT animals_pkey, 
    ALTER COLUMN id SET DEFAULT nextval('animals_id_seq'),
    ADD COLUMN species_id INTEGER REFERENCES species (id),
    ADD COLUMN owner_id INTEGER REFERENCES owners (id);

ALTER TABLE animals
    ADD PRIMARY KEY (id);
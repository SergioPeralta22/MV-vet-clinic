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

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(250),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets (id),
  species_id INTEGER REFERENCES species (id),
  PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits(
  animal_id INT,
  vet_id INT,
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  visit_date DATE
);

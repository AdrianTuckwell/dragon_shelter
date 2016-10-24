DROP TABLE owners;
DROP TABLE dragons;
DROP TABLE shelters;

CREATE TABLE owners (
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE dragons (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  dragon_id int4 REFERENCES dragons(id)
);

CREATE TABLE shelters (
  id serial4 PRIMARY KEY,
  owner_id int4 references owners(id) ON DELETE CASCADE,
  dragon_id int4 references dragons(id) ON DELETE CASCADE
);

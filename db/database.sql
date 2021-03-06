DROP TABLE adoptions;
DROP TABLE owners;
DROP TABLE dragons;


CREATE TABLE owners (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE dragons (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  trained BOOLEAN DEFAULT FALSE,
  adopted BOOLEAN DEFAULT FALSE,
  admission_date DATE,
  trained_date DATE,
  adoption_date DATE,
  dragon_id int4 REFERENCES dragons(id)
);

CREATE TABLE adoptions (
  id serial4 PRIMARY KEY,
  owner_id int4 REFERENCES owners(id) ON DELETE CASCADE,
  dragon_id int4 REFERENCES dragons(id) ON DELETE CASCADE
);

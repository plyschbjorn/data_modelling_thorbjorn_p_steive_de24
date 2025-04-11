CREATE SCHEMA IF NOT EXISTS yrkesco;



ALTER DATABASE data_modeling_course_db SET search_path TO yrkesco;


-- set search_path TO YrkesCo;


CREATE TABLE IF NOT EXISTS stad (
  stad_id SERIAL PRIMARY KEY,
  stad VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS adress (
  adress_id SERIAL PRIMARY KEY,
  stad_id INTEGER NOT null REFERENCES stad,
  gatuadress VARCHAR(100) NOT NULL,
  postnummer VARCHAR(6) NOT NULL
);

CREATE TABLE IF NOT EXISTS skola (
  skol_id SERIAL PRIMARY KEY,
  adress_id INTEGER NOT null REFERENCES adress,
  skolnamn VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS personuppgift (
  pu_id SERIAL PRIMARY KEY,
  adress_id INTEGER NOT null REFERENCES adress,
  personnummer CHAR(12) NOT NULL
);

CREATE TABLE IF NOT EXISTS program (
  program_id VARCHAR(10) PRIMARY KEY,
  programnamn VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS skolprogram (
  skol_id INTEGER NOT NULL REFERENCES skola,
  program_id VARCHAR NOT NULL REFERENCES program,
  PRIMARY KEY (skol_id, program_id)
);

CREATE TABLE IF NOT EXISTS beviljad (
  beviljad_id SERIAL PRIMARY KEY,
  program_id VARCHAR(10) NOT NULL REFERENCES program,
  anno VARCHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS kurs (
  kurskod VARCHAR(10) PRIMARY KEY,
  kursnamn VARCHAR(50) NOT NULL,
  points INTEGER NOT NULL,
  beskrivning VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS kursprogram (
  kurskod VARCHAR NOT NULL REFERENCES kurs,
  program_id VARCHAR NOT NULL REFERENCES program,
  PRIMARY KEY (kurskod, program_id)
);

CREATE TABLE IF NOT EXISTS yrkesroll (
  yrkes_id SERIAL PRIMARY KEY,
  titel VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS personal (
  personal_id INTEGER PRIMARY KEY,
  yrkes_id INTEGER NOT NULL REFERENCES yrkesroll,
  namn VARCHAR(50) NOT NULL,
  efternamn VARCHAR(100) NOT NULL,
  epost VARCHAR(255) NOT NULL,
  telefon VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS konsultbolag (
  org_nummer VARCHAR(11) PRIMARY KEY,
  adress_id INTEGER NOT NULL REFERENCES adress,
  bolagsnamn VARCHAR(100) NOT NULL,
  f_skatt BOOL NOT NULL
);

CREATE TABLE IF NOT EXISTS konsult (
  org_nummer VARCHAR NOT NULL REFERENCES konsultbolag,
  personal_id INTEGER NOT NULL REFERENCES personal,
  timpris FLOAT NOT NULL,
  PRIMARY KEY (org_nummer, personal_id)
);

CREATE TABLE IF NOT EXISTS fast_arbete (
  pu_id INTEGER NOT NULL REFERENCES personuppgift,
  personal_id INTEGER NOT NULL REFERENCES personal,
  PRIMARY KEY (pu_id, personal_id)
);

CREATE TABLE IF NOT EXISTS skolpersonal (
  skol_id INTEGER NOT NULL REFERENCES skola,
  personal_id INTEGER NOT NULL REFERENCES personal,
  PRIMARY KEY (skol_id, personal_id)
);

CREATE TABLE IF NOT EXISTS kurspersonal (
  kurskod VARCHAR NOT NULL REFERENCES kurs,
  personal_id INTEGER NOT NULL REFERENCES personal,
  PRIMARY KEY (kurskod, personal_id)
);

CREATE TABLE IF NOT EXISTS fri_kurs (
  fk_id SERIAL PRIMARY KEY,
  skol_id INTEGER REFERENCES skola,
  kurskod VARCHAR REFERENCES kurs,
  personal_id INTEGER REFERENCES personal
);

CREATE TABLE IF NOT EXISTS student (
  student_id SERIAL PRIMARY KEY,
  pu_id INTEGER NOT NULL REFERENCES personuppgift,
  skol_id INTEGER NOT NULL REFERENCES skola,
  namn VARCHAR(50) NOT NULL,
  efternamn VARCHAR(100) NOT NULL,
  epost VARCHAR(255) NOT NULL,
  telefon VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS fri_student (
  fk_id INTEGER NOT NULL REFERENCES fri_kurs,
  student_id INTEGER NOT NULL REFERENCES student,
  PRIMARY KEY (fk_id, student_id)
);

CREATE TABLE IF NOT EXISTS klass (
  klass_id SERIAL PRIMARY KEY,
  beviljad_id INTEGER NOT NULL REFERENCES beviljad,
  skol_id INTEGER NOT NULL REFERENCES skola,
  personal_id INTEGER NOT NULL REFERENCES personal
);

CREATE TABLE IF NOT EXISTS antagen_student (
  klass_id INTEGER NOT NULL REFERENCES klass,
  student_id INTEGER NOT NULL REFERENCES student,
  PRIMARY KEY (klass_id, student_id)
);

CREATE TABLE IF NOT EXISTS kursbetyg (
  kurskod VARCHAR NOT NULL REFERENCES kurs,
  student_id INTEGER NOT NULL REFERENCES student,
  betyg VARCHAR(3) NOT NULL,
  PRIMARY KEY (kurskod, student_id)
);

CREATE TABLE IF NOT EXISTS ledningsgrupp (
  ledningsgrupp_id SERIAL PRIMARY KEY,
  program_id VARCHAR NOT NULL REFERENCES program,
  skol_id INTEGER NOT NULL REFERENCES skola
);

CREATE TABLE IF NOT EXISTS ledningspersonal (
  ledningsgrupp_id INTEGER NOT NULL REFERENCES ledningsgrupp,
  personal_id INTEGER NOT NULL REFERENCES personal,
  PRIMARY KEY (ledningsgrupp_id, personal_id)
);

CREATE TABLE IF NOT EXISTS ledningstudent (
  ledningsgrupp_id INTEGER NOT NULL REFERENCES ledningsgrupp,
  student_id INTEGER NOT NULL REFERENCES student,
  PRIMARY KEY (ledningsgrupp_id, student_id)
);

CREATE TABLE IF NOT EXISTS firma (
  org_nummer VARCHAR(11) PRIMARY KEY,
  namn VARCHAR(100) NOT NULL,
  representant VARCHAR(100) NOT NULL,
  epost VARCHAR(255) NOT NULL,
  telefon VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS ledningsfirma (
  ledningsgrupp_id INTEGER NOT NULL REFERENCES ledningsgrupp,
  org_nummer VARCHAR NOT NULL REFERENCES firma,
  PRIMARY KEY (ledningsgrupp_id, org_nummer)
);

CREATE TABLE IF NOT EXISTS protokoll (
  protokoll_id SERIAL PRIMARY KEY,
  ledningsgrupp_id INTEGER NOT NULL REFERENCES ledningsgrupp,
  protokoll VARCHAR(100000) NOT NULL,
  datum DATE NOT NULL
);
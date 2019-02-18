Drop PROCEDURE IF EXISTS createAllTables; DELIMITER //
CREATE PROCEDURE createAllTables()
BEGIN
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-02-17 20:34:47.369

-- tables
-- Table: algorithms
CREATE TABLE algorithms (
    ID int NOT NULL AUTO_INCREMENT,
    about text NOT NULL,
    contributors_ID int NULL,
    resourceCategories_ID int NOT NULL,
    aName varchar(45) NOT NULL,
    CONSTRAINT algorithms_pk PRIMARY KEY (ID)
);

-- Table: artLocations
CREATE TABLE artLocations (
    ID int NOT NULL AUTO_INCREMENT,
    locationName varchar(45) NOT NULL,
    locationCity varchar(45) NULL,
    CONSTRAINT artLocations_pk PRIMARY KEY (ID)
);

-- Table: artMediums
CREATE TABLE artMediums (
    ID int NOT NULL AUTO_INCREMENT,
    mName varchar(45) NOT NULL,
    CONSTRAINT artMediums_pk PRIMARY KEY (ID)
);

-- Table: biographies
CREATE TABLE biographies (
    ID int NOT NULL AUTO_INCREMENT,
    about text NOT NULL,
    contributors_ID int NULL,
    resourceCategories_ID int NOT NULL,
    CONSTRAINT biographies_pk PRIMARY KEY (ID)
);

-- Table: contributors
CREATE TABLE contributors (
    ID int NOT NULL AUTO_INCREMENT,
    firstName varchar(45) NOT NULL,
    lastName varchar(45) NULL,
    born varchar(5) NULL,
    died varchar(5) NULL,
    nationality varchar(10) NULL,
    knownFor varchar(90) NULL,
    CONSTRAINT contributors_pk PRIMARY KEY (ID)
);

-- Table: developers
CREATE TABLE developers (
    ID int NOT NULL AUTO_INCREMENT,
    companyName varchar(45) NOT NULL,
    CONSTRAINT developers_pk PRIMARY KEY (ID)
);

-- Table: notablePaintings
CREATE TABLE notablePaintings (
    contributors_ID int NOT NULL,
    paintings_ID int NOT NULL,
    CONSTRAINT notablePaintings_pk PRIMARY KEY (contributors_ID,paintings_ID)
);

-- Table: paintings
CREATE TABLE paintings (
    ID int NOT NULL AUTO_INCREMENT,
    about text NULL,
    contributors_ID int NULL,
    resourceCategories_ID int NULL,
    pName varchar(45) NOT NULL,
    yearStarted varchar(4) NULL,
    yearFinished varchar(4) NULL,
    dWidth decimal(5,0) NULL,
    dHeight decimal(5,0) NULL,
    artLocations_ID int NULL,
    artMediums_ID int NULL,
    CONSTRAINT paintings_pk PRIMARY KEY (ID)
);

-- Table: programmingLanguages
CREATE TABLE programmingLanguages (
    ID int NOT NULL AUTO_INCREMENT,
    about text NOT NULL,
    contributors_ID int NULL,
    resourceCategories_ID int NOT NULL,
    plName varchar(45) NOT NULL,
    developers_ID int NULL,
    CONSTRAINT programmingLanguages_pk PRIMARY KEY (ID)
);

-- Table: resourceCategories
CREATE TABLE resourceCategories (
    ID int NOT NULL AUTO_INCREMENT,
    categoryName varchar(45) NOT NULL,
    CONSTRAINT resourceCategories_pk PRIMARY KEY (ID)
);

-- Table: theorems
CREATE TABLE theorems (
    ID int NOT NULL AUTO_INCREMENT,
    about text NOT NULL,
    contributors_ID int NULL,
    resourceCategories_ID int NOT NULL,
    tName varchar(45) NOT NULL,
    CONSTRAINT theorems_pk PRIMARY KEY (ID)
);

-- foreign keys
-- Reference: algorithms_contributors (table: algorithms)
ALTER TABLE algorithms ADD CONSTRAINT algorithms_contributors FOREIGN KEY algorithms_contributors (contributors_ID)
    REFERENCES contributors (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: algorithms_resourceCategories (table: algorithms)
ALTER TABLE algorithms ADD CONSTRAINT algorithms_resourceCategories FOREIGN KEY algorithms_resourceCategories (resourceCategories_ID)
    REFERENCES resourceCategories (ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- Reference: biographys_contributors (table: biographies)
ALTER TABLE biographies ADD CONSTRAINT biographys_contributors FOREIGN KEY biographys_contributors (contributors_ID)
    REFERENCES contributors (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: biographys_resourceCategories (table: biographies)
ALTER TABLE biographies ADD CONSTRAINT biographys_resourceCategories FOREIGN KEY biographys_resourceCategories (resourceCategories_ID)
    REFERENCES resourceCategories (ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- Reference: notablePaintings_contributors (table: notablePaintings)
ALTER TABLE notablePaintings ADD CONSTRAINT notablePaintings_contributors FOREIGN KEY notablePaintings_contributors (contributors_ID)
    REFERENCES contributors (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: notablePaintings_paintings (table: notablePaintings)
ALTER TABLE notablePaintings ADD CONSTRAINT notablePaintings_paintings FOREIGN KEY notablePaintings_paintings (paintings_ID)
    REFERENCES paintings (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: paintings_artLocations (table: paintings)
ALTER TABLE paintings ADD CONSTRAINT paintings_artLocations FOREIGN KEY paintings_artLocations (artLocations_ID)
    REFERENCES artLocations (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: paintings_artMediums (table: paintings)
ALTER TABLE paintings ADD CONSTRAINT paintings_artMediums FOREIGN KEY paintings_artMediums (artMediums_ID)
    REFERENCES artMediums (ID)
    ON DELETE RESTRICT
    ON UPDATE SET NULL;

-- Reference: paintings_contributors (table: paintings)
ALTER TABLE paintings ADD CONSTRAINT paintings_contributors FOREIGN KEY paintings_contributors (contributors_ID)
    REFERENCES contributors (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: paintings_resourceCategories (table: paintings)
ALTER TABLE paintings ADD CONSTRAINT paintings_resourceCategories FOREIGN KEY paintings_resourceCategories (resourceCategories_ID)
    REFERENCES resourceCategories (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: programmingLanguages_contributors (table: programmingLanguages)
ALTER TABLE programmingLanguages ADD CONSTRAINT programmingLanguages_contributors FOREIGN KEY programmingLanguages_contributors (contributors_ID)
    REFERENCES contributors (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: programmingLanguages_developers (table: programmingLanguages)
ALTER TABLE programmingLanguages ADD CONSTRAINT programmingLanguages_developers FOREIGN KEY programmingLanguages_developers (developers_ID)
    REFERENCES developers (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: programmingLanguages_resourceCategories (table: programmingLanguages)
ALTER TABLE programmingLanguages ADD CONSTRAINT programmingLanguages_resourceCategories FOREIGN KEY programmingLanguages_resourceCategories (resourceCategories_ID)
    REFERENCES resourceCategories (ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- Reference: theorems_contributors (table: theorems)
ALTER TABLE theorems ADD CONSTRAINT theorems_contributors FOREIGN KEY theorems_contributors (contributors_ID)
    REFERENCES contributors (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: theorems_resourceCategories (table: theorems)
ALTER TABLE theorems ADD CONSTRAINT theorems_resourceCategories FOREIGN KEY theorems_resourceCategories (resourceCategories_ID)
    REFERENCES resourceCategories (ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- End of file.
END // DELIMITER ;
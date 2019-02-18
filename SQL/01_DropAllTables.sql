-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-02-13 21:57:57.975
Drop PROCEDURE IF EXISTS dropAllTables; DELIMITER //
CREATE PROCEDURE dropAllTables()
 BEGIN
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-02-17 20:34:47.369

-- foreign keys
ALTER TABLE algorithms
    DROP FOREIGN KEY algorithms_contributors;

ALTER TABLE algorithms
    DROP FOREIGN KEY algorithms_resourceCategories;

ALTER TABLE biographies
    DROP FOREIGN KEY biographys_contributors;

ALTER TABLE biographies
    DROP FOREIGN KEY biographys_resourceCategories;

ALTER TABLE notablePaintings
    DROP FOREIGN KEY notablePaintings_contributors;

ALTER TABLE notablePaintings
    DROP FOREIGN KEY notablePaintings_paintings;

ALTER TABLE paintings
    DROP FOREIGN KEY paintings_artLocations;

ALTER TABLE paintings
    DROP FOREIGN KEY paintings_artMediums;

ALTER TABLE paintings
    DROP FOREIGN KEY paintings_contributors;

ALTER TABLE paintings
    DROP FOREIGN KEY paintings_resourceCategories;

ALTER TABLE programmingLanguages
    DROP FOREIGN KEY programmingLanguages_contributors;

ALTER TABLE programmingLanguages
    DROP FOREIGN KEY programmingLanguages_developers;

ALTER TABLE programmingLanguages
    DROP FOREIGN KEY programmingLanguages_resourceCategories;

ALTER TABLE theorems
    DROP FOREIGN KEY theorems_contributors;

ALTER TABLE theorems
    DROP FOREIGN KEY theorems_resourceCategories;

-- tables
DROP TABLE algorithms;

DROP TABLE artLocations;

DROP TABLE artMediums;

DROP TABLE biographies;

DROP TABLE contributors;

DROP TABLE developers;

DROP TABLE notablePaintings;

DROP TABLE paintings;

DROP TABLE programmingLanguages;

DROP TABLE resourceCategories;

DROP TABLE theorems;

-- End of file.
END // DELIMITER ;


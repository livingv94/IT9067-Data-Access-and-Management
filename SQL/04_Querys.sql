Drop PROCEDURE IF EXISTS showAllValues; DELIMITER //
CREATE PROCEDURE showAllValues()
BEGIN
SELECT
	r.categoryName AS 'Category',
    'Paintings' AS 'Type',
    CONCAT(firstName,' ',lAStName) AS 'Contributor',
    born AS 'Born',
    died AS 'Died',
    nationality AS 'Nationality',
    about AS 'About',
    pName AS 'Resource Name',
    CONCAT(yearStarted, ' - ', yearFinished) AS 'Year',
    CONCAT(dWidth, 'mm x ', dHeight, 'mm') AS 'Dimensions',
    CONCAT(locationName,', ',locationCity) AS 'Location',
    mName AS 'Medium',
    '' AS 'Company Name'
FROM paintings p
    LEFT JOIN resourcecategories r
    ON p.resourceCategories_ID = r.ID
    LEFT JOIN contributors c
    ON p.contributors_ID = c.ID
    LEFT JOIN artlocations al
    ON p.artLocations_ID = al.ID
    LEFT JOIN artmediums am
    ON p.artMediums_ID = am.ID
UNION SELECT
	r.categoryName, 'Algorithms', CONCAT(firstName,' ',lAStName), born, died, nationality, about, aName, '', '', '', '', ''
	FROM algorithms a
	LEFT JOIN resourcecategories r
    ON a.resourceCategories_ID = r.ID
	LEFT JOIN contributors c
    ON a.contributors_ID = c.ID
UNION SELECT
	r.categoryName, 'Theorems', CONCAT(firstName,' ',lAStName), born, died, nationality, about, tName, '', '', '', '', ''
    FROM theorems t
	LEFT JOIN resourcecategories r
    ON t.resourceCategories_ID = r.ID
	LEFT JOIN contributors c
    ON t.contributors_ID = c.ID
UNION SELECT
	r.categoryName, 'Biographies', CONCAT(firstName,' ',lAStName), born, died, nationality, about,  CONCAT(firstName, "'s Biography"), '', '', '', '', ''
	FROM biographies b
    LEFT JOIN resourcecategories r
    ON b.resourceCategories_ID = r.ID
    LEFT JOIN contributors c
    ON b.contributors_ID = c.ID
UNION SELECT
	r.categoryName, 'Programming Languages', CONCAT(firstName,' ',lAStName), born, died, nationality, about, plName, '', '', '', '', companyName
	FROM programminglanguages pl
    LEFT JOIN resourcecategories r
    ON pl.resourceCategories_ID = r.ID
    LEFT JOIN contributors c
    ON pl.contributors_ID = c.ID
    LEFT JOIN developers dv
    ON pl.developers_ID = dv.ID;
-- End of file.
END // DELIMITER ;
-- 
-- ============================================================================================================================================================
-- 
Drop PROCEDURE IF EXISTS showValuesByCategory; DELIMITER //
CREATE PROCEDURE showValuesByCategory(SEARCHTERM varchar(45))
BEGIN
SELECT
	r.categoryName AS 'Category',
    'Paintings' AS 'Type',
    CONCAT(firstName,' ',lAStName) AS 'Contributor',
    born AS 'Born',
    died AS 'Died',
    nationality AS 'Nationality',
    about AS 'About',
    pName AS 'Resource Name',
    CONCAT(yearStarted, ' - ', yearFinished) AS 'Year',
    CONCAT(dWidth, 'mm x ', dHeight, 'mm') AS 'Dimensions',
    CONCAT(locationName,', ',locationCity) AS 'Location',
    mName AS 'Medium',
    '' AS 'Company Name'
FROM paintings p
    LEFT JOIN resourcecategories r
    ON p.resourceCategories_ID = r.ID
    LEFT JOIN contributors c
    ON p.contributors_ID = c.ID
    LEFT JOIN artlocations al
    ON p.artLocations_ID = al.ID
    LEFT JOIN artmediums am
    ON p.artMediums_ID = am.ID
    WHERE r.categoryName LIKE SEARCHTERM
UNION SELECT
	r.categoryName, 'Algorithms', CONCAT(firstName,' ',lAStName), born, died, nationality, about, aName, '', '', '', '', ''
	FROM algorithms a
	LEFT JOIN resourcecategories r
    ON a.resourceCategories_ID = r.ID
	LEFT JOIN contributors c
    ON a.contributors_ID = c.ID
    WHERE r.categoryName LIKE SEARCHTERM
UNION SELECT
	r.categoryName, 'Theorems', CONCAT(firstName,' ',lAStName), born, died, nationality, about, tName, '', '', '', '', ''
    FROM theorems t
	LEFT JOIN resourcecategories r
    ON t.resourceCategories_ID = r.ID
	LEFT JOIN contributors c
    ON t.contributors_ID = c.ID
    WHERE r.categoryName LIKE SEARCHTERM
UNION SELECT
	r.categoryName, 'Biographies', CONCAT(firstName,' ',lAStName), born, died, nationality, about,  CONCAT(firstName, "'s Biography"), '', '', '', '', ''
	FROM biographies b
    LEFT JOIN resourcecategories r
    ON b.resourceCategories_ID = r.ID
    LEFT JOIN contributors c
    ON b.contributors_ID = c.ID
    WHERE r.categoryName LIKE SEARCHTERM
UNION SELECT
	r.categoryName, 'Programming Languages', CONCAT(firstName,' ',lAStName), born, died, nationality, about, plName, '', '', '', '', companyName
	FROM programminglanguages pl
    LEFT JOIN resourcecategories r
    ON pl.resourceCategories_ID = r.ID
    LEFT JOIN contributors c
    ON pl.contributors_ID = c.ID
    LEFT JOIN developers dv
    ON pl.developers_ID = dv.ID
    WHERE r.categoryName LIKE SEARCHTERM;
-- End of file.
END // DELIMITER ;
-- 
-- ============================================================================================================================================================
-- 
Drop PROCEDURE IF EXISTS showValuesByKeyWord; DELIMITER //
CREATE PROCEDURE showValuesByKeyWord(KEYWORD varchar(45))
BEGIN
SELECT
	r.categoryName AS 'Category',
    'Paintings' AS 'Type',
    CONCAT(firstName,' ',lAStName) AS 'Contributor',
    born AS 'Born',
    died AS 'Died',
    nationality AS 'Nationality',
    about AS 'About',
    pName AS 'Resource Name',
    CONCAT(yearStarted, ' - ', yearFinished) AS 'Year',
    CONCAT(dWidth, 'mm x ', dHeight, 'mm') AS 'Dimensions',
    CONCAT(locationName,', ',locationCity) AS 'Location',
    mName AS 'Medium',
    '' AS 'Company Name'
FROM paintings p
    LEFT JOIN resourcecategories r
    ON p.resourceCategories_ID = r.ID
    LEFT JOIN contributors c
    ON p.contributors_ID = c.ID
    LEFT JOIN artlocations al
    ON p.artLocations_ID = al.ID
    LEFT JOIN artmediums am
    ON p.artMediums_ID = am.ID
    WHERE pName LIKE CONCAT('%', KEYWORD, '%')
UNION SELECT
	r.categoryName, 'Algorithms', CONCAT(firstName,' ',lAStName), born, died, nationality, about, aName, '', '', '', '', ''
	FROM algorithms a
	LEFT JOIN resourcecategories r
    ON a.resourceCategories_ID = r.ID
	LEFT JOIN contributors c
    ON a.contributors_ID = c.ID
    WHERE aName LIKE CONCAT('%', KEYWORD, '%')
UNION SELECT
	r.categoryName, 'Theorems', CONCAT(firstName,' ',lAStName), born, died, nationality, about, tName, '', '', '', '', ''
    FROM theorems t
	LEFT JOIN resourcecategories r
    ON t.resourceCategories_ID = r.ID
	LEFT JOIN contributors c
    ON t.contributors_ID = c.ID
    WHERE tName LIKE CONCAT('%', KEYWORD, '%')
UNION SELECT
	r.categoryName, 'Biographies', CONCAT(firstName,' ',lAStName), born, died, nationality, about,  CONCAT(firstName, "'s Biography"), '', '', '', '', ''
	FROM biographies b
    LEFT JOIN resourcecategories r
    ON b.resourceCategories_ID = r.ID
    LEFT JOIN contributors c
    ON b.contributors_ID = c.ID
    WHERE CONCAT(firstName, "'s Biography") LIKE CONCAT('%', KEYWORD, '%')
UNION SELECT
	r.categoryName, 'Programming Languages', CONCAT(firstName,' ',lAStName), born, died, nationality, about, plName, '', '', '', '', companyName
	FROM programminglanguages pl
    LEFT JOIN resourcecategories r
    ON pl.resourceCategories_ID = r.ID
    LEFT JOIN contributors c
    ON pl.contributors_ID = c.ID
    LEFT JOIN developers dv
    ON pl.developers_ID = dv.ID
    WHERE plName LIKE CONCAT('%', KEYWORD, '%');
-- End of file.
END // DELIMITER ;

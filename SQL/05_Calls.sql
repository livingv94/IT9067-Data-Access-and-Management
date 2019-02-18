-- Creat the database
CALL dropAllTables();
CALL createAllTables();
CALL insertAllValues();

-- Shows all data
CALL showAllValues();

-- Shows data be input Category
CALL showValuesByCategory('Arts');
CALL showValuesByCategory('Art');
CALL showValuesByCategory(''); 
CALL showValuesByCategory('%');
CALL showValuesByCategory('Mathematics');

-- Show articles by key word in title
CALL showValuesByKeyWord('ickso');
CALL showValuesByKeyWord('Quicksort');
CALL showValuesByKeyWord("Leonardo's Biography");
CALL showValuesByKeyWord('Biography');
CALL showValuesByKeyWord('');
CALL showValuesByKeyWord(' ');
CALL showValuesByKeyWord('%');
SELECT *
FROM vehicles;
--Concatenate the fuel and cyl fields together (with a space in between).
SELECT fuel || ' ' || cyl
FROM vehicles;

--Replace any occurrences of the word “Small” in the class field with an empty string.
SELECT class, 
       REPLACE(class,'Small', '')
FROM vehicles;

--Create a field that parses out whether the vehicle is Automatic or Manual from the trans field (without the additional speed info).
SELECT trans,
       split_part(trans, ' ', 1)
	   AS split
FROM vehicles;

--Filter for records where the drive train info (ex. 2WD, 4WD, AWD, etc.) is listed at the end of the model field.
SELECT model 
FROM vehicles
WHERE model ILIKE '%wd';
--The following also works
SELECT model
FROM vehicles
WHERE model LIKE '%WD';

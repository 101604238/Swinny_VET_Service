/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF '$(LoadTestData)' = 'true'

BEGIN 

DELETE FROM [Treatment];
DELETE FROM [Procedure];
DELETE FROM [Pet];
DELETE FROM [Owner];

INSERT INTO Owner(OwnerID, OwnerFName, OwnerLName, OwnerPhoneNumber) VALUES
	(1, 'Frank', 'Sinatra', 400111222),
	(2, 'Duke', 'Ellingtion', 400222333),
	(3, 'Ella', 'Fitzgerald', 400333444);
	
INSERT INTO Pet(PetName, PetType, OwnerID) VALUES
	('Buster', 'Dog', 1),
	('Fluffy', 'Cat', 1),
	('Stew', 'Rabbit', 2),
	('Buster', 'Dog', 3),
	('Pooper', 'Dog', 3);

INSERT INTO [Procedure](ProcedureID, ProcedureDescription, ProcedurePrice) VALUES
	(1, 'Rabies Vaccination', 24),
	(10, 'Examine and Treat Wound', 30),
	(5, 'Heart Worm Test', 25),
	(8, 'Tetnus Vaccination', 17);

INSERT INTO Treatment(PetName, OwnerID, ProcedureID, TreatmentDate, TreatmentNotes, TreatmentPrice) VALUES
	('Buster', 1, 1, '20/6/17', 'Routine Vaccination', 22),
	('Buster', 1, 1, '15/5/18', 'Booster Shot', 24),
	('Fluffy', 1, 10, '10/5/18', 'Wounds sustained in apparent cat fight.', 30),
	('Stew', 2, 10, '10/5/18', 'Wounds sustained during attempt to cook the stew.', 30),
	('Pooper', 3, 5, '18/5/18', 'Routine Test', 25);
	
END;
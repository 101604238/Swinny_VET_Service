CREATE TABLE [dbo].[Treatment]
(
	[PetName] NVARCHAR(50) NOT NULL,
	[OwnerID] INT NOT NULL,
	[ProcedureID] INT NOT NULL,
	[TreatmentDate] NVARCHAR(10) NOT NULL,
	[TreatmentNotes] NVARCHAR(200) NOT NULL,
	[TreatmentPrice] INT NOT NULL,

	CONSTRAINT PK_Treatment PRIMARY KEY (PetName, OwnerID, ProcedureID, TreatmentDate),
	CONSTRAINT FK_Treatment_PetName FOREIGN KEY (PetName, OwnerID) REFERENCES [Pet](PetName, OwnerID),
	CONSTRAINT FK_Treatment_ProcedureID FOREIGN KEY (ProcedureID) REFERENCES [Procedure](ProcedureID)
)

-- Creation de la base de données GestionTest et des tables Employee, Depertement et Projet
CREATE DATABASE GestionTest;

-- Creation de la table Employee
CREATE TABLE GestionTest.dbo.Employee (
	ID INT PRIMARY KEY,
	Nom VARCHAR(30),
	Poste VARCHAR(100),
	Salaire DECIMAL(10,2)
);

-- Creation de la table Depertement
CREATE TABLE GestionTest.dbo.Depertement (
	NumS INT PRIMARY KEY,
	Libele VARCHAR(100),
	Responsable VARCHAR(100),
);

-- Creation de la table Projet
CREATE TABLE GestionTest.dbo.Projet (
	NumP INT PRIMARY KEY,
	Titre VARCHAR(100),
	DateDebut DATE,
	DateFin DATE,
);
GO

-- Creation de la vue OLD_Employee_Vue pour afficher les employés avec un salaire supérieur à 5000
CREATE VIEW OLD_Employee_Vue AS
SELECT Nom, Salaire
FROM GestionTest.dbo.Employee
WHERE Salaire > 5000;
GO

-- Creation de l'index sur la colonne Libele de la table Depertement
CREATE INDEX Libele_index 
ON GestionTest.dbo.Depertement(Libele);

-- Utilisation de l'index Libele_index pour effectuer une requête sur la table Depertement
SELECT Libele 
FROM GestionTest.dbo.Depertement WITH (INDEX (Libele_index))
WHERE NumS = 3;

-- Creation de l'index sur la colonne NumS de la table Depertement
CREATE UNIQUE INDEX NumS_index 
ON GestionTest.dbo.Depertement(NumS);

-- Utilisation de l'index NumS_index pour effectuer une requête sur la table Depertement
SELECT * 
FROM GestionTest.dbo.Depertement WITH (INDEX (NumS_index));

-- Creation de l'index sur les colonnes Libele et Responsable de la table Depertement
CREATE INDEX Lib_Res_index 
ON GestionTest.dbo.Depertement(Libele, Responsable);

-- Utilisation de l'index Lib_Res_index pour effectuer une requête sur la table Depertement
SELECT * 
FROM GestionTest.dbo.Depertement WITH (INDEX (Lib_Res_index));

-- Modification de la table Employee pour ajouter une colonne Age, modifier la taille de la colonne Nom et supprimer la colonne Age
ALTER TABLE GestionTest.dbo.Employee
ADD Age INT;

-- Modification de la taille de la colonne Nom
ALTER TABLE GestionTest.dbo.Employee
ALTER COLUMN Nom VARCHAR(100);

-- Suppression de la colonne Age
ALTER TABLE GestionTest.dbo.Employee
DROP COLUMN Age;
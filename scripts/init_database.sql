
/*

============================================================
Create Database and Schemas
============================================================
Scripts Purpose:
	The script create a new database named 'DataWarehouse' after checking if it already exists.
	If teh db already exists then it will drop it and create a new one.
	Additionaly, the scripts sets uu three schemas within the database: bronze silver and gold.

WARNING:
	Running this script will delete the entire database named 'Datawarehouse' if it exists.
	All data in the database will be permanently removed. Be carefull and be sure to have a 
	backup ready before running this script.
*/

-- Switch to master user
USE master;
GO
-- Drop and recreate the database named 'DaraWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
-- Create the new database 
CREATE DATABASE DataWarehouse;

USE DataWarehouse
GO
-- Create new schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO








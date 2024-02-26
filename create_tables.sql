USE ato_dev;

-- 1. Users Table
-- UserID (Primary Key, INT, Auto-Increment)
-- Username (VARCHAR)
-- Password (VARCHAR, consider storing hashed passwords for security)
-- Role (ENUM('Admin', 'User', 'Control', 'Eng'), role-based access control)
-- Status (ENUM('Active', 'Inactive'), account status)
CREATE TABLE users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL, -- Consider hashing
    Role ENUM('Admin', 'User', 'Control', 'Eng') NOT NULL,
    Status ENUM('Active', 'Inactive') NOT NULL
);

-- 2. Assets Table
-- AssetID (Primary Key, INT, Auto-Increment)
-- Name (VARCHAR)
-- Type (ENUM('Person', 'Vehicle', 'Equipment'), main category)
-- SubType (VARCHAR, specific like 'Fighter Jet', 'Transport Vehicle')
-- Attributes (TEXT, JSON, or separate table, to store customizable attributes like engine type, capacity)
CREATE TABLE assets (
    AssetID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Type ENUM('Person', 'Vehicle', 'Equipment') NOT NULL,
    SubType VARCHAR(255),
    Attributes TEXT -- Consider using JSON format for flexibility
);

-- 3. ATOs Table
-- ATO_ID (Primary Key, INT, Auto-Increment)
-- Title (VARCHAR)
-- Description (TEXT)
-- Status (ENUM('Draft', 'Submitted', 'Approved', 'Denied', 'Executed'))
-- CreationDate (DATETIME)
-- SubmitDate (DATETIME, NULLABLE)
-- ApprovalDate (DATETIME, NULLABLE)
-- ExecutionDate (DATETIME, NULLABLE)
CREATE TABLE ATOs (
    ATO_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    Status ENUM('Draft', 'Submitted', 'Approved', 'Denied', 'Active', 'Completed') NOT NULL,
    CreationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdateDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- 4. Missions Table
-- MissionID (Primary Key, INT, Auto-Increment)
-- ATO_ID (INT, Foreign Key referencing ATOs)
-- AssetID (INT, Foreign Key referencing Assets)
-- StartTime (DATETIME)
-- EndTime (DATETIME)
-- Path (TEXT, store path data, consider encoding or a reference to a path table)
-- Status (ENUM('Planned', 'In Progress', 'Completed', 'Failed'))
CREATE TABLE missions (
    MissionID INT AUTO_INCREMENT PRIMARY KEY,
    ATO_ID INT,
    AssetID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    Path TEXT, -- Consider JSON for path data
    Status ENUM('Planned', 'In Progress', 'Completed', 'Failed') NOT NULL,
    FOREIGN KEY (ATO_ID) REFERENCES ATOs(ATO_ID),
    FOREIGN KEY (AssetID) REFERENCES assets(AssetID)
);

-- 5. MissionPaths Table (Optional, for detailed path storage)
-- PathID (Primary Key, INT, Auto-Increment)
-- MissionID (INT, Foreign Key referencing Missions)
-- Coordinates (TEXT, store serialized list of coordinates or JSON)
-- Sequence (INT, order of points)
CREATE TABLE missionPaths (
    PathID INT AUTO_INCREMENT PRIMARY KEY,
    MissionID INT,
    Coordinates TEXT, -- Consider using JSON for a list of coordinates
    Sequence INT,
    FOREIGN KEY (MissionID) REFERENCES missions(MissionID)
);

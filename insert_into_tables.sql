USE ato_dev;

-- Inserting Users
INSERT INTO users (Username, Password, Role, Status) VALUES 
('admin', 'hashed_password1', 'Admin', 'Active'),
('user1', 'hashed_password2', 'User', 'Active'),
('control', 'hashed_password3', 'Control', 'Active'),
('engineer', 'hashed_password4', 'Eng', 'Active');

-- Inserting Assets
INSERT INTO assets (Name, Type, SubType, Attributes) VALUES 
('Humvee', 'Vehicle', 'Transport', '{"engine": "6.5L Diesel", "capacity": "4"}'),
('F-22 Raptor', 'Vehicle', 'Fighter Jet', '{"engine": "F119-PW-100", "speed": "Mach 2"}'),
('Combat Engineer', 'Person', NULL, '{"specialty": "Demolitions", "rank": "Sergeant"}');

-- Inserting ATOs
INSERT INTO ATOs (Title, Description, Status, UserID) VALUES 
('Operation Freedom', 'Secure the area and establish control.', 'Draft', 1),
('Urban Recon', 'Reconnaissance in urban environment.', 'Submitted', 2);

-- Assuming we already have some ATOs and Assets, let's create Missions
-- Note: Ensure ATO_ID and AssetID match existing records. Adjust as necessary.
INSERT INTO missions (ATO_ID, AssetID, StartTime, EndTime, Path, Status) VALUES 
(1, 1, '2024-02-24 08:00:00', '2024-02-24 12:00:00', '{"start": "Base", "end": "Objective Alpha"}', 'Planned'),
(2, 2, '2024-02-25 09:00:00', '2024-02-25 11:00:00', '{"start": "Airfield", "end": "Urban Area"}', 'Planned');

-- Inserting detailed paths for a mission (Optional)
-- Note: MissionID should match an existing record in the missions table. Adjust as necessary.
INSERT INTO missionPaths (MissionID, Coordinates, Sequence) VALUES 
(1, '{"lat": 34.0522, "long": -118.2437}', 1),
(1, '{"lat": 34.0522, "long": -118.2437}', 2);

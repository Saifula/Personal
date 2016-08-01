DROP SCHEMA IF EXISTS securityaccess;

CREATE SCHEMA securityaccess;

USE securityaccess;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS rooms;

CREATE TABLE users
(UserID INT NOT NULL PRIMARY KEY,
UserName VARCHAR(50),
GroupID INT);

INSERT INTO users VALUES(1,'Modesto',1);
INSERT INTO users VALUES(2,'Ayine',1);
INSERT INTO users VALUES(3,'Christopher',2);
INSERT INTO users VALUES(4,'Cheong Woo',2);
INSERT INTO users VALUES(5,'Saulat',3);
INSERT INTO users VALUES(6,'Heidy',NULL);

CREATE TABLE groups
(GroupID INT NOT NULL PRIMARY KEY,
GroupName VARCHAR(50));

INSERT INTO groups VALUES(1,'IT');
INSERT INTO groups VALUES(2,'Sales');
INSERT INTO groups VALUES(3,'Administration');
INSERT INTO groups VALUES(4,'Operations');

CREATE TABLE rooms
(RoomID INT NOT NULL PRIMARY KEY,
RoomName VARCHAR(50));

INSERT INTO rooms VALUES(1,'101');
INSERT INTO rooms VALUES(2,'102');
INSERT INTO rooms VALUES(3,'Auditorium A');
INSERT INTO rooms VALUES(4,'Auditorium B');

CREATE TABLE permissions
(PermissionID INT NOT NULL PRIMARY KEY,
GroupID INT,
RoomID INT);

INSERT INTO permissions VALUES(1,1,1);
INSERT INTO permissions VALUES(2,1,2);
INSERT INTO permissions VALUES(3,2,2);
INSERT INTO permissions VALUES(4,2,3);

SELECT groups.*, users.username
FROM groups
LEFT JOIN users ON groups.GroupID = users.GroupID;

SELECT rooms.*, Groups.GroupName
FROM rooms
LEFT JOIN permissions ON rooms.RoomID = Permissions.RoomID
LEFT JOIN groups ON Permissions.GroupID = Groups.GroupID;

SELECT Users.Username, Groups.GroupName, Rooms.RoomName
FROM users
LEFT JOIN groups ON Users.GroupID = Groups.GroupID
LEFT JOIN permissions ON Groups.GroupID = Permissions.GroupID
LEFT JOIN rooms ON Permissions.RoomID = Rooms.RoomID
ORDER BY UserName, GroupName, RoomName;
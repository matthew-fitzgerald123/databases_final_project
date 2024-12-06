CREATE USER 'AlexSmith'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'AlexSmith'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'JamieLee'@'localhost';
GRANT SELECT ON project_database.* TO 'JamieLee'@'localhost';
FLUSH PRIVILEGES;
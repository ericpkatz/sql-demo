DROP TABLE IF EXISTS things;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE things(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  user_id INTEGER REFERENCES users(id)
);

INSERT INTO users(id, name) values (1, 'lucy');
INSERT INTO users(id, name) values (2, 'moe');
INSERT INTO users(id, name) values (3, 'larry');

INSERT INTO things(id, name, user_id) values (1, 'bar', 1);
INSERT INTO things(id, name, user_id) values (2, 'bazz', 1);
INSERT INTO things(id, name, user_id) values (3, 'quq', 2);
INSERT INTO things(id, name) values (4, 'fizz');
INSERT INTO things(id, name) values (5, 'buzz');

SELECT things.name as thing_name, users.name as user_name
FROM users
RIGHT OUTER JOIN things
ON users.id = things.user_id;

SELECT users.name, count(*)
FROM users
JOIN things
ON users.id = things.user_id
GROUP BY users.name;

SELECT users.name, things.user_id 
FROM users
LEFT OUTER JOIN things
ON users.id = things.user_id
WHERE things.user_id IS NULL;

SELECT *
FROM things
WHERE user_id is NULL;


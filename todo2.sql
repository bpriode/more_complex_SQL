-- Schema from yesterday.

CREATE TABLE todos (id SERIAL PRIMARY KEY, title VARCHAR(255) NOT NULL, details TEXT  NULL, priority INTEGER NOT NULL DEFAULT 1, created_at TIMESTAMP NOT NULL, completed_at TIMESTAMP NULL);



-- Write INSERT statements to insert 20 todos into the todos table, with a combination of priorities, created times, and completed times, with not all having a completed time.
INSERT INTO todos (title, details, priority, created_at) VALUES ('vacuum', 'do not forget the blinds', 3, 'now'), ('call Jordan', 'ask about climbing', 1, 'now'), ('go to Target', 'check cartwheel deals', 4, 'now'), ('get gas', 'stop before low', 2, 'now'), ('fill water bottle', 'wash first', 2, 'now');

INSERT INTO todos (title, priority, created_at, completed_at) VALUES ('read book', 1, 'yesterday', 'now'), ('defrost meat for dinner', 2, 'yesterday', 'now'), ('wash hair', 1, 'yesterday', 'now'), ('send pics', 2, 'yesterday', 'now'), ('get insurance', 1, 'yesterday', 'now');

INSERT INTO todos (title, priority, created_at) VALUES ('facetime with Joy', 1, 'infinity'), ('charge phone', 2, 'yesterday'), ('write check', 4, 'now'), ('make beach plans', 2, 'now'), ('get hair cut', 5, 'yesterday');

INSERT INTO todos (title, priority, created_at, completed_at) VALUES ('clean shower', 6, 'August 26 04:05:06 2017', 'August 27 04:05:06 2017'), ('go home', 4, 'August 24 12:30:00 2017', 'August 27 3:00:00 2017'), ('visit Sarah', 8, 'August 11 02:30:00 2017', 'August 14 12:30:00 2017'), ('visit Sam', 3, 'July 28 04:00:00 2017', 'August 5 01:30:00 2017'), ('play halo with JB', 5, 'July 26 12:00:00 2017', 'August 17 12:00:00 2017');



-- Write a SELECT statement to find all incomplete todos with priority 3.
SELECT title, completed_at, priority FROM todos WHERE priority = 3 AND completed_at IS NULL;




-- Write a SELECT statement to find the number of incomplete todos by priority.
SELECT COUNT(id), priority
FROM todos
WHERE completed_at IS NULL
GROUP BY priority;




-- Write a SELECT statement to find the number of todos by priority created in the last 30 days.
SELECT COUNT(id), priority
FROM todos
WHERE created_at > current_date - interval '30'
GROUP BY priority;



-- Write a SELECT statement to find the next todo you should work on. This is the todo with the highest priority that was created first.
SELECT title, created_at, completed_at, priority
FROM todos
WHERE priority = 1 AND completed_at IS NULL
ORDER BY created_at DESC;

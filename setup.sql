DROP DATABASE IF EXISTS blog_db;
CREATE DATABASE blog_db;
\c blog_db

CREATE TABLE users (
  user_id    SERIAL      PRIMARY KEY,
  username   TEXT        NOT NULL UNIQUE,
  email      TEXT        NOT NULL UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE posts (
  post_id    SERIAL      PRIMARY KEY,
  title      TEXT        NOT NULL,
  body       TEXT        NOT NULL,
  user_id    INTEGER     REFERENCES users(user_id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE tags (
  tag_id SERIAL PRIMARY KEY,
  name   TEXT   NOT NULL UNIQUE
);

CREATE TABLE post_tags (
  post_tag_id SERIAL  PRIMARY KEY,
  post_id     INTEGER REFERENCES posts(post_id) ON DELETE CASCADE,
  tag_id      INTEGER REFERENCES tags(tag_id)   ON DELETE CASCADE,
  UNIQUE (post_id, tag_id)
);

INSERT INTO users (username, email, created_at) VALUES
  ('ann_k',    'ann@example.com',    '2024-01-10 09:00:00'),
  ('ben_r',    'ben@example.com',    '2024-01-15 10:30:00'),
  ('carmen_s', 'carmen@example.com', '2024-02-01 08:45:00'),
  ('darius_m', 'darius@example.com', '2024-02-14 14:00:00'),
  ('elena_p',  'elena@example.com',  '2024-03-01 11:15:00'),
  ('felix_o',  'felix@example.com',  '2024-03-20 16:00:00');

INSERT INTO posts (title, body, user_id, created_at) VALUES
  ('Getting Started with SQL',        'SQL is a language for querying relational databases.',     1, '2024-01-20 10:00:00'),
  ('Why I Love Postgres',             'Postgres is a powerful open-source database.',             1, '2024-02-05 09:00:00'),
  ('Building REST APIs with Express', 'Express makes it easy to build APIs in Node.js.',         1, '2024-03-10 14:00:00'),
  ('JOIN Queries Explained',          'A JOIN combines rows from two or more tables.',            2, '2024-02-01 11:00:00'),
  ('Database Normalization Tips',     'Normalization prevents redundant data in your schema.',    2, '2024-02-20 13:30:00'),
  ('React Hooks in Practice',         'Hooks let you use state in functional components.',        3, '2024-03-01 10:00:00'),
  ('CSS Grid vs Flexbox',             'Both are powerful layout tools in CSS.',                   3, '2024-03-15 15:30:00'),
  ('My JavaScript Journey',           'I started learning JavaScript two years ago.',             4, '2024-02-10 08:00:00'),
  ('Async/Await Deep Dive',           'Async functions return a Promise implicitly.',             4, '2024-03-05 12:00:00'),
  ('Intro to TypeScript',             'TypeScript adds static types to JavaScript.',              4, '2024-03-22 09:30:00'),
  ('Node.js Best Practices',          'Structure your project with clear separation of concerns.',1, '2024-04-01 11:00:00'),
  ('Open Source Contributions',       'Contributing to open source is deeply rewarding.',        2, '2024-04-10 16:00:00');

INSERT INTO tags (name) VALUES
  ('sql'),
  ('javascript'),
  ('backend'),
  ('frontend'),
  ('databases'),
  ('career');

INSERT INTO post_tags (post_id, tag_id) VALUES
  (1,  1),  -- Getting Started with SQL        → sql
  (1,  5),  -- Getting Started with SQL        → databases
  (1,  3),  -- Getting Started with SQL        → backend
  (2,  1),  -- Why I Love Postgres             → sql
  (2,  5),  -- Why I Love Postgres             → databases
  (3,  3),  -- Building REST APIs with Express → backend
  (3,  2),  -- Building REST APIs with Express → javascript
  (4,  1),  -- JOIN Queries Explained          → sql
  (4,  5),  -- JOIN Queries Explained          → databases
  (5,  1),  -- Database Normalization Tips     → sql
  (5,  5),  -- Database Normalization Tips     → databases
  (5,  3),  -- Database Normalization Tips     → backend
  (6,  2),  -- React Hooks in Practice         → javascript
  (6,  4),  -- React Hooks in Practice         → frontend
  (7,  4),  -- CSS Grid vs Flexbox             → frontend
  (8,  2),  -- My JavaScript Journey           → javascript
  (8,  6),  -- My JavaScript Journey           → career
  (9,  2),  -- Async/Await Deep Dive           → javascript
  (9,  3),  -- Async/Await Deep Dive           → backend
  (10, 2),  -- Intro to TypeScript             → javascript
  (10, 4),  -- Intro to TypeScript             → frontend
  (11, 3),  -- Node.js Best Practices          → backend
  (11, 2);  -- Node.js Best Practices          → javascript
  -- post 12 (Open Source Contributions) intentionally has no tags

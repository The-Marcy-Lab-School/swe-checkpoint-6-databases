# swe-checkpoint-6-databases

This checkpoint assesses your SQL skills across the full range of topics covered in Mod 6. You'll write queries against a pre-built `blog_db` database — no JavaScript involved.

- [Setup](#setup)
- [Grading](#grading)
  - [Part 1: SELECT — Basic Reads (3 pts)](#part-1-select--basic-reads-3-pts)
  - [Part 2: WHERE — Filtering Data (4 pts)](#part-2-where--filtering-data-4-pts)
  - [Part 3: INSERT, UPDATE, DELETE — Modifying Data (6 pts)](#part-3-insert-update-delete--modifying-data-6-pts)
  - [Part 4: Aggregates — COUNT, GROUP BY, HAVING (8 pts)](#part-4-aggregates--count-group-by-having-8-pts)
  - [Part 5: JOIN Queries (9 pts)](#part-5-join-queries-9-pts)
- [Schema Reference](#schema-reference)
- [Expected Output](#expected-output)

## Setup

**1. Clone this repo and navigate into it.**

**2. Make a draft branch:**

```sh
git checkout -b draft
```

**3. Run the seed file to create and populate `blog_db`:**

**Mac:**
```sh
psql -f setup.sql
```

**Windows/WSL:**
```sh
sudo -u postgres psql -f setup.sql
```

**4. Connect to the database:**

**Mac:**
```sh
psql blog_db
```

**Windows/WSL:**
```sh
sudo -u postgres psql blog_db
```

**5. Open `queries.sql`** and write your answer below each prompt. You can test queries directly in `psql`, or open the file in TablePlus and run them from there.

---

## Grading

### Part 1: SELECT — Basic Reads (3 pts)

- [ ] 1. Select all columns from all users (1 pt)
- [ ] 2. Select only the title and body from all posts (1 pt)
- [ ] 3. Select all columns from all posts, ordered by created_at newest to oldest (1 pt)

### Part 2: WHERE — Filtering Data (4 pts)

- [ ] 4. Select all posts written by user_id = 2 (2 pts)
- [ ] 5. Select all users whose username starts with the letter 'a' (2 pts)

### Part 3: INSERT, UPDATE, DELETE — Modifying Data (6 pts)

- [ ] 6. Insert a new user with username 'grace_h' and email 'grace@example.com' (2 pts)
- [ ] 7. Update the title of post_id = 7 to 'CSS Grid vs Flexbox: A Complete Guide' (2 pts)
- [ ] 8. Delete the tag with tag_id = 6 (2 pts)

### Part 4: Aggregates — COUNT, GROUP BY, HAVING (8 pts)

- [ ] 9. Count the total number of posts (1 pt)
- [ ] 10. Count posts per user; show user_id and post_count (2 pts)
- [ ] 11. Show only users who have written more than 2 posts (2 pts)
- [ ] 12. Find the average number of posts per user across ALL users, rounded to 2 decimal places (3 pts)

### Part 5: JOIN Queries (9 pts)

- [ ] 13. Show each post's title and its author's username using INNER JOIN (1 pt)
- [ ] 14. Show all users and their post count, including zero-post users, using LEFT JOIN (2 pts)
- [ ] 15. Show all tag names for the post titled 'Getting Started with SQL' (2 pts)
- [ ] 16. Show the title and author username of every post tagged 'javascript' (1 pt)
- [ ] 17. Show each tag name and how many posts use it, ordered by count descending (1 pt)
- [ ] 18. Show the title of every post that has no tags (2 pts)

---

## Schema Reference

The `blog_db` database has four tables:

```
users
  user_id    SERIAL PRIMARY KEY
  username   TEXT NOT NULL UNIQUE
  email      TEXT NOT NULL UNIQUE
  created_at TIMESTAMPTZ

posts
  post_id    SERIAL PRIMARY KEY
  title      TEXT NOT NULL
  body       TEXT NOT NULL
  user_id    INTEGER REFERENCES users(user_id)
  created_at TIMESTAMPTZ

tags
  tag_id  SERIAL PRIMARY KEY
  name    TEXT NOT NULL UNIQUE

post_tags
  post_tag_id SERIAL PRIMARY KEY
  post_id     INTEGER REFERENCES posts(post_id)
  tag_id      INTEGER REFERENCES tags(tag_id)
  UNIQUE (post_id, tag_id)
```

**Relationships:**
- `users` → `posts` is **one-to-many** (one user can write many posts; each post belongs to one user)
- `posts` ↔ `tags` is **many-to-many** via `post_tags` (a post can have many tags; a tag can be on many posts)

---

## Expected Output

Use these to check your work.

**<details><summary>1. All users (6 rows)</summary>**

| user_id | username  | email               | created_at           |
| ------- | --------- | ------------------- | -------------------- |
| 1       | ann_k     | ann@example.com     | 2024-01-10 09:00:00  |
| 2       | ben_r     | ben@example.com     | 2024-01-15 10:30:00  |
| 3       | carmen_s  | carmen@example.com  | 2024-02-01 08:45:00  |
| 4       | darius_m  | darius@example.com  | 2024-02-14 14:00:00  |
| 5       | elena_p   | elena@example.com   | 2024-03-01 11:15:00  |
| 6       | felix_o   | felix@example.com   | 2024-03-20 16:00:00  |

</details>

**<details><summary>2. Title and body from all posts (12 rows)</summary>**

| title                              | body                                                              |
| ---------------------------------- | ----------------------------------------------------------------- |
| Getting Started with SQL           | SQL is a language for querying relational databases.              |
| Why I Love Postgres                | Postgres is a powerful open-source database.                      |
| Building REST APIs with Express    | Express makes it easy to build APIs in Node.js.                   |
| JOIN Queries Explained             | A JOIN combines rows from two or more tables.                     |
| Database Normalization Tips        | Normalization prevents redundant data in your schema.             |
| React Hooks in Practice            | Hooks let you use state in functional components.                 |
| CSS Grid vs Flexbox                | Both are powerful layout tools in CSS.                            |
| My JavaScript Journey              | I started learning JavaScript two years ago.                      |
| Async/Await Deep Dive              | Async functions return a Promise implicitly.                      |
| Intro to TypeScript                | TypeScript adds static types to JavaScript.                       |
| Node.js Best Practices             | Structure your project with clear separation of concerns.         |
| Open Source Contributions          | Contributing to open source is deeply rewarding.                  |

</details>

**<details><summary>3. All posts ordered by created_at newest to oldest (12 rows)</summary>**

| post_id | title                              | created_at           |
| ------- | ---------------------------------- | -------------------- |
| 12      | Open Source Contributions          | 2024-04-10 16:00:00  |
| 11      | Node.js Best Practices             | 2024-04-01 11:00:00  |
| 10      | Intro to TypeScript                | 2024-03-22 09:30:00  |
| 7       | CSS Grid vs Flexbox                | 2024-03-15 15:30:00  |
| 3       | Building REST APIs with Express    | 2024-03-10 14:00:00  |
| 9       | Async/Await Deep Dive              | 2024-03-05 12:00:00  |
| 6       | React Hooks in Practice            | 2024-03-01 10:00:00  |
| 5       | Database Normalization Tips        | 2024-02-20 13:30:00  |
| 8       | My JavaScript Journey              | 2024-02-10 08:00:00  |
| 2       | Why I Love Postgres                | 2024-02-05 09:00:00  |
| 4       | JOIN Queries Explained             | 2024-02-01 11:00:00  |
| 1       | Getting Started with SQL           | 2024-01-20 10:00:00  |

</details>

**<details><summary>4. Posts by user_id = 2 (3 rows)</summary>**

| post_id | title                       | body                                               | user_id | created_at           |
| ------- | --------------------------- | -------------------------------------------------- | ------- | -------------------- |
| 4       | JOIN Queries Explained      | A JOIN combines rows from two or more tables.      | 2       | 2024-02-01 11:00:00  |
| 5       | Database Normalization Tips | Normalization prevents redundant data in your schema. | 2    | 2024-02-20 13:30:00  |
| 12      | Open Source Contributions   | Contributing to open source is deeply rewarding.   | 2       | 2024-04-10 16:00:00  |

</details>

**<details><summary>5. Users whose username starts with 'a' (1 row)</summary>**

| user_id | username | email           | created_at           |
| ------- | -------- | --------------- | -------------------- |
| 1       | ann_k    | ann@example.com | 2024-01-10 09:00:00  |

</details>

**<details><summary>6. After inserting 'grace_h'</summary>**

You should see: `INSERT 0 1`

Run `SELECT * FROM users;` to verify — you should see 7 rows with grace_h appearing last (user_id = 7).

</details>

**<details><summary>7. After updating post_id = 7</summary>**

You should see: `UPDATE 1`

Run `SELECT * FROM posts WHERE post_id = 7;` to verify — the title should now read `CSS Grid vs Flexbox: A Complete Guide`.

</details>

**<details><summary>8. After deleting tag_id = 6</summary>**

You should see: `DELETE 1`

Run `SELECT * FROM tags;` to verify — you should see 5 rows and the `career` tag should be gone.

</details>

**<details><summary>9. Total number of posts (1 row)</summary>**

| total_posts |
| ----------- |
| 12          |

</details>

**<details><summary>10. Post count per user (4 rows)</summary>**

Note: order may vary.

| user_id | post_count |
| ------- | ---------- |
| 1       | 4          |
| 2       | 3          |
| 3       | 2          |
| 4       | 3          |

</details>

**<details><summary>11. Users with more than 2 posts (3 rows)</summary>**

Note: order may vary.

| user_id | post_count |
| ------- | ---------- |
| 1       | 4          |
| 2       | 3          |
| 4       | 3          |

</details>

**<details><summary>12. Average posts per user across all users (1 row)</summary>**

This includes the 2 users (elena_p, felix_o) who have written zero posts.

| avg_posts_per_user |
| ------------------ |
| 2.00               |

</details>

**<details><summary>13. Post titles with author usernames — INNER JOIN (12 rows)</summary>**

Note: order may vary.

| title                              | username  |
| ---------------------------------- | --------- |
| Getting Started with SQL           | ann_k     |
| Why I Love Postgres                | ann_k     |
| Building REST APIs with Express    | ann_k     |
| Node.js Best Practices             | ann_k     |
| JOIN Queries Explained             | ben_r     |
| Database Normalization Tips        | ben_r     |
| Open Source Contributions          | ben_r     |
| React Hooks in Practice            | carmen_s  |
| CSS Grid vs Flexbox                | carmen_s  |
| My JavaScript Journey              | darius_m  |
| Async/Await Deep Dive              | darius_m  |
| Intro to TypeScript                | darius_m  |

</details>

**<details><summary>14. All users with post count — LEFT JOIN (6 rows)</summary>**

| username  | post_count |
| --------- | ---------- |
| ann_k     | 4          |
| ben_r     | 3          |
| darius_m  | 3          |
| carmen_s  | 2          |
| elena_p   | 0          |
| felix_o   | 0          |

</details>

**<details><summary>15. Tags on 'Getting Started with SQL' (3 rows)</summary>**

Note: order may vary.

| name      |
| --------- |
| sql       |
| databases |
| backend   |

</details>

**<details><summary>16. Posts tagged 'javascript' with author username (6 rows)</summary>**

Note: order may vary.

| title                              | username  |
| ---------------------------------- | --------- |
| Building REST APIs with Express    | ann_k     |
| Node.js Best Practices             | ann_k     |
| React Hooks in Practice            | carmen_s  |
| My JavaScript Journey              | darius_m  |
| Async/Await Deep Dive              | darius_m  |
| Intro to TypeScript                | darius_m  |

</details>

**<details><summary>17. Tag names with post counts (6 rows)</summary>**

Note: rows with the same count may appear in a different order — that's okay.

| name       | post_count |
| ---------- | ---------- |
| javascript | 6          |
| backend    | 5          |
| sql        | 4          |
| databases  | 4          |
| frontend   | 3          |
| career     | 1          |

</details>

**<details><summary>18. Posts with no tags (1 row)</summary>**

| title                     |
| ------------------------- |
| Open Source Contributions |

</details>

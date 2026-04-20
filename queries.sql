-- queries.sql
-- Write your SQL query below each prompt.
--
-- Setup: run the seed file first to create blog_db.
--   Mac:       psql -f setup.sql
--   Windows:   sudo -u postgres psql -f setup.sql
--
-- Then connect to the database:
--   Mac:       psql blog_db
--   Windows:   sudo -u postgres psql blog_db
--
-- You can also open this file in TablePlus and run queries from there.

-- ============================================================
-- Part 1: SELECT — Basic Reads
-- ============================================================

-- 1. Select all columns from all users.


-- 2. Select only the title and body from all posts.


-- 3. Select all columns from all posts, ordered by created_at from newest to oldest.


-- ============================================================
-- Part 2: WHERE — Filtering Data
-- ============================================================

-- 4. Select all posts written by the user with user_id = 2.


-- 5. Select all users whose username starts with the letter 'a'.


-- ============================================================
-- Part 3: Aggregates — COUNT, GROUP BY, HAVING
-- ============================================================

-- 6. Count the total number of posts in the table.
--    Name the result column total_posts.


-- 7. Count how many posts each user has written.
--    Show user_id and the count. Name the count column post_count.


-- 8. Show only the user_id values for users who have written more than 2 posts.
--    Include the post count. Name the count column post_count.


-- ============================================================
-- Part 4: JOIN Queries
-- ============================================================

-- 9. Show each post's title and the username of its author.
--    Only include posts that have a matching user (use INNER JOIN).
--    Show title and username.


-- 10. Show all users and their post count, including users who have
--     written zero posts (use LEFT JOIN).
--     Show username and post_count. Order by post_count descending.


-- 11. Show the name of every tag associated with the post titled
--     'Getting Started with SQL'.
--     Show only the tag name column.


-- 12. Show the title and author username of every post that has
--     the tag 'javascript'.
--     Show title and username.


-- 13. Show each tag name and how many posts use it.
--     Name the count column post_count.
--     Order by post_count from highest to lowest.


-- 14. Show the title of every post that has no tags.
--     Hint: use a LEFT JOIN on post_tags and filter for NULL.


-- ============================================================
-- Part 5: INSERT, UPDATE, DELETE — Modifying Data
-- ============================================================

-- 15. Insert a new user with username 'grace_h' and email 'grace@example.com'.


-- 16. Update the title of the post with post_id = 7 to
--     'CSS Grid vs Flexbox: A Complete Guide'.


-- 17. Delete the tag with tag_id = 6.

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
-- Part 3: INSERT, UPDATE, DELETE — Modifying Data
-- ============================================================

-- 6. Insert a new user with username 'grace_h' and email 'grace@example.com'.


-- 7. Update the title of the post with post_id = 7 to
--    'CSS Grid vs Flexbox: A Complete Guide'.


-- 8. Delete the tag with tag_id = 6.


-- ============================================================
-- Part 4: Aggregates — COUNT, GROUP BY, HAVING
-- ============================================================

-- 9. Count the total number of posts in the table.
--    Name the result column total_posts.


-- 10. Count how many posts each user has written.
--     Show user_id and the count. Name the count column post_count.


-- 11. Show only the user_id values for users who have written more than 2 posts.
--     Include the post count. Name the count column post_count.


-- 12. Find the average number of posts per user across ALL users
--     (including users who have written zero posts).
--     Round to 2 decimal places. Name the column avg_posts_per_user.
--
--     Hint: you will need a subquery. Wrap your GROUP BY query as a
--     derived table and call AVG() on the count column.


-- ============================================================
-- Part 5: JOIN Queries
-- ============================================================

-- 13. Show each post's title and the username of its author.
--     Only include posts that have a matching user (use INNER JOIN).
--     Show title and username.


-- 14. Show all users and their post count, including users who have
--     written zero posts (use LEFT JOIN).
--     Show username and post_count. Order by post_count descending.


-- 15. Show the name of every tag associated with the post titled
--     'Getting Started with SQL'.
--     Show only the tag name column.


-- 16. Show the title and author username of every post that has
--     the tag 'javascript'.
--     Show title and username.


-- 17. Show each tag name and how many posts use it.
--     Name the count column post_count.
--     Order by post_count from highest to lowest.


-- 18. Show the title of every post that has no tags.
--     Hint: use a LEFT JOIN on post_tags and filter for NULL.

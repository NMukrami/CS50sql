-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database


------------------------------------------ SELECT ----------------------------------------------------
-- Find all conversation detail
SELECT *
FROM "message_view"
;

-- Retrieve all messages received by a specific user:
SELECT *
FROM "message"
WHERE "receiver_id" = 2
;

-- Retrieve all messages sent by a specific user:
SELECT *
FROM "message"
WHERE "sender_id" = 2
;

-- Retrieve all participants in a conversation:
SELECT *
FROM "participant"
WHERE "conversation_id" = 1
;

---------------------------------------------------- INSERT ----------------------------------------------------
-- insert data into users table
INSERT INTO
    "users"
    ("username", "email", "password", "created")
VALUES
    ('john_doe', 'john@gmail.com', 'password_1', '2024-02-10 15:30:00'),
    ('jane_smith', 'jane@gmail.com', 'password_2', '2024-02-10 16:00:00'),
    ('mike_jackson', 'mike@gmail.com', 'password_3', '2024-02-10 16:30:00'),
    ('sarah_green', 'sarah@gmail.com', 'password_4', '2024-02-10 17:00:00'),
    ('alex_turner', 'alex@gmail.com', 'password_5', '2024-02-10 17:30:00'),
    ('emily_brown', 'emily@gmail.com', 'password_6', '2024-02-10 18:00:00'),
    ('chris_evans', 'chris@gmail.com', 'password_7', '2024-02-10 18:30:00'),
    ('lisa_adams', 'lisa@gmail.com', 'password_8', '2024-02-10 19:00:00'),
    ('ryan_garcia', 'ryan@gmail.com', 'password_9', '2024-02-10 19:30:00'),
    ('sophia_lee', 'sophia@gmail.com', 'password_10', '2024-02-10 20:00:00')
;

-- insert data into conversation table
INSERT INTO
    "conversation"
    ("created")
VALUES
    ('2024-02-10 16:00:00'),
    ('2024-02-10 17:00:00'),
    ('2024-02-10 18:00:00'),
    ('2024-02-10 19:00:00'),
    ('2024-02-10 20:00:00'),
    ('2024-02-10 21:00:00'),
    ('2024-02-10 22:00:00'),
    ('2024-02-10 23:00:00'),
    ('2024-02-11 00:00:00'),
    ('2024-02-11 01:00:00')
;

-- insert data into participant table
INSERT INTO
    "participant"
    ("user_id", "conversation_id")
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (1, 3),
    (4, 3),
    (5, 4),
    (6, 4),
    (2, 5),
    (7, 6),
    (8, 7)
;

-- insert data into message table
INSERT INTO
    "message"
    ("conversation_id", "sender_id","receiver_id", "content", "created" )
VALUES
    (1, 1, 2, 'Hello Jane, how are you?', '2024-02-10 16:15:00'),
    (1, 2, 1, 'Hi John, I am good, thank you!', '2024-02-10 16:20:00'),
    (2, 3, 4, 'Hey Sarah, did you finish the project?', '2024-02-10 17:10:00'),
    (2, 4, 3, 'Yes, I just submitted it.', '2024-02-10 17:15:00'),
    (3, 1, 3, 'Mike, do not forget about the meeting tomorrow.', '2024-02-10 18:20:00'),
    (3, 3, 1, 'Thanks for the reminder, John.', '2024-02-10 18:25:00'),
    (4, 1, 2, 'Jane, do you want to grab lunch today?', '2024-02-10 12:30:00'),
    (4, 2, 1, 'Sure, John! Where do you want to go?', '2024-02-10 12:35:00'),
    (5, 3, 4, 'Sarah, have you seen the new movie?', '2024-02-10 19:00:00'),
    (5, 4, 3, 'Not yet, Mike. Is it good?', '2024-02-10 19:05:00')
;

---------------------------------------------------- UPDATE ----------------------------------------------------
-- Update the email address of a using email
UPDATE "user"
SET "email" = 'new_email@example.com'
WHERE "id" = 1
;

-- Update the email address of a using id
UPDATE "user"
SET "email" = 'new_email@example.com'
WHERE "username" = 'john_doe'
;


---------------------------------------------------- DELETE ----------------------------------------------------

-- Delete all messages in a conversation
DELETE FROM "message"
WHERE "conversation_id" = 1
;

-- Delete a conversation with a specific ConversationID, along with all associated messages
DELETE FROM "conversation"
WHERE "id" = 1
;

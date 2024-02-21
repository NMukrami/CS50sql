-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

----------------------------------------------------  CREATE TABLE ----------------------------------------------------
-- represent users detail
CREATE TABLE "users" (
    "id" INTEGER,
    "username" TEXT NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "created" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY('id')
);

-- represent detail of conversation
CREATE TABLE "conversation" (
    "id" INTEGER,
    "created" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY('id')
);

-- represent participant that join the conversation
CREATE TABLE "participant" (
    "id" INTEGER,
    "user_id" INTEGER,
    "conversation_id" INTEGER,
    PRIMARY KEY('id'),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("conversation_id") REFERENCES "conversation"("id")
);

-- represent detail of message that been send
CREATE TABLE "message" (
    "id" INTEGER,
    "conversation_id" INTEGER,
    "sender_id" INTEGER,
    "receiver_id" INTEGER,
    "content" TEXT NOT NULL,
    "created" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY('id'),
    FOREIGN KEY ("conversation_id") REFERENCES "conversation"("id"),
    FOREIGN KEY ("sender_id") REFERENCES "users"("id")
    FOREIGN KEY ("receiver_id") REFERENCES "users"("id")
);


----------------------------------------------------  CREATE INDEX ----------------------------------------------------
-- index for users table
CREATE INDEX "users_idx" ON "users"("email","username")
;

-- index for conversation table
CREATE INDEX "conversation_idx" ON "conversation"("created")
;

-- index for participant table
CREATE INDEX "participant_idx" ON "participant"("user_id", "conversation_id")
;

-- index for message table
CREATE INDEX "message_idx" ON "message"("conversation_id", "sender_id", "receiver_id")
;

---------------------------------------------------- CREATE VIEW ----------------------------------------------------
-- view all information about message
CREATE VIEW "message_view" AS
SELECT
    m.id,
    sender_id.id As sender_id,
    sender.username AS sender,
    receiver_id.id AS receiver_id,
    receiver.username AS receiver,
    c.id AS conversation_id,
    m.content,
    m.created
FROM
    message AS m
INNER JOIN
    users AS sender_id ON m.sender_id = sender_id.id
INNER JOIN
    users AS receiver_id ON m.receiver_id = receiver_id.id
INNER JOIN
    users AS sender ON m.sender_id = sender.id
INNER JOIN
    users AS receiver ON m.receiver_id = receiver.id
INNER JOIN
    conversation c ON m.conversation_id = c.id
;

-- message inbox for user to view
CREATE VIEW "my_inbox" AS
SELECT
    "sender" AS "from",
    "receiver" AS "to",
    "content" AS "message",
    "created" AS "sent"
FROM
    "message_view"
ORDER BY
    "sent" DESC
;

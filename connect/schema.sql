CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY('id')
);

CREATE TABLE "schools_and_universities" (
    "id" INTEGER,
    "school" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL CHECK("type" IN ('elementary_school', 'middle_school', 'high_school', 'lower_school', 'upper_school', 'college', 'university')),
    "location" TEXT NOT NULL,
    "founded_year" INTEGER NOT NULL,
    PRIMARY KEY('id')
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NULL CHECK("type" IN ('education', 'technology', 'finance')),
    "location" TEXT NOT NULL,
    PRIMARY KEY('id')
);

CREATE TABLE "connections" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "schools_and_universities_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "degree" TEXT CHECK("degree" IN ("BA", "MA", "PhD")),
    PRIMARY KEY('id'),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("schools_and_universities_id") REFERENCES "schools_and_universities"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);

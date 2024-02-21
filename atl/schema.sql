CREATE TABLE "Passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Check_Ins" (
    "id" INTEGER,
    "date_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY ("id") REFERENCES "Passengers"("id")
);

CREATE TABLE "Airlines" (
    "id" INTEGER
    "airline_name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "Flights" (
    "id" INTEGER,
    "flight_no" INTEGER NOT NULL,
    "airline" INTEGER NOT NULL,
    "departure_code" TEXT NOT NULL,
    "destination_code" TEXT NOT NULL,
    "departure_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY ("id") REFERENCES "Airlines"("id")
);


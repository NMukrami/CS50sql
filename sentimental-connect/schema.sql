CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `username` VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools_and_universities` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `school` VARCHAR(50) NOT NULL UNIQUE,
    `type` ENUM(`elementary_school`, `middle_school`, `high_school`, `lower_school`, `upper_school`, `college`, `university`) NOT NULL,
    `location` VARCHAR(50) NOT NULL,
    `founded_year` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM(`education`, `technology`, `finance`) NOT NULL,
    `location` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `schools_and_universities_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `start_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `end_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `degree` ENUM('BA', 'MA', 'PhD'),
    PRIMARY KEY(`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`schools_and_universities_id`) REFERENCES `schools_and_universities`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
);

/* Yii2 Lesson - 4 Connecting to a DB and Active Records */
CREATE TABLE `users` (
    `user_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(100) NULL DEFAULT NULL,
    `password` VARCHAR(32) NULL DEFAULT NULL,
    PRIMARY KEY (`user_id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

/* Yii2 Lesson - 5 Gii Module CRUD Application */
CREATE TABLE `posts` (
    `post_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `post_title` VARCHAR(100) NOT NULL,
    `post_description` TEXT NOT NULL,
    `author_id` INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`post_id`),
    INDEX `fk001_posts_users` (`author_id`),
    CONSTRAINT `fk001_posts_users` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;
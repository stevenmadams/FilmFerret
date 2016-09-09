-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema moviedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `moviedb` ;

-- -----------------------------------------------------
-- Schema moviedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moviedb` DEFAULT CHARACTER SET utf8 ;
USE `moviedb` ;

-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `id` VARCHAR(5) NOT NULL,
  `value` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie` ;

CREATE TABLE IF NOT EXISTS `movie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `tagline` VARCHAR(400) NULL,
  `year` INT(4) NOT NULL,
  `rating` VARCHAR(5) NOT NULL,
  `runtime` INT(4) NOT NULL,
  `url` VARCHAR(150) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_movie_rating_idx` (`rating` ASC),
  CONSTRAINT `fk_movie_rating`
    FOREIGN KEY (`rating`)
    REFERENCES `rating` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie_genre` ;

CREATE TABLE IF NOT EXISTS `movie_genre` (
  `movie_id` INT NULL,
  `genre_id` INT NULL,
  INDEX `fk_movie_genre_movie_idx` (`movie_id` ASC),
  INDEX `fk_movie_genre_genre_idx` (`genre_id` ASC),
  CONSTRAINT `fk_movie_genre_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_genre_genre`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO ferret;
 DROP USER ferret;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'ferret' IDENTIFIED BY 'ferret';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'ferret';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `moviedb`;
INSERT INTO `rating` (`id`, `value`) VALUES ('G', 'General Audiences');
INSERT INTO `rating` (`id`, `value`) VALUES ('PG', 'Parental Guidance Suggested');
INSERT INTO `rating` (`id`, `value`) VALUES ('PG-13', 'PG-13 – Parents Strongly Cautioned');
INSERT INTO `rating` (`id`, `value`) VALUES ('R', 'Restricted');
INSERT INTO `rating` (`id`, `value`) VALUES ('NC-17', 'Adults Only');
INSERT INTO `rating` (`id`, `value`) VALUES ('none', 'Not Rated');

COMMIT;


-- -----------------------------------------------------
-- Data for table `movie`
-- -----------------------------------------------------
START TRANSACTION;
USE `moviedb`;
INSERT INTO `movie` (`id`, `title`, `tagline`, `year`, `rating`, `runtime`, `url`) VALUES (1, 'Super 8', 'It arrives.', 2011, 'PG-13', 112, 'http://www.movieposterdb.com/img/posters/11_03/2010/1650062/m_1650062_47ad90ac.jpg');
INSERT INTO `movie` (`id`, `title`, `tagline`, `year`, `rating`, `runtime`, `url`) VALUES (2, 'The Secret Life of Walter Mitty', 'Stop dreaming. Start living.', 2013, 'PG', 114, 'http://www.movieposterdb.com/img/posters/13_11/2013/359950/m_359950_231f5ec8.jpg');
INSERT INTO `movie` (`id`, `title`, `tagline`, `year`, `rating`, `runtime`, `url`) VALUES (3, 'Into the Wild', 'Into the heart Into the soul', 2007, 'R', 148, 'http://www.movieposterdb.com/img/posters/08_03/2007/758758/m_758758_cf9ee8b4.jpg');
INSERT INTO `movie` (`id`, `title`, `tagline`, `year`, `rating`, `runtime`, `url`) VALUES (4, 'Star Wars: The Force Awakens', 'Every generation has a story.', 2015, 'PG-13', 138, 'http://www.movieposterdb.com/img/posters/15_11/2015/2488496/m_2488496_0dedc25d.jpg');
INSERT INTO `movie` (`id`, `title`, `tagline`, `year`, `rating`, `runtime`, `url`) VALUES (5, 'The Goonies', 'The pirates map The villainous crooks The underground caverns The booby traps the skeletons The monster the lost treasure and the magic that is... THE GOONIES', 1985, 'PG', 114, 'http://www.movieposterdb.com/img/posters/05_09/1985/0089218/m_51014_0089218_1e6b1771.jpg');
INSERT INTO `movie` (`id`, `title`, `tagline`, `year`, `rating`, `runtime`, `url`) VALUES (6, 'Dam Nation', 'Damn Dams!', 2014, 'none', 87, 'http://www.movieposterdb.com/img/posters/14_06/2014/3345206/m_3345206_c06ed4eb.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `moviedb`;
INSERT INTO `genre` (`id`, `value`) VALUES (1, 'Action');
INSERT INTO `genre` (`id`, `value`) VALUES (2, 'Adventure');
INSERT INTO `genre` (`id`, `value`) VALUES (3, 'Animated');
INSERT INTO `genre` (`id`, `value`) VALUES (4, 'Comedy');
INSERT INTO `genre` (`id`, `value`) VALUES (5, 'Crime');
INSERT INTO `genre` (`id`, `value`) VALUES (6, 'Documentary');
INSERT INTO `genre` (`id`, `value`) VALUES (7, 'Drama');
INSERT INTO `genre` (`id`, `value`) VALUES (8, 'Fantasy');
INSERT INTO `genre` (`id`, `value`) VALUES (9, 'History');
INSERT INTO `genre` (`id`, `value`) VALUES (10, 'Horror');
INSERT INTO `genre` (`id`, `value`) VALUES (11, 'Mystery');
INSERT INTO `genre` (`id`, `value`) VALUES (12, 'Romance');
INSERT INTO `genre` (`id`, `value`) VALUES (13, 'Sci-Fi');
INSERT INTO `genre` (`id`, `value`) VALUES (14, 'Thriller');
INSERT INTO `genre` (`id`, `value`) VALUES (15, 'Western');
INSERT INTO `genre` (`id`, `value`) VALUES (16, 'Biography');
INSERT INTO `genre` (`id`, `value`) VALUES (17, 'Family');

COMMIT;


-- -----------------------------------------------------
-- Data for table `movie_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `moviedb`;
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (1, 11);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (1, 13);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (1, 14);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (2, 2);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (2, 4);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (2, 7);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (3, 3);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (3, 16);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (3, 7);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (4, 1);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (4, 2);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (4, 8);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (5, 2);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (5, 4);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (5, 17);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (6, 6);
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES (6, 2);

COMMIT;


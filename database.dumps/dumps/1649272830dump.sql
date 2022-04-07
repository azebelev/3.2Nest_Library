/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_eded40b8c673a19de632a15b26` (`author`)
) ENGINE = InnoDB AUTO_INCREMENT = 47 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `year` int NOT NULL,
  `size` int NOT NULL,
  `descr` varchar(255) NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `visits` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 30 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books_authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `book_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_738bc3574491eddb6cdd06896c6` (`author_id`),
  KEY `FK_bf3c609a7c91bc032b805bbe14d` (`book_id`),
  CONSTRAINT `FK_738bc3574491eddb6cdd06896c6` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_bf3c609a7c91bc032b805bbe14d` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 50 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `login` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: authors
# ------------------------------------------------------------

INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (29, 'Александр Сераков');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (34, 'Александр Уолт');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (1, 'Андрей Богуславский');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (24, 'Белов А. В');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (9, 'Брюс Эккель');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (14, 'Гери Маклин Холл');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (13, 'Девид Флэнаган');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (39, 'Джей Макгаврен');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (15, 'Джеймс Р. Грофф');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (23, 'Джереми Блумм');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (4, 'Джон Форман');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (40, 'Дрю Нейл');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (30, 'Инара Агапова');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (19, 'Лора Томсон');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (18, 'Люк Веллинг ');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (3, 'Марк Саммерфильд');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (38, 'Мартин Фауэр');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (20, 'Мастицкий С.Э');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (6, 'Мухамед Али');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (28, 'Н. Марканд');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (36, 'О. Рейлли');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (32, 'Пол Дейтел');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (16, 'Пол Ен. Вайберг');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (37, 'Прамадкумар Дж. Садаладж');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (35, 'Роберт мартин');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (12, 'Роналд Риверст, Клиффорд Штайн');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (26, 'С.Гринберг');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (25, 'Сэмюэл Грингард');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (31, 'Тим Кедлек');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (10, 'Томас Кормен');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (7, 'Уес Маккини');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (22, 'Уолт  Дриджес');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (5, 'Флойд Майвезер');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (33, 'Харви Дайтел');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (11, 'Чарльз Лейзерсон');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (27, 'Ш. Карпиндейл');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (21, 'Шитиков В.К');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (17, 'Эндрю Джо.Оппель');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books
# ------------------------------------------------------------

INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    1,
    'С++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    '/images/22.jpg',
    2005,
    1000,
    'описание СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    0,
    37,
    14
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    3,
    'Программирование на языке Go',
    '/images/23.jpg',
    2014,
    567,
    'практическое пособие по внедрению микросервисов на языке Go ',
    0,
    3,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    4,
    'Толковый словарь сетевых терминов и аббревиатур',
    '/images/25.jpg',
    2004,
    678,
    'список и описание наиболее часто используемых сетевых терминов и аббревиатур',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    5,
    'Python и анализ данных',
    '/images/26.jpg',
    2019,
    457,
    'Применение Python в Big Data анализе',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    6,
    'Философия JAVA',
    '/images/27.jpg',
    2009,
    1589,
    'классика computer science',
    0,
    2,
    2
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    7,
    'Алгоритмы построение и анализ',
    '/images/29.jpg',
    2020,
    289,
    'Описание и применение наиболее используемых алгоритмов',
    0,
    2,
    3
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    8,
    'JAVASCRIPT карманный справочник',
    '/images/31.jpg',
    2004,
    543,
    'Наглядное пособие как делать веб страницы интерактивными',
    0,
    2,
    3
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    9,
    'Адаптивный код на С#',
    '/images/32.jpg',
    2015,
    678,
    'Проектирование классов и интерфейсов, шаблоны и принципы SOLID',
    0,
    2,
    9
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    10,
    'SQL полное руководство третье издание',
    '/images/33.jpg',
    2014,
    1589,
    'собрание всех правил и методов SQL',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    11,
    'Разработка веб-приложений с помощью PHP и MySQL',
    '/images/34.jpg',
    2008,
    765,
    'Библиотека разработчика PHP и MySQL',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    12,
    'Статистический анализ и визуализация данных с помощью R',
    '/images/35.jpg',
    2004,
    678,
    'Современны учебник по языку программирования R',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    13,
    'Программирование для детей',
    '/images/36.jpg',
    2014,
    169,
    'Иллюстрационное руководство по языкам stratch и Python',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    14,
    'Изучаем ARDUINO',
    '/images/37.jpg',
    2010,
    549,
    'Инструменты и методы технического волшебства',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    15,
    'Программирование микроконтроллеров',
    '/images/38.jpg',
    2014,
    876,
    'Программирование микроконтроллеров от а до я',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    16,
    'Интернет вещей',
    '/images/39.jpg',
    2014,
    289,
    'Будущее уже здесь',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    17,
    'Ux дизайн',
    '/images/40.jpg',
    2019,
    567,
    'Идея - эскиз - воплощение',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    18,
    'InDesign CS6',
    '/images/41.jpg',
    2019,
    345,
    'Путь к мастерству',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    19,
    'Адаптивный дизйн',
    '/images/42.jpg',
    2019,
    789,
    'делаем сайты для любых устройств',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    20,
    'Android для разработчиков',
    '/images/43.jpg',
    2014,
    289,
    'android studio\r\nматериальный дизайн\r\nновая модель разрешений\r\n',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    21,
    'Чистый код',
    '/images/44.jpg',
    2019,
    678,
    'Создание анализ и рефакторинг',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    22,
    'Swift карманный',
    '/images/45.jpg',
    2017,
    577,
    'Язык программирования для ios и mac os x',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    23,
    'NO SQL',
    '/images/46.jpg',
    2020,
    567,
    'Новая методология разработки не реляционных баз данных',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    24,
    'Head First изучаем Ruby',
    '/images/47.jpg',
    2004,
    567,
    'изучаем Ruby',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    25,
    'Практическое использование Vim',
    '/images/48.jpg',
    2004,
    289,
    'Редактируйте текст со скоростью мысли',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    26,
    'Программирование для детей и не только',
    '/images/36.jpg',
    2014,
    289,
    'фвыафыаывсысыфсфмфс',
    0,
    2,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    27,
    'Программирование  Go',
    '/images/23.jpg',
    2004,
    678,
    'фывывфыв',
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    28,
    'словарь  терминов ',
    '/images/33.jpg',
    2014,
    289,
    '',
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `deleted`,
    `clicks`,
    `visits`
  )
VALUES
  (
    29,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    '/images/27.jpg',
    2014,
    289,
    '',
    0,
    0,
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (1, 1, 1);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (3, 3, 3);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (4, 4, 4);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (5, 6, 4);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (6, 5, 4);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (7, 7, 5);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (8, 5, 5);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (9, 9, 6);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (10, 12, 7);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (11, 10, 7);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (12, 11, 7);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (13, 13, 8);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (14, 14, 9);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (15, 15, 10);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (16, 16, 10);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (17, 17, 10);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (18, 19, 11);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (19, 18, 11);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (20, 20, 12);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (21, 21, 12);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (22, 22, 13);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (23, 23, 14);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (24, 24, 15);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (25, 25, 16);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (26, 28, 17);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (27, 26, 17);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (28, 27, 17);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (29, 29, 18);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (30, 30, 18);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (31, 31, 19);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (32, 34, 20);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (33, 32, 20);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (34, 33, 20);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (35, 35, 21);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (36, 36, 22);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (37, 38, 23);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (38, 37, 23);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (39, 39, 24);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (40, 40, 25);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (41, 9, 26);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (42, 19, 26);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (43, 28, 26);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (44, 7, 27);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (45, 27, 27);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (46, 12, 27);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (47, 19, 28);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (48, 9, 28);
INSERT INTO
  `books_authors` (`id`, `author_id`, `book_id`)
VALUES
  (49, 1, 29);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (`login`, `passwordHash`)
VALUES
  (
    'admin',
    '$2a$10$unmH.uENq2fNyGtbLqlpTuNXrqHDx.J0/h8ET28gqEnAsuLqeuNk6'
  );
INSERT INTO
  `users` (`login`, `passwordHash`)
VALUES
  (
    'AZEBELEV',
    '$2a$10$fTT5aWlpjwyTFw/VEKWXHuz55c7nESuZiLXQArDMSfgVNAUv8lfiG'
  );
INSERT INTO
  `users` (`login`, `passwordHash`)
VALUES
  (
    'olesia',
    '$2a$10$16zae3pcB7KBxH//CSPV4ufH4zK0s5rzxncBAvKAIT/HOJfAxU1zG'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

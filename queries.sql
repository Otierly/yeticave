/*Добавление в таблицу `category`*/
INSERT INTO `category` (`name_category`) VALUES ('Доски и лыжи'), ('Крепления'), ('Ботинки'), ('Одежда'), ('Инструменты'), ('Разное');

/*Добавление данных в таблицу `category` для доп поля, для работы с классом promo_list */
UPDATE `category` SET `eng_name` = 'boards' WHERE `category`.`id_category` = 1;
UPDATE `category` SET `eng_name` = 'attachment' WHERE `category`.`id_category` = 2;
UPDATE `category` SET `eng_name` = 'boots' WHERE `category`.`id_category` = 3;
UPDATE `category` SET `eng_name` = 'clothing' WHERE `category`.`id_category` = 4;
UPDATE `category` SET `eng_name` = 'tools' WHERE `category`.`id_category` = 5;
UPDATE `category` SET `eng_name` = 'other' WHERE `category`.`id_category` = 6;

/*Добавление в таблицу `user`*/
INSERT INTO `users` (`registration_date`, `email`, `login`, `password`, `avatar`, `contacts`) VALUES ('2022-05-15', 'bob@gmail.com', 'Bobik', 'O12345', 'avatar.jpg', '88005553535'),
                                                                                           ('2022-05-16', 'john@gmail.com', 'JJJohn', 'J12345', 'avatar.jpg', '88005553536');
/*Добавление в таблицу `lot`*/
INSERT INTO `lots` (`creation_date`, `name`, `description`, `img`, `start_price`, `end_date`, `price_step`, `id_author`, `id_winner`, `id_category`) VALUES ('2022-05-16', '2014 Rossignol District Snowboard', 'Lorem ispum', 'img/lot-1.jpg', '10999', '2022-05-17', '1', '1', '2', '1'),
                                                                                                                                                        ('2022-05-16', 'DC Ply Mens 2016/2017 Snowboard', 'Lorem ispum', 'img/lot-2.jpg', '159999', '2022-05-17', '1', '1', '2', '1'),
                                                                                                                                                        ('2022-05-16', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Lorem ispum', 'img/lot-3.jpg', '8000', '2022-05-17', '1', '1', '2', '2'),
                                                                                                                                                        ('2022-05-16', 'Ботинки для сноуборда DC Mutiny Charocal', 'Lorem ispum', 'img/lot-4.jpg', '10999', '2022-05-17', '1', '1', '2', '3'),
                                                                                                                                                        ('2022-05-16', 'Куртка для сноуборда DC Mutiny Charocal', 'Lorem ispum', 'img/lot-5.jpg', '7500', '2022-05-17', '1', '1', '2', '4'),
                                                                                                                                                        ('2022-05-16', 'Маска Oakley Canopy', 'Lorem ispum', 'img/lot-6.jpg', '5400', '2022-05-17', '1', '1', '2', '6');
/*Добавление в таблицу `bid`*/
INSERT INTO `bids` (`date`, `summ`, `id_user`, `id_lot`) VALUES ('2022-05-16', '12222','1','5'),
                                                                      ('2022-05-16', '132434','2','2'),
                                                                      ('2022-05-16', '5999','1','6'),
                                                                      ('2022-05-16', '14001','2','4'),
                                                                      ('2022-05-16', '22556','1','3'),
                                                                      ('2022-05-16', '14000','2','1');

/*Выборка из таблицы `category`*/
SELECT * FROM `category`;

/*Выборка из таблицы `user`*/
SELECT * FROM `users`;

/*Выборка из таблицы `lot`*/
SELECT * FROM `lots`;

/*Выборка из таблицы `bid`*/
SELECT * FROM `bids`;

/* получить все категории*/
SELECT `name_category` FROM `category`;


/*получить самые новые, открытые лоты. Каждый лот должен включать
название, стартовую цену, ссылку на изображение, цену последней ставки,
количество ставок, название категории;*/
SELECT a.name,
       start_price,
       'img',
       (b.summ+a.start_price)Последняя_ставка,
       count(b.summ)Количество_ставок,
       c.name_category,
       end_date
from lots as a
       left join bids as b
                 on a.id_lots = b.id_lot
       inner join category c on a.id_category = c.id_category
group by a.name, start_price, img,c.name_category, id_winner,end_date, creation_date,b.summ
having end_date > '2022-05-16';



/* показать лот по его id. Получите также название категории, к которой
принадлежит лот*/
SELECT `id_lots`,`name_category` FROM lots INNER JOIN category ON `lots`.`id_category` = `category`.`id_category` WHERE `id_lots` = 1;


/* обновить название лота по его идентификатору*/
UPDATE `lots` SET `name`= 'abcd' WHERE `id_lots` = 1;

/* получить список самых свежих ставок для лота по его идентификатору*/
SELECT `id_bid` FROM `bids` INNER JOIN `lots` ON `bids`.`id_lot` = `lots`.`id_lots` WHERE `date` = '2022-05-16';

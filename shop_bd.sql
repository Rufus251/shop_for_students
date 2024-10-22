-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 22 2024 г., 04:30
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop_bd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `busket`
--

CREATE TABLE `busket` (
  `id` int NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `busket`
--

INSERT INTO `busket` (`id`, `userId`) VALUES
(1, 1),
(2, 2),
(3, 7),
(4, 8),
(5, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `busketToCloth`
--

CREATE TABLE `busketToCloth` (
  `id` int NOT NULL,
  `busketId` int NOT NULL,
  `clothId` int NOT NULL,
  `count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `busketToCloth`
--

INSERT INTO `busketToCloth` (`id`, `busketId`, `clothId`, `count`) VALUES
(1, 1, 2, 1),
(20, 2, 3, 1),
(24, 1, 1, 1),
(37, 5, 1, 1),
(39, 5, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `cloth`
--

CREATE TABLE `cloth` (
  `id` int NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` int NOT NULL,
  `imgSrc` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'static/default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cloth`
--

INSERT INTO `cloth` (`id`, `type`, `size`, `color`, `brand`, `header`, `description`, `cost`, `imgSrc`) VALUES
(1, 'Футболка', 's', 'white', 'zara', 'Футболка Zara белый цвет, оригинал мамой клянусь', 'Описание футболки Zara белый цвет, оригинал мамой клянусь', 10000, 'static/default.jpg'),
(2, 'Футболка', 'l', 'red', 'gucci', 'Футболка gucci красный цвет, оригинал мамой клянусь', 'Описание Футболки gucci красный цвет, оригинал мамой клянусь', 50000, 'static/default.jpg'),
(3, 'Штаны', 's', 'white', 'zara', 'Штаны Zara белый цвет, оригинал мамой клянусь', 'Описание Штанов Zara белый цвет, оригинал мамой клянусь', 5000, 'static/default.jpg'),
(6, '123', '123', '123', '123', '123', '123', 123, 'static/cat-buisnessman.png');

-- --------------------------------------------------------

--
-- Структура таблицы `favorite`
--

CREATE TABLE `favorite` (
  `id` int NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `favorite`
--

INSERT INTO `favorite` (`id`, `userId`) VALUES
(1, 1),
(2, 2),
(3, 7),
(4, 8),
(5, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `favoriteToCloth`
--

CREATE TABLE `favoriteToCloth` (
  `id` int NOT NULL,
  `favoriteId` int NOT NULL,
  `clothId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `favoriteToCloth`
--

INSERT INTO `favoriteToCloth` (`id`, `favoriteId`, `clothId`) VALUES
(1, 1, 3),
(2, 1, 1),
(3, 2, 3),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `adress` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payOffline` tinyint(1) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `userId`, `adress`, `payOffline`, `completed`) VALUES
(22, 9, 'asdfasdf', 1, 1),
(23, 9, '', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ordersToCloth`
--

CREATE TABLE `ordersToCloth` (
  `id` int NOT NULL,
  `orderId` int NOT NULL,
  `clothId` int NOT NULL,
  `count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ordersToCloth`
--

INSERT INTO `ordersToCloth` (`id`, `orderId`, `clothId`, `count`) VALUES
(27, 22, 1, 10),
(28, 22, 3, 14),
(29, 23, 1, 1),
(30, 23, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `name`, `role`, `phone`, `email`) VALUES
(7, 'asdfasdf', 'a95c530a7af5f492a74499e70578d150', 'asdfasdfasdf', 'admin', 'asdfasdfasdf', 'asdfasdfasdf'),
(8, '123', '202cb962ac59075b964b07152d234b70', '123', 'user', '123', '123'),
(9, 'qwerty', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'qwerty', 'admin', 'qwerty', 'qwerty');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `busket`
--
ALTER TABLE `busket`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `busketToCloth`
--
ALTER TABLE `busketToCloth`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cloth`
--
ALTER TABLE `cloth`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `favoriteToCloth`
--
ALTER TABLE `favoriteToCloth`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ordersToCloth`
--
ALTER TABLE `ordersToCloth`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `busket`
--
ALTER TABLE `busket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `busketToCloth`
--
ALTER TABLE `busketToCloth`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `cloth`
--
ALTER TABLE `cloth`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `favoriteToCloth`
--
ALTER TABLE `favoriteToCloth`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `ordersToCloth`
--
ALTER TABLE `ordersToCloth`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

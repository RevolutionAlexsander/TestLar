-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 05 2019 г., 11:36
-- Версия сервера: 5.6.37
-- Версия PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tlaravel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Role`
--

CREATE TABLE `Role` (
  `ID_Role` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Role`
--

INSERT INTO `Role` (`ID_Role`, `Name`) VALUES
(1, 'Менеджер'),
(2, 'Клиент');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Role_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `Role_ID`) VALUES
(1, 'Александр Кубарь', 'pvttys@mail.ru', '$2y$10$SwVAh77MxoxR424I.QV4ZOZlGpf9FZjX761rWGrLP8dLgMnIWgml2', 'ZuY9geSzlVR3iyJbKm7dvdct2hmB41sr7Mgz2ji4TJwCwczGvS4VZev21yH8', '2019-07-01 10:33:03', '2019-07-01 10:33:03', 1),
(2, '123', 'qwe@mail.ru', '$2y$10$y10TWcieQ/a4CzLB.Dwpg.v2ZcznlWpBziW5Z7R2/tJ3Hp1J2FX8.', '1g7YMvGMBIToNoEv03Gsrm0CbrD5FKU86I375Du7DxYcwqMBSyWSMuEnx9Lj', '2019-07-01 11:58:29', '2019-07-01 11:58:29', 2),
(3, 'cbv', 'cfyz291298@gmail.com', '$2y$10$fiYV8H1HPnFshgU4CbTUcuVbP1ZB4HqHRwTPalGlSmMMXKXHa8H/K', 'yQ9M5QWIgxMbxOzUd9r46mL1iQVf8xD3cnPZBByrnkCbYZmKRkMmb5FkSpEU', '2019-07-03 13:17:46', '2019-07-03 13:17:46', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Zayavka`
--

CREATE TABLE `Zayavka` (
  `ID_Zayavka` int(11) NOT NULL,
  `Tema` varchar(100) NOT NULL,
  `Soobshenie` varchar(500) NOT NULL,
  `users_ID` int(11) NOT NULL,
  `Ssilka` varchar(500) DEFAULT NULL,
  `DataVr` datetime NOT NULL,
  `Pr` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Zayavka`
--

INSERT INTO `Zayavka` (`ID_Zayavka`, `Tema`, `Soobshenie`, `users_ID`, `Ssilka`, `DataVr`, `Pr`) VALUES
(1, '123', 'qwe', 2, 'D:\\OSPanel\\userdata\\temp\\phpA60A.tmp', '2019-07-02 11:53:02', 1),
(4, 'jhk', 'bjn', 2, NULL, '2019-07-03 13:26:43', 0),
(7, 'hjjk', 'jnkm', 3, 'D:\\OSPanel\\userdata\\temp\\phpA5FA.tmp', '2019-07-01 20:02:23', 0),
(8, 'bjnk', 'gjh', 3, NULL, '2019-07-02 20:05:27', 1),
(10, 'tyui', 'bnm,m', 3, 'D:\\OSPanel\\domains\\tlaravel\\public\\img/f090adf8db66a6fa35da4691536e0968.jpg', '2019-07-04 13:13:29', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`ID_Role`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Role_ID` (`Role_ID`);

--
-- Индексы таблицы `Zayavka`
--
ALTER TABLE `Zayavka`
  ADD PRIMARY KEY (`ID_Zayavka`),
  ADD KEY `users_ID` (`users_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Role`
--
ALTER TABLE `Role`
  MODIFY `ID_Role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `Zayavka`
--
ALTER TABLE `Zayavka`
  MODIFY `ID_Zayavka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `Role` (`ID_Role`);

--
-- Ограничения внешнего ключа таблицы `Zayavka`
--
ALTER TABLE `Zayavka`
  ADD CONSTRAINT `zayavka_ibfk_1` FOREIGN KEY (`users_ID`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

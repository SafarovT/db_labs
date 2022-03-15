SELECT * FROM [Client]

SELECT * FROM [Order]

-- 3.1 INSERT
-- a. Без указания списка полей
	INSERT INTO [Client] VALUES ('Тахир', '+798736409');
-- b. С указанием списка полей
	INSERT INTO [Client] (name, phone_number) VALUES ('Богдан', '+798734352');
-- c. С чтением значения из другой таблицы
	INSERT INTO [Order] ([id_client], [date]) SELECT [id_client], '12:35:29' FROM [Client];

-- 3.2. DELETE
-- a. Всех записей
	DELETE FROM [Order];
	DELETE FROM [Client];
-- b. По условию
	DELETE FROM [Client] WHERE name = 'Богдан';

-- 3.3. UPDATE
-- a. Всех записей
	UPDATE [Client] SET name = 'Максим';
-- b. По условию обновляя один атрибут
	UPDATE [Client] SET phone_number = '+9999999' WHERE name = 'Тахир';
-- c. По условию обновляя несколько атрибутов
	UPDATE [Client] SET name = 'Александр', phone_number = '+0000000' WHERE name = 'Богдан';
-- 3.4. SELECT
-- a. С набором извлекаемых атрибутов
	SELECT [id_client] FROM [Client];
-- b. Со всеми атрибутами
	SELECT * FROM [Client];
-- c. С условием по атрибуту
	SELECT * FROM [Client] WHERE name = 'Тахир';

-- 3.5. SELECT ORDER BY + TOP (LIMIT)
-- a. С сортировкой по возрастанию ASC + ограничение вывода количества записей
	SELECT TOP(3) * FROM [Client] ORDER BY name;
-- b. С сортировкой по убыванию DESC
	SELECT * FROM [Client] ORDER BY name DESC;
-- c. С сортировкой по двум атрибутам + ограничение вывода количества записей
	SELECT TOP(10) * FROM [Client] ORDER BY name, phone_number;
-- d. С сортировкой по первому атрибуту, из списка извлекаемых
	SELECT id_client, name FROM [Client] ORDER BY 2;

UPDATE TOP(5) [Order] SET date = '3000-02-02 23:00:01';
UPDATE TOP(3) [Order] SET date = '2022-02-02 23:59:00';

-- 3.6. Работа с датами
-- a. WHERE по дате
	SELECT * FROM [Order] WHERE date = '12:35:29';
-- b. WHERE дата в диапазоне
	SELECT * FROM [Order] WHERE date = '12:35:29';
-- c. Извлечь из таблицы не всю дату, а только год. Например, год рождения автора.
	SELECT YEAR(date) FROM [Order];

-- 3.7. Функции агрегации
-- a. Посчитать количество записей в таблице	
	SELECT COUNT(*) FROM [Client];
-- b. Посчитать количество уникальных записей в таблице
	SELECT COUNT(DISTINCT([name])) FROM [Client];
-- c. Вывести уникальные значения столбца
	SELECT DISTINCT [phone_number] FROM  [Client];
-- d. Найти максимальное значение столбца
	SELECT MAX(DISTINCT [phone_number]) FROM  [Client];
-- e. Найти минимальное значение столбца
	SELECT MIN(DISTINCT [phone_number]) FROM  [Client];
-- f. Написать запрос COUNT() + GROUP BY
	SELECT YEAR(date), count([id_client]) AS [amount_of_clients] FROM [Order] GROUP BY YEAR(date);

-- 3.8. SELECT GROUP BY + HAVING
-- a. Написать 3 разных запроса с использованием GROUP BY + HAVING. Для
-- каждого запроса написать комментарий с пояснением, какую информацию
-- извлекает запрос. Запрос должен быть осмысленным, т.е. находить информацию,
-- которую можно использовать.	SELECT YEAR(date), count([id_client]) AS [amount_of_clients] FROM [Order] GROUP BY YEAR(date) HAVING count([id_client]) > 10 ORDER BY YEAR(date); -- вывести кол-во лет, где было больше 10 посетителей
	


-- 3.9. SELECT JOIN
-- a. LEFT JOIN двух таблиц и WHERE по одному из атрибутов
-- b. RIGHT JOIN. Получить такую же выборку, как и в 3.9 a
-- c. LEFT JOIN трех таблиц + WHERE по атрибуту из каждой таблицы
-- d. INNER JOIN двух таблиц-- 3.10. Подзапросы
-- a. Написать запрос с условием WHERE IN (подзапрос)
-- b. Написать запрос SELECT atr1, atr2, (подзапрос) FROM ...
-- c. Написать запрос вида SELECT * FROM (подзапрос)
-- d. Написать запрос вида SELECT * FROM table JOIN (подзапрос) ON …
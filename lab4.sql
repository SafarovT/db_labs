SELECT * FROM [Client]

SELECT * FROM [Order]

-- 3.1 INSERT
-- a. ��� �������� ������ �����
	INSERT INTO [Client] VALUES ('�����', '+798736409');
-- b. � ��������� ������ �����
	INSERT INTO [Client] (name, phone_number) VALUES ('������', '+798734352');
-- c. � ������� �������� �� ������ �������
	INSERT INTO [Order] ([id_client], [date]) SELECT [id_client], '12:35:29' FROM [Client];

-- 3.2. DELETE
-- a. ���� �������
	DELETE FROM [Order];
	DELETE FROM [Client];
-- b. �� �������
	DELETE FROM [Client] WHERE name = '������';

-- 3.3. UPDATE
-- a. ���� �������
	UPDATE [Client] SET name = '������';
-- b. �� ������� �������� ���� �������
	UPDATE [Client] SET phone_number = '+9999999' WHERE name = '�����';
-- c. �� ������� �������� ��������� ���������
	UPDATE [Client] SET name = '���������', phone_number = '+0000000' WHERE name = '������';
-- 3.4. SELECT
-- a. � ������� ����������� ���������
	SELECT [id_client] FROM [Client];
-- b. �� ����� ����������
	SELECT * FROM [Client];
-- c. � �������� �� ��������
	SELECT * FROM [Client] WHERE name = '�����';

-- 3.5. SELECT ORDER BY + TOP (LIMIT)
-- a. � ����������� �� ����������� ASC + ����������� ������ ���������� �������
	SELECT TOP(3) * FROM [Client] ORDER BY name;
-- b. � ����������� �� �������� DESC
	SELECT * FROM [Client] ORDER BY name DESC;
-- c. � ����������� �� ���� ��������� + ����������� ������ ���������� �������
	SELECT TOP(10) * FROM [Client] ORDER BY name, phone_number;
-- d. � ����������� �� ������� ��������, �� ������ �����������
	SELECT id_client, name FROM [Client] ORDER BY 2;

UPDATE TOP(5) [Order] SET date = '3000-02-02 23:00:01';
UPDATE TOP(3) [Order] SET date = '2022-02-02 23:59:00';

-- 3.6. ������ � ������
-- a. WHERE �� ����
	SELECT * FROM [Order] WHERE date = '12:35:29';
-- b. WHERE ���� � ���������
	SELECT * FROM [Order] WHERE date = '12:35:29';
-- c. ������� �� ������� �� ��� ����, � ������ ���. ��������, ��� �������� ������.
	SELECT YEAR(date) FROM [Order];

-- 3.7. ������� ���������
-- a. ��������� ���������� ������� � �������	
	SELECT COUNT(*) FROM [Client];
-- b. ��������� ���������� ���������� ������� � �������
	SELECT COUNT(DISTINCT([name])) FROM [Client];
-- c. ������� ���������� �������� �������
	SELECT DISTINCT [phone_number] FROM  [Client];
-- d. ����� ������������ �������� �������
	SELECT MAX(DISTINCT [phone_number]) FROM  [Client];
-- e. ����� ����������� �������� �������
	SELECT MIN(DISTINCT [phone_number]) FROM  [Client];
-- f. �������� ������ COUNT() + GROUP BY
	SELECT YEAR(date), count([id_client]) AS [amount_of_clients] FROM [Order] GROUP BY YEAR(date);

-- 3.8. SELECT GROUP BY + HAVING
-- a. �������� 3 ������ ������� � �������������� GROUP BY + HAVING. ���
-- ������� ������� �������� ����������� � ����������, ����� ����������
-- ��������� ������. ������ ������ ���� �����������, �.�. �������� ����������,
-- ������� ����� ������������.	SELECT YEAR(date), count([id_client]) AS [amount_of_clients] FROM [Order] GROUP BY YEAR(date) HAVING count([id_client]) > 10 ORDER BY YEAR(date); -- ������� ���-�� ���, ��� ���� ������ 10 �����������
	


-- 3.9. SELECT JOIN
-- a. LEFT JOIN ���� ������ � WHERE �� ������ �� ���������
-- b. RIGHT JOIN. �������� ����� �� �������, ��� � � 3.9 a
-- c. LEFT JOIN ���� ������ + WHERE �� �������� �� ������ �������
-- d. INNER JOIN ���� ������-- 3.10. ����������
-- a. �������� ������ � �������� WHERE IN (���������)
-- b. �������� ������ SELECT atr1, atr2, (���������) FROM ...
-- c. �������� ������ ���� SELECT * FROM (���������)
-- d. �������� ������ ���� SELECT * FROM table JOIN (���������) ON �
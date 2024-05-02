-- Создание ролей
CREATE ROLE Editor;
CREATE ROLE User;
-- Назначение прав ролям
GRANT SELECT, INSERT, UPDATE, DELETE ON Characters TO Editor;
GRANT SELECT ON Characters TO User;
-- Типовые запросы
-- 1.Получение списка персонажей чья редкость равна 5 звёзд
SELECT * FROM Characters WHERE Rarity_idRarity = 1;
-- 2. Получение информации о персонаже по его имени
SELECT * FROM Characters WHERE CharName = 'Navia';
-- 3. Подсчет количества персонажей определенного элемента
SELECT Elemental, COUNT(*) AS Count FROM Characters GROUP BY Elemental;
-- 4. Удаление персонажа
DELETE FROM Characters WHERE CharName = 'Klee';
-- 5. Обновление описания персонажа
UPDATE Characters SET Description = 'Ху Тао — противоречивая и местами заносчивая хозяйка ритуального бюро. Ее маркетинговая компания многим покажется странной, но несмотря на ее эксцентризм этот персонаж многое знает о мире духов.' WHERE idNameC = 1;
-- Транзакция
START TRANSACTION;
UPDATE Characters SET Rarity_idRarity = 3 WHERE CharName = 'Klee';
INSERT INTO Characters (CharName, CharSize, UseWeapon, Elemental, Region_idRegion, Rarity_idRarity, Description) 
VALUES ('Xiao', 'Medium Male', 'Polearm',  'Anemo', '2','1', 'He is an adeptus, under the name Alatus, and the sole surviving member of the five foremost Yakshas dispatched by Morax to subdue the demonic spirits that plagued Liyue.');
COMMIT;
-- Локальные переменные
-- Условие
-- Хранимая процедура
-- Представление
CREATE VIEW FiveStarCharacters AS
SELECT * FROM Characters WHERE Rarity_idRarity = 1;
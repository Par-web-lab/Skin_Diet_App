CREATE DATABASE Skin_Diet_Plan;
USE Skin_Diet_Plan;

CREATE TABLE skin_problems (
    id INT AUTO_INCREMENT PRIMARY KEY,
    problem_name VARCHAR(100) NOT NULL
);

INSERT INTO skin_problems (problem_name) VALUES
('Acne'), ('Blackheads'), ('Whiteheads'), ('Dry Skin'),
('Oily Skin'), ('Dehydration'), ('Dull Skin'), ('Dark Circles'),
('Pigmentation'), ('Redness/Irritation'), ('Sunburn'), ('Wrinkles'),
('Open Pores'), ('Uneven Skin Tone'), ('Itchy Skin'), ('Tanned Skin'),
('Sensitive Skin'), ('Flaky Skin'), ('Skin Allergies'), ('Rough Texture');



CREATE TABLE diet_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    type ENUM('liquid', 'non-liquid') NOT NULL
);

INSERT INTO diet_items (item_name, type) VALUES
('Cucumber', 'non-liquid'),
('Turmeric', 'non-liquid'),
('Green Tea', 'liquid'),
('Pumpkin Seeds', 'non-liquid'),
('Tomatoes', 'non-liquid'),
('Lemon Water', 'liquid'),
('Oats', 'non-liquid'),
('Apple Cider Vinegar', 'liquid'),
('Watermelon', 'non-liquid'),
('Carrots', 'non-liquid'),
('Yogurt', 'non-liquid'),
('Ginger', 'non-liquid'),
('Berries', 'non-liquid'),
('Almonds', 'non-liquid'),
('Avocado', 'non-liquid'),
('Chia Seeds', 'non-liquid'),
('Coconut Water', 'liquid'),
('Sweet Potatoes', 'non-liquid'),
('Grapefruit', 'non-liquid'),
('Lentils', 'non-liquid'),
('Brown Rice', 'non-liquid'),
('Water', 'liquid'),
('Oranges', 'non-liquid'),
('Pomegranate', 'non-liquid'),
('Spinach', 'non-liquid'),
('Walnuts', 'non-liquid'),
('Tomato Juice', 'liquid'),
('Papaya', 'non-liquid'),
('Turmeric Milk', 'liquid'),
('Aloe Vera Juice', 'liquid'),
('Chamomile Tea', 'liquid'),
('Blueberries', 'non-liquid'),
('Curd', 'non-liquid'),
('Broccoli', 'non-liquid'),
('Dark Chocolate', 'non-liquid'),
('Beet Root', 'non-liquid'),
('Buttermilk', 'liquid'),
('Orange Juice', 'liquid'),
('Banana', 'non-liquid'),
('Flax Seeds', 'non-liquid'),
('Sunflower Seeds', 'non-liquid');


CREATE TABLE problem_diet_map (
    problem_id INT,
    diet_item_id INT,
    FOREIGN KEY (problem_id) REFERENCES skin_problems(id),
    FOREIGN KEY (diet_item_id) REFERENCES diet_items(id)
);



INSERT INTO problem_diet_map (problem_id, diet_item_id) VALUES
(1, 1),   -- Cucumber
(1, 2),   -- Turmeric
(1, 3),   -- Green Tea
(1, 5),   -- Tomatoes
(1, 6),   -- Lemon Water
(1, 8),   -- Apple Cider Vinegar
(1, 10),  -- Carrots
(1, 11),  -- Yogurt
(1, 13),  -- Berries
(1, 14),  -- Almonds
(1, 16),  -- Chia Seeds
(1, 22),  -- Water
(1, 24),  -- Pomegranate
(1, 25),  -- Spinach
(1, 30), -- Aloe Vera Juice
(2, 1),   -- Cucumber
(2, 2),   -- Turmeric
(2, 3),   -- Green Tea
(2, 4),   -- Pumpkin Seeds
(2, 5),   -- Tomatoes
(2, 6),   -- Lemon Water
(2, 8),   -- Apple Cider Vinegar
(2, 10),  -- Carrots
(2, 11),  -- Yogurt
(2, 13),  -- Berries
(2, 16),  -- Chia Seeds
(2, 22),  -- Water
(2, 24),  -- Pomegranate
(2, 25),  -- Spinach
(2, 28), -- Papaya
(3, 1),   -- Cucumber
(3, 2),   -- Turmeric
(3, 3),   -- Green Tea
(3, 4),   -- Pumpkin Seeds
(3, 5),   -- Tomatoes
(3, 6),   -- Lemon Water
(3, 8),   -- Apple Cider Vinegar
(3, 9),   -- Watermelon
(3, 10),  -- Carrots
(3, 11),  -- Yogurt
(3, 13),  -- Berries
(3, 14),  -- Almonds
(3, 15),  -- Avocado
(3, 16),  -- Chia Seeds
(3, 17),  -- Coconut Water
(3, 18),  -- Sweet Potatoes
(3, 22),  -- Water
(3, 23),  -- Oranges
(3, 24),  -- Pomegranate
(3, 25),  -- Spinach
(3, 26),  -- Walnuts
(3, 28),  -- Papaya
(3, 30),  -- Aloe Vera Juice
(3, 32),  -- Blueberries
(3, 33),  -- Curd
(4, 1),   -- Cucumber
(4, 5),   -- Tomatoes
(4, 6),   -- Lemon Water
(4, 7),   -- Oats
(4, 9),   -- Watermelon
(4, 10),  -- Carrots
(4, 11),  -- Yogurt
(4, 13),  -- Berries
(4, 14),  -- Almonds
(4, 15),  -- Avocado
(4, 16),  -- Chia Seeds
(4, 17),  -- Coconut Water
(4, 18),  -- Sweet Potatoes
(4, 22),  -- Water
(4, 23),  -- Oranges
(4, 24),  -- Pomegranate
(4, 25),  -- Spinach
(4, 26),  -- Walnuts
(4, 28),  -- Papaya
(4, 30),  -- Aloe Vera Juice
(4, 31),  -- Chamomile Tea
(4, 32),  -- Blueberries
(4, 33),  -- Curd
(4, 36),  -- Beet Root
(4, 37),  -- Buttermilk
(5, 1),   -- Cucumber
(5, 2),   -- Turmeric
(5, 3),   -- Green Tea
(5, 4),   -- Pumpkin Seeds
(5, 5),   -- Tomatoes
(5, 6),   -- Lemon Water
(5, 7),   -- Oats
(5, 8),   -- Apple Cider Vinegar
(5, 10),  -- Carrots
(5, 11),  -- Yogurt
(5, 13),  -- Berries
(5, 14),  -- Almonds
(5, 15),  -- Avocado
(5, 18),  -- Sweet Potatoes
(5, 19),  -- Grapefruit
(5, 20),  -- Lentils
(5, 21),  -- Brown Rice
(5, 22),  -- Water
(5, 23),  -- Oranges
(5, 24),  -- Pomegranate
(5, 25),  -- Spinach
(5, 26),  -- Walnuts
(5, 34),  -- Broccoli
(5, 35),  -- Dark Chocolate
(5, 36),  -- Beet Root
(6, 1),   -- Cucumber
(6, 3),   -- Green Tea
(6, 6),   -- Lemon Water
(6, 9),   -- Watermelon
(6, 10),  -- Carrots
(6, 13),  -- Berries
(6, 15),  -- Avocado
(6, 16),  -- Chia Seeds
(6, 17),  -- Coconut Water
(6, 18),  -- Sweet Potatoes
(6, 19),  -- Grapefruit
(6, 22),  -- Water
(6, 23),  -- Oranges
(6, 24),  -- Pomegranate
(6, 25),  -- Spinach
(6, 26),  -- Walnuts
(6, 28),  -- Papaya
(6, 30),  -- Aloe Vera Juice
(6, 31),  -- Chamomile Tea
(6, 32),  -- Blueberries
(6, 33),  -- Curd
(6, 34),  -- Broccoli
(6, 37),  -- Buttermilk
(6, 38),  -- Orange Juice
(6, 40),  -- Flax Seeds
(7, 2),   -- Turmeric
(7, 3),   -- Green Tea
(7, 5),   -- Tomatoes
(7, 6),   -- Lemon Water
(7, 7),   -- Oats
(7, 10),  -- Carrots
(7, 13),  -- Berries
(7, 14),  -- Almonds
(7, 15),  -- Avocado
(7, 18),  -- Sweet Potatoes
(7, 19),  -- Grapefruit
(7, 22),  -- Water
(7, 23),  -- Oranges
(7, 24),  -- Pomegranate
(7, 25),  -- Spinach
(7, 26),  -- Walnuts
(7, 28),  -- Papaya
(7, 29),  -- Turmeric Milk
(7, 30),  -- Aloe Vera Juice
(7, 32),  -- Blueberries
(7, 33),  -- Curd
(7, 34),  -- Broccoli
(7, 35),  -- Dark Chocolate
(7, 38),  -- Orange Juice
(7, 41),  -- Sunflower Seeds
(8, 1),   -- Cucumber
(8, 2),   -- Turmeric
(8, 3),   -- Green Tea
(8, 6),   -- Lemon Water
(8, 7),   -- Oats
(8, 10),  -- Carrots
(8, 13),  -- Berries
(8, 14),  -- Almonds
(8, 15),  -- Avocado
(8, 16),  -- Chia Seeds
(8, 17),  -- Coconut Water
(8, 18),  -- Sweet Potatoes
(8, 20),  -- Beetroot
(8, 22),  -- Water
(8, 23),  -- Oranges
(8, 24),  -- Pomegranate
(8, 25),  -- Spinach
(8, 26),  -- Walnuts
(8, 28),  -- Papaya
(8, 29),  -- Turmeric Milk
(8, 30),  -- Aloe Vera Juice
(8, 32),  -- Blueberries
(8, 33),  -- Curd
(8, 35),  -- Dark Chocolate
(8, 41),  -- Sunflower Seeds
(9, 2),   -- Turmeric
(9, 3),   -- Green Tea
(9, 5),   -- Tomatoes
(9, 6),   -- Lemon Water
(9, 7),   -- Oats
(9, 10),  -- Carrots
(9, 13),  -- Berries
(9, 14),  -- Almonds
(9, 15),  -- Avocado
(9, 18),  -- Sweet Potatoes
(9, 19),  -- Grapefruit
(9, 20),  -- Beetroot
(9, 22),  -- Water
(9, 23),  -- Oranges
(9, 24),  -- Pomegranate
(9, 25),  -- Spinach
(9, 26),  -- Walnuts
(9, 28),  -- Papaya
(9, 29),  -- Turmeric Milk
(9, 30),  -- Aloe Vera Juice
(9, 32),  -- Blueberries
(9, 34),  -- Broccoli
(9, 35),  -- Dark Chocolate
(9, 38),  -- Orange Juice
(9, 41),  -- Sunflower Seeds
(10, 1),  -- Cucumber
(10, 2),  -- Turmeric
(10, 3),  -- Green Tea
(10, 6),  -- Lemon Water
(10, 7),  -- Oats
(10, 10), -- Carrots
(10, 13), -- Berries
(10, 14), -- Almonds
(10, 15), -- Avocado
(10, 16), -- Chia Seeds
(10, 17), -- Coconut Water
(10, 18), -- Sweet Potatoes
(10, 20), -- Beetroot
(10, 22), -- Water
(10, 23), -- Oranges
(10, 24), -- Pomegranate
(10, 25), -- Spinach
(10, 26), -- Walnuts
(10, 28), -- Papaya
(10, 29), -- Turmeric Milk
(10, 30), -- Aloe Vera Juice
(10, 32), -- Blueberries
(10, 33), -- Curd
(10, 34), -- Broccoli
(10, 41), -- Sunflower Seeds
(11, 1), (11, 2), (11, 3), (11, 5), (11, 6), (11, 9), (11, 10), (11, 13), (11, 15), (11, 17),
(11, 18), (11, 20), (11, 22), (11, 23), (11, 24), (11, 25), (11, 26), (11, 28), (11, 29), (11, 30),
(11, 31), (11, 32), (11, 34), (11, 36), (11, 39),
(12, 1), (12, 2), (12, 3), (12, 4), (12, 7), (12, 9), (12, 10), (12, 13), (12, 14), (12, 15),
(12, 18), (12, 21), (12, 22), (12, 23), (12, 24), (12, 25), (12, 26), (12, 27), (12, 28), (12, 30),
(12, 31), (12, 32), (12, 34), (12, 35), (12, 41),
(13, 1), (13, 2), (13, 3), (13, 5), (13, 6), (13, 7), (13, 8), (13, 10), (13, 12), (13, 13),
(13, 14), (13, 15), (13, 17), (13, 18), (13, 22), (13, 23), (13, 24), (13, 25), (13, 26), (13, 28),
(13, 30), (13, 32), (13, 34), (13, 36), (13, 40),
(14, 1),   -- Cucumber
(14, 2),   -- Turmeric
(14, 3),   -- Green Tea
(14, 5),   -- Tomatoes
(14, 6),   -- Lemon Water
(14, 9),   -- Watermelon
(14, 10),  -- Carrots
(14, 13),  -- Berries
(14, 15),  -- Avocado
(14, 16),  -- Chia Seeds
(14, 17),  -- Coconut Water
(14, 18),  -- Sweet Potatoes
(14, 19),  -- Grapefruit
(14, 22),  -- Water
(14, 23),  -- Oranges
(14, 24),  -- Pomegranate
(14, 25),  -- Spinach
(14, 27),  -- Tomato Juice
(14, 28),  -- Papaya
(14, 30),  -- Aloe Vera Juice
(14, 31),  -- Chamomile Tea
(14, 32),  -- Blueberries
(14, 34),  -- Broccoli
(14, 35),  -- Dark Chocolate
(14, 38),  -- Orange Juice
(15, 1),   -- Cucumber
(15, 2),   -- Turmeric
(15, 3),   -- Green Tea
(15, 7),   -- Oats
(15, 11),  -- Yogurt
(15, 12),  -- Ginger
(15, 13),  -- Berries
(15, 14),  -- Almonds
(15, 15),  -- Avocado
(15, 16),  -- Chia Seeds
(15, 17),  -- Coconut Water
(15, 18),  -- Sweet Potatoes
(15, 20),  -- Lentils
(15, 21),  -- Brown Rice
(15, 22),  -- Water
(15, 24),  -- Pomegranate
(15, 25),  -- Spinach
(15, 26),  -- Walnuts
(15, 28),  -- Papaya
(15, 29),  -- Turmeric Milk
(15, 30),  -- Aloe Vera Juice
(15, 31),  -- Chamomile Tea
(15, 33),  -- Curd
(15, 37),  -- Buttermilk
(15, 39),  -- Banana
(16, 1),   -- Cucumber
(16, 2),   -- Turmeric
(16, 3),   -- Green Tea
(16, 5),   -- Tomatoes
(16, 6),   -- Lemon Water
(16, 9),   -- Watermelon
(16, 10),  -- Carrots
(16, 13),  -- Berries
(16, 15),  -- Avocado
(16, 17),  -- Coconut Water
(16, 18),  -- Sweet Potatoes
(16, 19),  -- Grapefruit
(16, 22),  -- Water
(16, 23),  -- Oranges
(16, 24),  -- Pomegranate
(16, 25),  -- Spinach
(16, 27),  -- Tomato Juice
(16, 28),  -- Papaya
(16, 29),  -- Turmeric Milk
(16, 30),  -- Aloe Vera Juice
(16, 31),  -- Chamomile Tea
(16, 32),  -- Blueberries
(16, 34),  -- Broccoli
(16, 35),  -- Dark Chocolate
(16, 38),  -- Orange Juice
(17, 1),   -- Cucumber  
(17, 2),   -- Turmeric  
(17, 3),   -- Green Tea  
(17, 6),   -- Lemon Water  
(17, 11),  -- Yogurt  
(17, 12),  -- Ginger  
(17, 13),  -- Berries  
(17, 14),  -- Almonds  
(17, 15),  -- Avocado  
(17, 16),  -- Chia Seeds  
(17, 17),  -- Coconut Water  
(17, 22),  -- Water  
(17, 24),  -- Pomegranate  
(17, 25),  -- Spinach  
(17, 26),  -- Walnuts  
(17, 28),  -- Papaya  
(17, 29),  -- Turmeric Milk  
(17, 30),  -- Aloe Vera Juice  
(17, 31),  -- Chamomile Tea  
(17, 32),  -- Blueberries  
(17, 33),  -- Curd  
(17, 34),  -- Broccoli  
(17, 35),  -- Dark Chocolate  
(17, 36),  -- Beet Root  
(17, 37),   -- Buttermilk
(18, 1),   -- Cucumber  
(18, 3),   -- Green Tea  
(18, 7),   -- Oats  
(18, 9),   -- Watermelon  
(18, 10),  -- Carrots  
(18, 11),  -- Yogurt  
(18, 13),  -- Berries  
(18, 14),  -- Almonds  
(18, 15),  -- Avocado  
(18, 16),  -- Chia Seeds  
(18, 17),  -- Coconut Water  
(18, 18),  -- Sweet Potatoes  
(18, 20),  -- Lentils  
(18, 21),  -- Brown Rice  
(18, 22),  -- Water  
(18, 24),  -- Pomegranate  
(18, 25),  -- Spinach  
(18, 26),  -- Walnuts  
(18, 28),  -- Papaya  
(18, 30),  -- Aloe Vera Juice  
(18, 32),  -- Blueberries  
(18, 33),  -- Curd  
(18, 34),  -- Broccoli  
(18, 36),  -- Beet Root  
(18, 39),   -- Banana
(19, 1),   -- Cucumber  
(19, 2),   -- Turmeric  
(19, 3),   -- Green Tea  
(19, 6),   -- Lemon Water  
(19, 11),  -- Yogurt  
(19, 12),  -- Ginger  
(19, 13),  -- Berries  
(19, 14),  -- Almonds  
(19, 15),  -- Avocado  
(19, 16),  -- Chia Seeds  
(19, 17),  -- Coconut Water  
(19, 22),  -- Water  
(19, 24),  -- Pomegranate  
(19, 25),  -- Spinach  
(19, 26),  -- Walnuts  
(19, 28),  -- Papaya  
(19, 29),  -- Turmeric Milk  
(19, 30),  -- Aloe Vera Juice  
(19, 31),  -- Chamomile Tea  
(19, 32),  -- Blueberries  
(19, 33),  -- Curd  
(19, 34),  -- Broccoli  
(19, 36),  -- Beet Root  
(19, 37),  -- Buttermilk  
(19, 40),   -- Flax Seeds
(20, 1),   -- Cucumber  
(20, 3),   -- Green Tea  
(20, 7),   -- Oats  
(20, 9),   -- Watermelon  
(20, 10),  -- Carrots  
(20, 11),  -- Yogurt  
(20, 13),  -- Berries  
(20, 14),  -- Almonds  
(20, 15),  -- Avocado  
(20, 16),  -- Chia Seeds  
(20, 17),  -- Coconut Water  
(20, 18),  -- Sweet Potatoes  
(20, 20),  -- Lentils  
(20, 21),  -- Brown Rice  
(20, 22),  -- Water  
(20, 24),  -- Pomegranate  
(20, 25),  -- Spinach  
(20, 26),  -- Walnuts  
(20, 28),  -- Papaya  
(20, 30),  -- Aloe Vera Juice  
(20, 32),  -- Blueberries  
(20, 33),  -- Curd  
(20, 34),  -- Broccoli  
(20, 36),  -- Beet Root  
(20, 39);   -- Banana


select * from skin_problems;

Drop table diet_items;


Select * from diet_items;

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS problem_diet_map;
DROP TABLE IF EXISTS diet_items;
SET FOREIGN_KEY_CHECKS = 1;

Select * from problem_diet_map;
DELETE FROM diet_items WHERE item_name IN ('Turmeric', 'Tomatoes');

select * from diet_items;
 
Delete from problem_diet_map where diet_item_id in (2,5);


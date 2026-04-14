-- =====================================================
-- 1. Вставка категорий с подкатегориями (иерархия)
-- =====================================================

-- Корневые категории
INSERT INTO categories (name, parent_id) VALUES
('Электроника', NULL),
('Одежда', NULL),
('Дом и сад', NULL),
('Спорт и отдых', NULL),
('Книги', NULL);

-- Подкатегории электроники
INSERT INTO categories (name, parent_id) VALUES
('Смартфоны', (SELECT id FROM categories WHERE name = 'Электроника')),
('Ноутбуки', (SELECT id FROM categories WHERE name = 'Электроника')),
('Планшеты', (SELECT id FROM categories WHERE name = 'Электроника')),
('Аксессуары', (SELECT id FROM categories WHERE name = 'Электроника'));

-- Подкатегории одежды
INSERT INTO categories (name, parent_id) VALUES
('Мужская', (SELECT id FROM categories WHERE name = 'Одежда')),
('Женская', (SELECT id FROM categories WHERE name = 'Одежда')),
('Детская', (SELECT id FROM categories WHERE name = 'Одежда'));

-- Подкатегории дома и сада
INSERT INTO categories (name, parent_id) VALUES
('Мебель', (SELECT id FROM categories WHERE name = 'Дом и сад')),
('Посуда', (SELECT id FROM categories WHERE name = 'Дом и сад')),
('Инструменты', (SELECT id FROM categories WHERE name = 'Дом и сад'));

-- Под-подкатегории (глубина 2)
INSERT INTO categories (name, parent_id) VALUES
('Смартфоны Apple', (SELECT id FROM categories WHERE name = 'Смартфоны')),
('Смартфоны Samsung', (SELECT id FROM categories WHERE name = 'Смартфоны')),
('Смартфоны Xiaomi', (SELECT id FROM categories WHERE name = 'Смартфоны')),
('Ноутбуки Apple', (SELECT id FROM categories WHERE name = 'Ноутбуки')),
('Ноутбуки Asus', (SELECT id FROM categories WHERE name = 'Ноутбуки')),
('Ноутбуки Lenovo', (SELECT id FROM categories WHERE name = 'Ноутбуки')),
('Футболки', (SELECT id FROM categories WHERE name = 'Мужская')),
('Джинсы', (SELECT id FROM categories WHERE name = 'Мужская')),
('Платья', (SELECT id FROM categories WHERE name = 'Женская')),
('Юбки', (SELECT id FROM categories WHERE name = 'Женская'));

-- =====================================================
-- 2. Вставка товаров
-- =====================================================

INSERT INTO products (name, quantity, price, category_id) VALUES
-- Смартфоны
('iPhone 14 Pro', 25, 899.00, (SELECT id FROM categories WHERE name = 'Смартфоны Apple')),
('iPhone 15 Pro Max', 15, 1199.00, (SELECT id FROM categories WHERE name = 'Смартфоны Apple')),
('Samsung Galaxy S23', 30, 799.00, (SELECT id FROM categories WHERE name = 'Смартфоны Samsung')),
('Samsung Galaxy Z Fold 4', 10, 1499.00, (SELECT id FROM categories WHERE name = 'Смартфоны Samsung')),
('Xiaomi 13 Pro', 40, 699.00, (SELECT id FROM categories WHERE name = 'Смартфоны Xiaomi')),

-- Ноутбуки
('MacBook Pro 14" M3', 12, 1999.00, (SELECT id FROM categories WHERE name = 'Ноутбуки Apple')),
('MacBook Air 13" M2', 20, 1099.00, (SELECT id FROM categories WHERE name = 'Ноутбуки Apple')),
('Asus ROG Zephyrus G14', 8, 1599.00, (SELECT id FROM categories WHERE name = 'Ноутбуки Asus')),
('Asus Vivobook 15', 35, 599.00, (SELECT id FROM categories WHERE name = 'Ноутбуки Asus')),
('Lenovo ThinkPad X1 Carbon', 18, 1799.00, (SELECT id FROM categories WHERE name = 'Ноутбуки Lenovo')),

-- Одежда мужская
('Футболка хлопковая белая', 100, 19.99, (SELECT id FROM categories WHERE name = 'Футболки')),
('Футболка поло черная', 80, 29.99, (SELECT id FROM categories WHERE name = 'Футболки')),
('Джинсы классические синие', 50, 59.99, (SELECT id FROM categories WHERE name = 'Джинсы')),
('Джинсы скинни черные', 45, 69.99, (SELECT id FROM categories WHERE name = 'Джинсы')),

-- Одежда женская
('Платье летнее цветочное', 35, 79.99, (SELECT id FROM categories WHERE name = 'Платья')),
('Платье вечернее черное', 20, 149.99, (SELECT id FROM categories WHERE name = 'Платья')),
('Юбка миди кожаная', 40, 89.99, (SELECT id FROM categories WHERE name = 'Юбки')),

-- Аксессуары
('Зарядное устройство 20W', 200, 19.99, (SELECT id FROM categories WHERE name = 'Аксессуары')),
('Наушники AirPods Pro', 45, 199.99, (SELECT id FROM categories WHERE name = 'Аксессуары')),
('Чехол для телефона', 150, 9.99, (SELECT id FROM categories WHERE name = 'Аксессуары')),

-- Мебель
('Стол письменный', 25, 149.99, (SELECT id FROM categories WHERE name = 'Мебель')),
('Стул офисный', 60, 89.99, (SELECT id FROM categories WHERE name = 'Мебель')),

-- Посуда
('Набор тарелок 12 шт', 30, 39.99, (SELECT id FROM categories WHERE name = 'Посуда')),
('Сковорода антипригарная', 55, 29.99, (SELECT id FROM categories WHERE name = 'Посуда'));

-- =====================================================
-- 3. Вставка покупателей
-- =====================================================

INSERT INTO customers (name, address) VALUES
('Иван Петров', 'г. Москва, ул. Тверская, д. 15, кв. 45'),
('Мария Сидорова', 'г. Санкт-Петербург, Невский пр-т, д. 25, кв. 12'),
('Алексей Иванов', 'г. Новосибирск, ул. Ленина, д. 8, кв. 56'),
('Елена Смирнова', 'г. Екатеринбург, ул. Малышева, д. 30, кв. 78'),
('Дмитрий Козлов', 'г. Казань, ул. Баумана, д. 10, кв. 34'),
('Анна Воробьева', 'г. Нижний Новгород, ул. Большая Покровская, д. 5, кв. 23'),
('Сергей Михайлов', 'г. Челябинск, пр-т Ленина, д. 42, кв. 67'),
('Ольга Новикова', 'г. Самара, ул. Полевая, д. 18, кв. 91'),
('Андрей Соколов', 'г. Омск, ул. Красный Путь, д. 7, кв. 44'),
('Татьяна Кузнецова', 'г. Ростов-на-Дону, ул. Большая Садовая, д. 22, кв. 15');

-- =====================================================
-- 4. Вставка заказов
-- =====================================================

INSERT INTO orders (customer_id, order_date) VALUES
((SELECT id FROM customers WHERE name = 'Иван Петров'), '2026-02-05 10:30:00'),
((SELECT id FROM customers WHERE name = 'Иван Петров'), '2026-03-20 14:45:00'),
((SELECT id FROM customers WHERE name = 'Мария Сидорова'), '2026-02-18 11:15:00'),
((SELECT id FROM customers WHERE name = 'Алексей Иванов'), '2026-02-22 09:30:00'),
((SELECT id FROM customers WHERE name = 'Елена Смирнова'), '2026-03-05 16:20:00'),
((SELECT id FROM customers WHERE name = 'Дмитрий Козлов'), '2026-03-10 13:10:00'),
((SELECT id FROM customers WHERE name = 'Мария Сидорова'), '2026-03-25 15:45:00'),
((SELECT id FROM customers WHERE name = 'Анна Воробьева'), '2026-04-01 10:00:00'),
((SELECT id FROM customers WHERE name = 'Сергей Михайлов'), '2026-04-05 12:30:00'),
((SELECT id FROM customers WHERE name = 'Ольга Новикова'), '2026-04-10 09:15:00'),
((SELECT id FROM customers WHERE name = 'Андрей Соколов'), '2026-04-12 17:45:00'),
((SELECT id FROM customers WHERE name = 'Татьяна Кузнецова'), '2026-04-15 11:20:00'),
((SELECT id FROM customers WHERE name = 'Алексей Иванов'), '2026-04-18 14:30:00'),
((SELECT id FROM customers WHERE name = 'Елена Смирнова'), '2026-04-20 13:15:00'),
((SELECT id FROM customers WHERE name = 'Дмитрий Козлов'), '2026-04-25 10:45:00');

-- =====================================================
-- 5. Вставка позиций заказов
-- =====================================================

INSERT INTO order_items (order_id, product_id, quantity) VALUES
((SELECT id FROM orders WHERE order_date = '2026-02-05 10:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Иван Петров')), (SELECT id FROM products WHERE name = 'iPhone 14 Pro'), 1),
((SELECT id FROM orders WHERE order_date = '2026-02-05 10:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Иван Петров')), (SELECT id FROM products WHERE name = 'Чехол для телефона'), 2),

((SELECT id FROM orders WHERE order_date = '2026-03-20 14:45:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Иван Петров')), (SELECT id FROM products WHERE name = 'MacBook Pro 14" M3'), 1),
((SELECT id FROM orders WHERE order_date = '2026-03-20 14:45:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Иван Петров')), (SELECT id FROM products WHERE name = 'Зарядное устройство 20W'), 1),

((SELECT id FROM orders WHERE order_date = '2026-02-18 11:15:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Мария Сидорова')), (SELECT id FROM products WHERE name = 'Samsung Galaxy S23'), 1),
((SELECT id FROM orders WHERE order_date = '2026-02-18 11:15:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Мария Сидорова')), (SELECT id FROM products WHERE name = 'Наушники AirPods Pro'), 1),

((SELECT id FROM orders WHERE order_date = '2026-02-22 09:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Алексей Иванов')), (SELECT id FROM products WHERE name = 'Asus ROG Zephyrus G14'), 1),
((SELECT id FROM orders WHERE order_date = '2026-02-22 09:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Алексей Иванов')), (SELECT id FROM products WHERE name = 'Джинсы классические синие'), 2),

((SELECT id FROM orders WHERE order_date = '2026-03-05 16:20:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Елена Смирнова')), (SELECT id FROM products WHERE name = 'Платье летнее цветочное'), 2),
((SELECT id FROM orders WHERE order_date = '2026-03-05 16:20:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Елена Смирнова')), (SELECT id FROM products WHERE name = 'Юбка миди кожаная'), 1),
((SELECT id FROM orders WHERE order_date = '2026-03-05 16:20:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Елена Смирнова')), (SELECT id FROM products WHERE name = 'Набор тарелок 12 шт'), 1),

((SELECT id FROM orders WHERE order_date = '2026-03-10 13:10:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Дмитрий Козлов')), (SELECT id FROM products WHERE name = 'Xiaomi 13 Pro'), 1),
((SELECT id FROM orders WHERE order_date = '2026-03-10 13:10:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Дмитрий Козлов')), (SELECT id FROM products WHERE name = 'Футболка хлопковая белая'), 3),
((SELECT id FROM orders WHERE order_date = '2026-03-10 13:10:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Дмитрий Козлов')), (SELECT id FROM products WHERE name = 'Стул офисный'), 2),

((SELECT id FROM orders WHERE order_date = '2026-03-25 15:45:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Мария Сидорова')), (SELECT id FROM products WHERE name = 'MacBook Air 13" M2'), 1),
((SELECT id FROM orders WHERE order_date = '2026-03-25 15:45:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Мария Сидорова')), (SELECT id FROM products WHERE name = 'Платье вечернее черное'), 1),

((SELECT id FROM orders WHERE order_date = '2026-04-01 10:00:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Анна Воробьева')), (SELECT id FROM products WHERE name = 'Lenovo ThinkPad X1 Carbon'), 1),
((SELECT id FROM orders WHERE order_date = '2026-04-01 10:00:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Анна Воробьева')), (SELECT id FROM products WHERE name = 'Сковорода антипригарная'), 2),

((SELECT id FROM orders WHERE order_date = '2026-04-05 12:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Сергей Михайлов')), (SELECT id FROM products WHERE name = 'iPhone 15 Pro Max'), 2),
((SELECT id FROM orders WHERE order_date = '2026-04-05 12:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Сергей Михайлов')), (SELECT id FROM products WHERE name = 'Чехол для телефона'), 2),
((SELECT id FROM orders WHERE order_date = '2026-04-05 12:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Сергей Михайлов')), (SELECT id FROM products WHERE name = 'Зарядное устройство 20W'), 1),

((SELECT id FROM orders WHERE order_date = '2026-04-10 09:15:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Ольга Новикова')), (SELECT id FROM products WHERE name = 'Джинсы скинни черные'), 1),
((SELECT id FROM orders WHERE order_date = '2026-04-10 09:15:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Ольга Новикова')), (SELECT id FROM products WHERE name = 'Футболка поло черная'), 2),

((SELECT id FROM orders WHERE order_date = '2026-04-12 17:45:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Андрей Соколов')), (SELECT id FROM products WHERE name = 'Asus Vivobook 15'), 1),
((SELECT id FROM orders WHERE order_date = '2026-04-12 17:45:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Андрей Соколов')), (SELECT id FROM products WHERE name = 'Стол письменный'), 1),

((SELECT id FROM orders WHERE order_date = '2026-04-15 11:20:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Татьяна Кузнецова')), (SELECT id FROM products WHERE name = 'Samsung Galaxy Z Fold 4'), 1),
((SELECT id FROM orders WHERE order_date = '2026-04-15 11:20:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Татьяна Кузнецова')), (SELECT id FROM products WHERE name = 'Наушники AirPods Pro'), 1),

((SELECT id FROM orders WHERE order_date = '2026-04-18 14:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Алексей Иванов')), (SELECT id FROM products WHERE name = 'MacBook Pro 14" M3'), 1),
((SELECT id FROM orders WHERE order_date = '2026-04-18 14:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Алексей Иванов')), (SELECT id FROM products WHERE name = 'Зарядное устройство 20W'), 2),
((SELECT id FROM orders WHERE order_date = '2026-04-18 14:30:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Алексей Иванов')), (SELECT id FROM products WHERE name = 'Набор тарелок 12 шт'), 1),

((SELECT id FROM orders WHERE order_date = '2026-04-20 13:15:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Елена Смирнова')), (SELECT id FROM products WHERE name = 'Платье летнее цветочное'), 1),
((SELECT id FROM orders WHERE order_date = '2026-04-20 13:15:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Елена Смирнова')), (SELECT id FROM products WHERE name = 'Юбка миди кожаная'), 1),
((SELECT id FROM orders WHERE order_date = '2026-04-20 13:15:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Елена Смирнова')), (SELECT id FROM products WHERE name = 'Футболка хлопковая белая'), 2),

((SELECT id FROM orders WHERE order_date = '2026-04-25 10:45:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Дмитрий Козлов')), (SELECT id FROM products WHERE name = 'Xiaomi 13 Pro'), 2),
((SELECT id FROM orders WHERE order_date = '2026-04-25 10:45:00' AND customer_id = (SELECT id FROM customers WHERE name = 'Дмитрий Козлов')), (SELECT id FROM products WHERE name = 'Стул офисный'), 1);
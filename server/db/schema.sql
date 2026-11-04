CREATE TABLE IF NOT EXISTS books (
 id SERIAL PRIMARY KEY, title VARCHAR(200) NOT NULL, author VARCHAR(160) NOT NULL,
 category VARCHAR(80) NOT NULL, brand VARCHAR(100) NOT NULL, price NUMERIC(10,2) NOT NULL CHECK(price>=0),
 old_price NUMERIC(10,2), rating NUMERIC(2,1) DEFAULT 0, delivery VARCHAR(60),
 cover_color VARCHAR(30), description TEXT, active BOOLEAN DEFAULT TRUE
);
CREATE TABLE IF NOT EXISTS orders (
 id BIGSERIAL PRIMARY KEY, customer_email VARCHAR(255) NOT NULL, status VARCHAR(30) NOT NULL DEFAULT 'Confirmed',
 subtotal NUMERIC(10,2) NOT NULL, discount NUMERIC(10,2) DEFAULT 0, shipping NUMERIC(10,2) DEFAULT 0,
 total NUMERIC(10,2) NOT NULL, payment_method VARCHAR(50) NOT NULL, address JSONB NOT NULL,
 created_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS order_items (
 id BIGSERIAL PRIMARY KEY, order_id BIGINT REFERENCES orders(id) ON DELETE CASCADE,
 book_id INT REFERENCES books(id), quantity INT NOT NULL CHECK(quantity>0), unit_price NUMERIC(10,2) NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_orders_email ON orders(customer_email);
CREATE INDEX IF NOT EXISTS idx_order_items_order ON order_items(order_id);

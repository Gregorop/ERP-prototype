import asyncpg
from typing import Optional
from models import Order, Product, OrderItem

class OrderRepository:
    @staticmethod
    async def get_by_id(conn: asyncpg.Connection, order_id: int) -> Optional[Order]:
        row = await conn.fetchrow("SELECT id FROM orders WHERE id = $1", order_id)
        return Order(id=row["id"]) if row else None

class ProductRepository:
    @staticmethod
    async def get_by_id(conn: asyncpg.Connection, product_id: int) -> Optional[Product]:
        row = await conn.fetchrow(
            "SELECT id, quantity, name FROM products WHERE id = $1",
            product_id
        )
        return Product(id=row["id"], quantity=row["quantity"], name=row["name"]) if row else None
    
    @staticmethod
    async def decrease_quantity(conn: asyncpg.Connection, product_id: int, quantity: int):
        await conn.execute(
            "UPDATE products SET quantity = quantity - $1 WHERE id = $2",
            quantity, product_id
        )

class OrderItemRepository:
    @staticmethod
    async def get_by_order_and_product(
        conn: asyncpg.Connection, 
        order_id: int, 
        product_id: int
    ) -> Optional[OrderItem]:
        row = await conn.fetchrow(
            "SELECT id, order_id, product_id, quantity FROM order_items WHERE order_id = $1 AND product_id = $2",
            order_id, product_id
        )
        return OrderItem(
            id=row["id"],
            order_id=row["order_id"],
            product_id=row["product_id"],
            quantity=row["quantity"]
        ) if row else None
    
    @staticmethod
    async def update_quantity(conn: asyncpg.Connection, item_id: int, new_quantity: int):
        await conn.execute(
            "UPDATE order_items SET quantity = $1 WHERE id = $2",
            new_quantity, item_id
        )
    
    @staticmethod
    async def create(conn: asyncpg.Connection, order_id: int, product_id: int, quantity: int):
        await conn.execute(
            "INSERT INTO order_items (order_id, product_id, quantity) VALUES ($1, $2, $3)",
            order_id, product_id, quantity
        )
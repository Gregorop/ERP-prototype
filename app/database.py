import asyncpg
import os
from fastapi import Depends

async def get_db():
    conn = await asyncpg.connect(
        host=os.getenv("POSTGRES_HOST", "postgres"),
        port=os.getenv("POSTGRES_PORT", "5433"),
        user=os.getenv("POSTGRES_USER", "postgres"),
        password=os.getenv("POSTGRES_PASSWORD", "password"),
        database=os.getenv("POSTGRES_DB", "orders_db")
    )
    try:
        yield conn
    finally:
        await conn.close()
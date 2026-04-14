from fastapi import APIRouter, HTTPException, Depends
import asyncpg
from models import AddItemRequest
from database import get_db
from repositories import OrderRepository, ProductRepository, OrderItemRepository

router = APIRouter()

@router.post("/api/orders/add-item")
async def add_item_to_order(request: AddItemRequest, conn: asyncpg.Connection = Depends(get_db)):
    """
    Добавление товара в заказ.
    Если товар уже есть в заказе - увеличивает количество.
    Проверяет наличие товара на складе.
    """
    order = await OrderRepository.get_by_id(conn, request.order_id)
    if not order:
        raise HTTPException(status_code=404, detail=f"Заказа с id {request.order_id} не найдено")
    
    product = await ProductRepository.get_by_id(conn, request.product_id)
    if not product:
        raise HTTPException(status_code=404, detail=f"Продукта с id {request.product_id} не найдено")
    
    if product.quantity < request.quantity:
        raise HTTPException(
            status_code=400,
            detail=f"Не хватает на складе. Доступно: {product.quantity}, запрашиваете: {request.quantity}"
        )
    
    existing_item = await OrderItemRepository.get_by_order_and_product(
        conn, request.order_id, request.product_id
    )
    
    async with conn.transaction():
        if existing_item:
            new_quantity = existing_item.quantity + request.quantity
            
            if product.quantity < new_quantity:
                raise HTTPException(
                    status_code=400,
                    detail=f"Не хватает на складе. Доступно: {product.quantity}, запрашиваете: {new_quantity}"
                )
            
            await OrderItemRepository.update_quantity(conn, existing_item.id, new_quantity)
            await ProductRepository.decrease_quantity(conn, request.product_id, request.quantity)
            
            return {
                "message": "Количество обновлено в заказе",
                "order_id": request.order_id,
                "product_id": request.product_id,
                "new_quantity": new_quantity,
                "added_quantity": request.quantity
            }
        else:
            await OrderItemRepository.create(conn, request.order_id, request.product_id, request.quantity)
            await ProductRepository.decrease_quantity(conn, request.product_id, request.quantity)
            
            return {
                "message": "Заказ создан",
                "order_id": request.order_id,
                "product_id": request.product_id,
                "quantity": request.quantity
            }
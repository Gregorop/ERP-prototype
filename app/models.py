from pydantic import BaseModel, Field

class AddItemRequest(BaseModel):
    order_id: int
    product_id: int
    quantity: int = Field(gt=0, description="Количество должно быть больше 0")

class Order(BaseModel):
    id: int

class Product(BaseModel):
    id: int
    quantity: int
    name: str

class OrderItem(BaseModel):
    id: int
    order_id: int
    product_id: int
    quantity: int
from fastapi import FastAPI
from endpoints import router as orders_router

app = FastAPI(title="Order Service")

app.include_router(orders_router)

@app.get("/api/health")
async def health_check():
    return {"status": "ok"}
from archimedic.config import settings
from fastapi import FastAPI

app = FastAPI(
    title=f"{settings.PROJECT_NAME} app",
    openapi_url=f"{settings.API_V1_STR}/openapi.json",
)


@app.get("/")
def read_main() -> dict[str, str]:
    return {"message": f"{settings.PROJECT_NAME} is live"}

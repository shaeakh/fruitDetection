from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.responses import JSONResponse
from starlette.status import HTTP_400_BAD_REQUEST, HTTP_415_UNSUPPORTED_MEDIA_TYPE
from app.schema.Fruit import Fruit

app = FastAPI()

@app.post("/fruitName", response_model=Fruit)
async def get_fruit_name(file: UploadFile = File(...)):
    if file.content_type not in ["image/jpeg", "image/png", "image/jpg"]:
        raise HTTPException(
            status_code=HTTP_415_UNSUPPORTED_MEDIA_TYPE,
            detail="Only .jpg and .png files are supported."
        )

    try:
        contents = await file.read()

        # Your model inference logic here
        fruit_name = "apple"  # Mocked

        return {"name": fruit_name}

    except Exception as e:
        raise HTTPException(
            status_code=HTTP_400_BAD_REQUEST,
            detail=f"Something went wrong: {str(e)}"
        )

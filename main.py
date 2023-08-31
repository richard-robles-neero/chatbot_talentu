from fastapi import FastAPI, Response
from fastapi.responses import JSONResponse

app = FastAPI()

@app.get("/", response_class=JSONResponse)
def read_root(response: Response):
    return {
            "action": "reply",
            "replies": ["¡Hola! Soy Nestlé, te doy la bienvenida 🤗¿En qué puedo ayudarte?"],
            "suggestions": [
                "Quiero registrarme",
                "Publicar mis memorias"
            ]
        }
from fastapi import FastAPI, Response

app = FastAPI()

@app.get("/")
def read_root(response: Response):
    return {
            "action": "reply",
            "replies": ["¡Hola! Soy Nestlé, te doy la bienvenida 🤗¿En qué puedo ayudarte?"],
            "suggestions": [
                "Quiero registrarme",
                "Publicar mis memorias"
            ]
        }
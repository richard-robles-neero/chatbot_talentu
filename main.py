from fastapi import FastAPI, Response

app = FastAPI()

@app.get("/")
def read_root(response: Response):
    response.headers["ngrok-skip-browser-warning"] = "1"
    return {"Hello": "World"}
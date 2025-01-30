import requests
from fastapi import FastAPI, Response, HTTPException

app = FastAPI()

@app.get('/')
def home():
    return {"Chat": "Bot"}

@app.get('/ask')
def ask(prompt: str):
    try:
        # Send a request to Ollama API
        res = requests.post('http://ollama:11434/api/generate', json={
            "prompt": prompt,
            "stream": False,
            "model": "llama3"
        })

        # Check if the response is successful
        res.raise_for_status()

        # Return the response content as JSON
        return Response(content=res.text, media_type="application/json")

    except requests.exceptions.RequestException as e:
        # Return an error response if something goes wrong
        raise HTTPException(status_code=500, detail=f"Error with Ollama API: {str(e)}")

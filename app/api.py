from fastapi import FastAPI
import subprocess

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Ollama FastAPI is running!"}

@app.post("/generate/")
def generate_text(prompt: str, model: str = "deepseek-r1:8b"):
    """Generate text using an Ollama model."""
    try:
        result = subprocess.run(["ollama", "run", model, prompt], 
                                capture_output=True, text=True, check=True)
        return {"response": result.stdout.strip()}
    except subprocess.CalledProcessError as e:
        return {"error": e.stderr}

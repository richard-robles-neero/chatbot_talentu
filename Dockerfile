# Use the official Python image as base
FROM python:3.11-slim

# Set the working directory to /app
WORKDIR /app

# Copy the pyproject.toml and poetry.lock files to the working directory
COPY pyproject.toml poetry.lock ./

# Install poetry and disable virtualenv creation
RUN pip install poetry
RUN poetry config virtualenvs.create false

# Install the dependencies with poetry
RUN poetry install --no-dev

# Copy the rest of the code to the working directory
COPY . .

# Expose the port 8000
EXPOSE 8000

# Run the app with uvicorn
CMD ["poetry", "run", "hypercorn", "main:app", "--bind", "0.0.0.0:8000", "--worker-class", "trio"]

# Use the official Python image as base
FROM python:3.11-slim

# Set the working directory to /app
WORKDIR /app

# Copy the pyproject.toml and poetry.lock files to the working directory
COPY pyproject.toml ./

# Install poetry and disable virtualenv creation
RUN pip install poetry
RUN poetry config virtualenvs.create false

# Install the dependencies with poetry
RUN poetry install

# Copy the rest of the code to the working directory
COPY . .

EXPOSE 8000

# Define environment variable for Hypercorn bind address
ENV HYPERCORN_BIND=127.0.0.1:8000

# Run Hypercorn when the container launches
CMD ["hypercorn", "main:app", "--bind", "$HYPERCORN_BIND"]

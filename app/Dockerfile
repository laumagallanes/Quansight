
# app/Dockerfile

FROM python:3.10-slim

WORKDIR /app

COPY . ./

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

# Define environment variable
ENV NAME World

#WORKDIR /app

# Run app.py when the container launches
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]



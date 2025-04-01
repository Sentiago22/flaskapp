# Stage 1: Build stage
FROM python:3.9-alpine as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Final image
FROM python:3.9-alpine
WORKDIR /app
COPY --from=builder /app /app
COPY app.py app.py
EXPOSE 5000
CMD ["python', 'app.py"]

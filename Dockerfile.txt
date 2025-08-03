# Gunakan image dasar yang mendukung OCR dan zip
FROM python:3.11-slim

# Install dependencies sistem yang dibutuhkan OCR, ZIP, dan tesseract
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libtesseract-dev \
    poppler-utils \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set direktori kerja
WORKDIR /app

# Salin semua file ke container
COPY . .

# Install dependencies Python
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 10000 (sesuai kebutuhan Render)
EXPOSE 10000

# Jalankan aplikasi FastAPI menggunakan uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

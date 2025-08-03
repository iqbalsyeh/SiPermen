# Gunakan image dasar
FROM python:3.11-slim

# Install dependencies sistem
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

# Buat start.sh bisa dieksekusi
RUN chmod +x start.sh

# Install dependencies Python
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 10000
EXPOSE 10000

# Jalankan aplikasi melalui script start.sh
CMD ["./start.sh"]

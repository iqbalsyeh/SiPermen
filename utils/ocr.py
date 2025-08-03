# utils/ocr.py
from pdf2image import convert_from_path

import os
import fitz  # PyMuPDF
import pytesseract
from PIL import Image


def ocr_pdf_to_text(pdf_path: str, output_dir: str = "hasil_teks") -> str:
        
    images = convert_from_path(pdf_path)
    text = ""
    for img in images:
        gray = img.convert("L")
        text += pytesseract.image_to_string(gray, lang="ind") + "\n"

    # Simpan hasil ke .txt
    os.makedirs(output_dir, exist_ok=True)
    nama_file = os.path.basename(pdf_path).replace(".pdf", ".txt")
    with open(os.path.join(output_dir, nama_file), "w", encoding="utf-8") as f:
        f.write(text)

    return text

   


import os
import re
from PyPDF2 import PdfReader

# Initialize an empty list to store folio numbers
folio = []

# Define the patterns to match folio numbers
patterns = r'Folio No.\s*([\d\s/]+)'
patterns1 = r'(?:page|\d+) Folio\s*No\.\s*(\d{8,10}\s*/\s*\d{1,3})'

# Check if the PDF file exists
if os.path.exists(pdf_file_path):
    # Create a PdfReader object
    reader = PdfReader(pdf_file_path)
    
    # Extract text from the first page
    page = reader.pages[0]
    text = page.extract_text()
    
    # Extract folio numbers using the first pattern
    numbers = re.findall(patterns, text)
    
    if len(numbers) == 0:
        # If no folio numbers are found, use the second pattern
        folio1 = re.findall(patterns1, text)
        folio.append(folio1)
    else:
        folio.append(numbers)

# Example output
print(folio)

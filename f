
import os
import re
import shutil
import pandas as pd
from PyPDF2 import PdfReader

# Example variables (ensure these are defined appropriately in your actual code)
# pdf_file = 'path_to_pdf_directory'
# output_folder = 'path_to_output_directory'
# csv_path = 'path_to_csv_file.csv'
# df = pd.DataFrame()  # Replace with your actual DataFrame
# folio11 = []
# company_name = 'Example Company Name'

# Check if DataFrame has more than 2 columns
if df.shape[1] > 2:

    # Iterate through files in the pdf_file directory
    for n in os.listdir(pdf_file):
        pdf_path = os.path.join(pdf_file, n)

        # Check if the file is a PDF
        if pdf_path.endswith('.pdf') and os.path.exists(pdf_path):
            reader = PdfReader(pdf_path)
            page = reader.pages[0]
            text = page.extract_text()

            # Extract folio numbers using regex
            pattern = r'--\d{4}Folio\d{6} / \d{2}'  # Example pattern; adjust as needed
            folio_numbers = re.findall(pattern, text)

            # If folio numbers are found, append to the list
            if folio_numbers:
                folio11.append(folio_numbers)

    # Create Final DataFrame columns
    df.columns = ['Date', 'Amount (INR)', 'NAV (INR)', 'Price (INR)', 'Units', 'Balance']
    
    # Add Company Name and Folio Number columns
    df['Company Name'] = pd.Series([company_name] * len(df), index=df.index)
    df['Folio Number'] = pd.Series([folio11[0][0]] * len(df), index=df.index)

    # Save DataFrame to a CSV file
    df.to_csv(csv_path, index=False)

    # Move PDF file to a new folder based on the Excel file path
    new_folder = os.path.join(output_folder, "processed_pdfs")
    if not os.path.exists(new_folder):
        os.makedirs(new_folder)

    # Ensure 'n' is a string (name of the current file)
    new_pdf_path = os.path.join(new_folder, f"{os.path.splitext(n)[0]}.pdf")
    shutil.move(pdf_path, new_pdf_path)

    print(f"Moved PDF file to: {new_pdf_path}")














import os
import re
import shutil

# Directory containing the PDF files
directory = "/path/to/your/pdf_directory"

# Destination directory where renamed files will be copied
destination_directory = "/path/to/your/destination_directory"

# Ensure the destination directory exists
os.makedirs(destination_directory, exist_ok=True)

# Loop through all files in the directory
for filename in os.listdir(directory):
    # Check if the file is a PDF
    if filename.endswith(".pdf"):
        # Extract digits from the filename
        match = re.search(r'\b(\d{10})\b', filename)
        if match:
            # Extracted digit
            digit = match.group(1)
            
            # Construct the new file name
            new_filename = f"{digit}.pdf"
            
            # Define full file paths
            old_file_path = os.path.join(directory, filename)
            new_file_path = os.path.join(destination_directory, new_filename)
            
            # Copy and rename the file
            shutil.copy(old_file_path, new_file_path)
            print(f"Copied and renamed: {filename} -> {new_filename}")













import re

# Sample text
text = """
Folio Number : 1017662402 / 0Nominee
Folio Number : 1012365477 / 12
Folio Number : 9874563210
"""

# Regular expression pattern to match folio numbers
pattern = r'Folio Number\s*:\s*(\d+(?:\s*/\s*\d+)?)'

# Extracting folio numbers
folio_numbers = re.findall(pattern, text)

# Print the extracted folio numbers
print(folio_numbers)









import re

# Sample text
text = """
Folio Number : 1017662402 / 0Nominee
Folio Number : 1012365477 / 12
"""

# Regular expression pattern to match folio numbers
pattern = r'Folio Number\s*:\s*(\d+\s*/\s*\d+)'

# Extracting folio numbers
folio_numbers = re.findall(pattern, text)

# Print the extracted folio numbers
print(folio_numbers)

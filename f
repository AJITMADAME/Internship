
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

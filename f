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

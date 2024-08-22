import re

def extract_folio_number(text):
    # Define multiple regex patterns to match various formats of the folio number
    patterns = [
        r'Folio Number:\s*(\d{8,10}(?:\s*/\s*\d{1,3})?)',  # Matches 1017662402 or 1017662402 / 12 or 1017662402 / 23
        r'Folio Number:\s*(\d+ / \S+|\d+)'                 # Matches 1017662402 or 1017662402 / some text
    ]
    
    # Try each pattern in order
    for pattern in patterns:
        match = re.search(pattern, text)
        if match:
            # Extract the folio number if a match is found
            return match.group(1)
    
    # If no patterns match, return None
    return None

# Example usage
text = """
ESCRO XXXXX000XX6395 / DBS BANK INDIA LTD / Nariman point / MumbaiEISC-DHRUNALM-16.9.0-16082
Chhattisgarh Wr Transmission Limited
ADANI HOUSE NR NITHAKHALI SIX
ROAD NAVRA AHMEDABAD
AHMEDABAD 380009
Gujarat, India
Email: sunilm.shah@adani.com
Mobile: Please provide Phone Res: N.ASecond Holder
Nominee 1Status: Body Corporate NON-TRANSFERABLE Mode of Holding Single
Third Holder
Contact Name: N/A N/A N/A: Not Applicable
Statement Date: 16-Aug-2024 Folio Number: 1017662402 / 12
Nominee 2: Not Applicable
Nominee 3: Not Applicable
PAN KYC FATCAPAN Verified /
Linked Status
1st Holder
2nd Holder
3rd Holder0000X90590
Not Applicable
Not ApplicableKYC Registered
Not Applicable
Not ApplicableAvailable
Not applicable
Not applicabley / Not Applicable
N/Not applicable
N/Not applicable
Q Search
"""

folio_number = extract_folio_number(text)
print(folio_number)

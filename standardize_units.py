import re

file_path = r'c:\Users\Ayush\OneDrive\Desktop\kmj\listings_preview.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Standardize all units to /Kg for prices and display
# Many are /Mnd, which is 40kg. I'll convert the text display only to /Kg 
# for consistency as requested.

# Replace /Mnd with /Kg and Maund with Kg where it makes sense
content = content.replace('/Mnd', '/Kg')
content = content.replace('/Maund', '/Kg')

# Standardize the button text and quantity displays
content = content.replace(' Kilos', ' Kg')
content = content.replace(' kilos', ' Kg')

# Ensure all <img> tags have crossorigin="anonymous" and proper class
# This regex will find img tags and ensure they have the standard classes/attributes
def fix_all_img_tags(match):
    tag = match.group(0)
    # Ensure src has quotes
    src_match = re.search(r'src=([^ >]+)', tag)
    if src_match:
        src = src_match.group(1).strip('"\'')
        tag = tag.replace(f'src={src_match.group(1)}', f'src="{src}"')
    
    # Ensure class
    if 'class="' not in tag:
        tag = tag.replace('<img ', '<img class="card-img-top crop-img" ')
    
    # Ensure crossorigin
    if 'crossorigin' not in tag:
        tag = tag.replace('<img ', '<img crossorigin="anonymous" ')
        
    return tag

content = re.sub(r'<img [^>]+>', fix_all_img_tags, content)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Standardized units to Kg and fixed <img> tag attributes.")

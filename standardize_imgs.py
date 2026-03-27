import re

file_path = r'c:\Users\Ayush\OneDrive\Desktop\kmj\listings_preview.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Fix hhttps typo
content = content.replace('hhttps://', 'https://')

# Regex to find img tags and fix them
def fix_img_tag(match):
    tag = match.group(0)
    
    # Extract existing attributes
    src_match = re.search(r'src=([^ >]+)', tag)
    alt_match = re.search(r'alt="([^"]*)"', tag)
    
    if src_match:
        src_val = src_match.group(1)
        # If alt is merged with src, split them
        if 'alt=' in src_val:
            parts = src_val.split('alt=')
            src_val = parts[0]
            if not alt_match:
                alt_text = parts[1].strip('"')
                alt_match = re.match(r'^[^"]*', alt_text) # placeholder for logic below
        
        # Clean src_val (remove quotes if they exist partially)
        src_val = src_val.strip('"\'')
        
        # Build new tag
        new_tag = '<img crossorigin="anonymous" class="card-img-top crop-img"'
        new_tag += f' src="{src_val}"'
        
        if alt_match:
            new_tag += f' alt="{alt_match.group(1)}"'
        else:
            # Try to infer alt from ID if possible or just use "Crop Image"
            id_match = re.search(r'id="([^"]*)"', tag)
            alt_text = id_match.group(1) if id_match else "Crop Image"
            new_tag += f' alt="{alt_text}"'
            
        new_tag += '>'
        return new_tag
    
    return tag

# This regex is a bit risky, let's try a more targeted one for the broken tags
# Fix tags like <img src=URLalt="ALT">
content = re.sub(r'<img src=([^ >]+)alt="([^"]+)">', r'<img crossorigin="anonymous" class="card-img-top crop-img" src="\1" alt="\2">', content)

# Fix tags like <img src=URL
content = re.sub(r'<img src=(https?://[^ >"]+)(?![^>]*alt=)', r'<img crossorigin="anonymous" class="card-img-top crop-img" src="\1" alt="Crop Image">', content)

# Fix double crossorigin or classes
content = content.replace('crossorigin="anonymous" crossorigin="anonymous"', 'crossorigin="anonymous"')
content = content.replace('class="card-img-top crop-img" class="card-img-top crop-img"', 'class="card-img-top crop-img"')

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Standardized all <img> tags.")

import re

file_path = r'c:\Users\Ayush\OneDrive\Desktop\kmj\listings_preview.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Fix cases like src=URLalt="ALT" or src=URL (missing quotes and merged attributes)
def fix_broken_img(match):
    full_tag = match.group(0)
    # Extract URL - it starts after src= and ends before alt= or space or >
    src_match = re.search(r'src=([^\s>]+)', full_tag)
    if not src_match:
        return full_tag
        
    url = src_match.group(1)
    
    # Check if alt is merged at the end of the URL
    alt_text = "Crop Image"
    if 'alt=' in url:
        parts = url.split('alt=')
        url = parts[0]
        alt_text = parts[1].strip('"\'')
    else:
        # Try to find alt separately in the tag
        alt_match = re.search(r'alt="([^"]*)"', full_tag)
        if alt_match:
            alt_text = alt_match.group(1)
            
    # Standardize the tag
    return f'<img crossorigin="anonymous" class="card-img-top crop-img" src="{url.strip()}" alt="{alt_text}">'

# Targeted regex for these broken img tags
content = re.sub(r'<img [^>]*src=[^>]+>', fix_broken_img, content)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Fixed merged alt tags and missing quotes in <img> tags.")

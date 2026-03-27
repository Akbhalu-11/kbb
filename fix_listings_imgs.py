import re

file_path = r'c:\Users\Ayush\OneDrive\Desktop\kmj\listings_preview.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Fix hhttps typo
content = content.replace('src="hhttps://', 'src="https://')

# 2. Fix missing quotes for yimg URLs and add standard classes/crossorigin
# Specifically look for src=https://up.yimg.com... and wrap in quotes if needed
def fix_img_tags(match):
    tag = match.group(0)
    # Extract src
    src_match = re.search(r'src=([^ >]+)', tag)
    if src_match:
        src = src_match.group(1)
        if not src.startswith('"') and not src.startswith("'"):
            tag = tag.replace(f'src={src}', f'src="{src}"')
    
    # Ensure classes
    if 'class="' not in tag:
        tag = tag.replace('<img ', '<img class="card-img-top crop-img" ')
    elif 'card-img-top' not in tag:
        tag = tag.replace('class="', 'class="card-img-top crop-img ')
        
    # Ensure crossorigin
    if 'crossorigin' not in tag:
        tag = tag.replace('<img ', '<img crossorigin="anonymous" ')
        
    return tag

content = re.sub(r'<img [^>]+>', fix_img_tags, content)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Successfully cleaned up <img> tags in listings_preview.html")

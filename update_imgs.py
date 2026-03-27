import os

file_path = r'c:\Users\Ayush\OneDrive\Desktop\kmj\listings_preview.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Using a simpler replacement approach to avoid complex regex
new_content = content.replace('class="card-img-top crop-img"', 'class="card-img-top crop-img" crossorigin="anonymous"')
# Fix any double occurrences if we already added it once manually
new_content = new_content.replace('crossorigin="anonymous" crossorigin="anonymous"', 'crossorigin="anonymous"')

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Successfully updated <img> tags in listings_preview.html")

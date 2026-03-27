import os

file_path = r'c:\Users\Ayush\OneDrive\Desktop\kmj\preview.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace any standard card-img-top that doesn't have crossorigin
new_content = content.replace('class="card-img-top"', 'class="card-img-top" crossorigin="anonymous"')
new_content = new_content.replace('crossorigin="anonymous" crossorigin="anonymous"', 'crossorigin="anonymous"')

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Successfully updated <img> tags in preview.html")

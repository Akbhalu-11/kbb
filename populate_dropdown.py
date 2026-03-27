import re

file_path = r'c:\Users\Ayush\OneDrive\Desktop\kmj\listings_preview.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Find all product names from the <h6> tags
product_names = re.findall(r'<h6 class="fw-bold mb-1">([^<]+)</h6>', content)
# Clean names (remove Hindi part if exists for the value)
unique_names = sorted(list(set([name.split('(')[0].strip() for name in product_names])))

# Generate the <option> tags
options_html = '\n'.join([f'                                <option value="{name}">{name}</option>' for name in unique_names])

# Replace the existing options in cropSelect
dropdown_pattern = r'<select class="form-select" id="cropSelect">.*?</select>'
new_dropdown = f'<select class="form-select" id="cropSelect">\n{options_html}\n                            </select>'

content = re.sub(dropdown_pattern, new_dropdown, content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"Added {len(unique_names)} products to the update dropdown.")

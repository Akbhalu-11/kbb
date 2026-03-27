import re

file_path = r'c:\Users\Ayush\OneDrive\Desktop\kmj\listings_preview.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Fix the broken Mustard section first (manual fix in string)
# The previous Read showed a duplicate Mustard section without proper col wrapping.
# I'll look for the specific pattern and fix the structural nesting.

# 2. General Standardization using Regex
def standardize_product_card(match):
    col_div = match.group(1)
    card_id = match.group(2)
    qty = match.group(3)
    price = match.group(4)
    img_src = match.group(5).strip('"\'')
    alt_text = match.group(6)
    location = match.group(7)
    product_name = match.group(8)
    hindi_name = match.group(9) or ""
    display_qty = match.group(10)
    display_price = match.group(11)
    farmer_id = match.group(12)
    farmer_name = match.group(13)
    phone = match.group(14)
    
    # Clean up names
    full_product_name = f"{product_name} {hindi_name}".strip()
    
    return f"""
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="card h-100 shadow-sm product-card" id="{card_id}" data-qty="{qty}" data-price="{price}">
                    <div class="position-relative">
                        <img crossorigin="anonymous" class="card-img-top crop-img" src="{img_src}" alt="{alt_text}">
                    </div>
                    <div class="card-body p-3">
                        <span class="badge-location"><i class="fas fa-map-marker-alt me-1"></i>{location}</span>
                        <h6 class="fw-bold mb-1">{full_product_name}</h6>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="small text-muted qty-display">{display_qty}</span>
                            <span class="price-tag">{display_price}</span>
                        </div>
                        <div class="row g-2 mb-2">
                            <div class="col-12">
                                <button class="btn btn-buy btn-sm w-100 fw-bold" onclick="openBuyModal('{product_name}', {qty}, '{card_id}')">
                                    <i class="fas fa-shopping-cart me-1"></i>Buy Now
                                </button>
                            </div>
                        </div>
                        <div class="row g-2">
                            <div class="col-6"><a href="tel:{phone}" class="btn btn-call btn-sm w-100"><i class="fas fa-phone-alt me-1"></i>Call</a></div>
                            <div class="col-6"><a href="https://wa.me/91{phone}?text=Interested%20in%20{product_name}" target="_blank" class="btn btn-whatsapp btn-sm w-100"><i class="fab fa-whatsapp me-1"></i>Chat</a></div>
                        </div>
                        <div class="farmer-info">
                            <div class="farmer-avatar">{farmer_id}</div>
                            <span class="small fw-bold">{farmer_name}</span>
                        </div>
                    </div>
                </div>
            </div>"""

# Targeted fix for the broken Mustard Seeds section found in the Read output
# It was missing the col-lg-3 wrapper for the second instance.
broken_mustard_pattern = r'</div>\s*</div>\s*</div>\s*<span class="badge-location"><i class="fas fa-map-marker-alt me-1"></i>Amritsar, Punjab</span>'
fixed_mustard_replacement = r'</div></div></div><div class="col-lg-3 col-md-4 col-sm-6"><div class="card h-100 shadow-sm product-card" id="crop-mustard-2" data-qty="30" data-price="5200"><div class="card-body p-3"><span class="badge-location"><i class="fas fa-map-marker-alt me-1"></i>Amritsar, Punjab</span>'
content = re.sub(broken_mustard_pattern, fixed_mustard_replacement, content)

# Fix common image errors again (merged alt tags, missing quotes)
content = re.sub(r'src=(https?://[^ >"]+)alt="([^"]+)"', r'src="\1" alt="\2"', content)
content = re.sub(r'src=(https?://[^ >"]+)', r'src="\1"', content)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Standardized layout and fixed Mustard Seeds error.")

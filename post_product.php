<?php 
include 'includes/header.php'; 
include 'includes/db.php';

$message = "";

// Handle Rate Update
if (isset($_POST['update_rate'])) {
    $product_id = (int)$_POST['product_id'];
    $new_price = (float)$_POST['new_price'];
    $sql = "UPDATE products SET price = '$new_price' WHERE id = '$product_id'";
    if ($conn->query($sql) === TRUE) {
        $message = "Price updated successfully!";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['post_crop'])) {
    $farmer_id = 1; // Assuming for now, in real app would be from session
    $product_name = $conn->real_escape_string($_POST['product_name']);
    $category = $conn->real_escape_string($_POST['category']);
    $quantity = (float)$_POST['quantity'];
    $unit = $conn->real_escape_string($_POST['unit']);
    $price = (float)$_POST['price'];
    $description = $conn->real_escape_string($_POST['description']);
    
    // Image Upload logic
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        $sql = "INSERT INTO products (farmer_id, product_name, category, quantity, unit, price, image_path, description) 
                VALUES ('$farmer_id', '$product_name', '$category', '$quantity', '$unit', '$price', '$target_file', '$description')";
        
        if ($conn->query($sql) === TRUE) {
            $message = "Product posted successfully!";
        } else {
            $message = "Error: " . $conn->error;
        }
    } else {
        $message = "Sorry, there was an error uploading your file.";
    }
}
?>

<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4 p-md-5">
                    <h2 class="section-title mb-4">Post Your Crop (फसल की जानकारी डालें)</h2>
                    
                    <?php if($message): ?>
                        <div class="alert alert-info alert-dismissible fade show" role="alert">
                            <?php echo $message; ?>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <?php endif; ?>

                    <form action="post_product.php" method="POST" enctype="multipart/form-data">
                        <div class="mb-4">
                            <label class="form-label fw-bold">Product Name (फसल का नाम)</label>
                            <input type="text" name="product_name" class="form-control form-control-lg" placeholder="Wheat, Rice, Tomato, etc." required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold">Category (श्रेणी)</label>
                            <select name="category" class="form-select form-select-lg" required>
                                <option value="grains">Grains (अनाज)</option>
                                <option value="pulses">Pulses (दालें)</option>
                                <option value="vegetables">Vegetables (सब्जियां)</option>
                                <option value="fruits">Fruits (फल)</option>
                            </select>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <label class="form-label fw-bold">Quantity (मात्रा)</label>
                                <div class="input-group">
                                    <input type="number" name="quantity" class="form-control form-control-lg" placeholder="0.00" step="0.01" required>
                                    <select name="unit" class="form-select">
                                        <option value="kilos">Kilos</option>
                                        <option value="maunds">Maunds</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="form-label fw-bold">Expected Price (अनुमानित कीमत)</label>
                                <div class="input-group">
                                    <span class="input-group-text">₹</span>
                                    <input type="number" name="price" class="form-control form-control-lg" placeholder="Per Unit Price" step="0.01" required>
                                </div>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold">Upload Photo (फोटो अपलोड करें)</label>
                            <input type="file" name="image" class="form-control form-control-lg" accept="image/*" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold">Description (विवरण)</label>
                            <textarea name="description" class="form-control form-control-lg" rows="3" placeholder="Tell about the quality, variety, etc."></textarea>
                        </div>
                        <div class="d-grid mt-5">
                            <button type="submit" name="post_crop" class="btn btn-green btn-lg py-3 fw-bold">Post Crop (फसल पोस्ट करें)</button>
                        </div>
                    </form>
                </div>

                <!-- Manage Existing Products Section -->
                <div class="card p-4 p-md-5 mt-5 border border-warning shadow-sm">
                    <h2 class="section-title mb-4">Update Rates (कीमत बदलें)</h2>
                    <p class="text-muted mb-4">Update the price of your already listed crops.</p>
                    
                    <?php
                    // For demo purposes, fetching all products. In real app, only for the logged-in farmer.
                    $farmer_id = 1;
                    $my_products = $conn->query("SELECT * FROM products WHERE farmer_id = '$farmer_id' ORDER BY created_at DESC");
                    if ($my_products->num_rows > 0):
                        while($row = $my_products->fetch_assoc()):
                    ?>
                    <form action="post_product.php" method="POST" class="row align-items-center bg-light p-3 rounded mb-3">
                        <input type="hidden" name="product_id" value="<?php echo $row['id']; ?>">
                        <div class="col-md-6 mb-2 mb-md-0">
                            <h6 class="fw-bold mb-0"><?php echo $row['product_name']; ?></h6>
                            <small class="text-muted"><?php echo $row['quantity'] . " " . $row['unit']; ?> listed</small>
                        </div>
                        <div class="col-md-3 mb-2 mb-md-0">
                            <div class="input-group input-group-sm">
                                <span class="input-group-text">₹</span>
                                <input type="number" name="new_price" class="form-control" value="<?php echo $row['price']; ?>" step="0.01">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" name="update_rate" class="btn btn-warning btn-sm w-100 fw-bold">Update Price</button>
                        </div>
                    </form>
                    <?php endwhile; else: ?>
                        <p class="text-center py-3">No products posted yet.</p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include 'includes/footer.php'; ?>

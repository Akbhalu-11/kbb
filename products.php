<?php 
include 'includes/header.php'; 
include 'includes/db.php';

$category = isset($_GET['cat']) ? $conn->real_escape_string($_GET['cat']) : "";
$sql = "SELECT p.*, f.name as farmer_name, f.phone as farmer_phone, f.location as farmer_location 
        FROM products p 
        JOIN farmers f ON p.farmer_id = f.id";

if($category) {
    $sql .= " WHERE p.category = '$category'";
}

$sql .= " ORDER BY p.created_at DESC";
$result = $conn->query($sql);
?>

<section class="py-5 bg-light">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-5">
            <h2 class="section-title">Available Crops (उपलब्ध फसलें)</h2>
            <div class="dropdown">
                <button class="btn btn-outline-success dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    Filter by Category
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="products.php">All</a></li>
                    <li><a class="dropdown-item" href="products.php?cat=grains">Grains (अनाज)</a></li>
                    <li><a class="dropdown-item" href="products.php?cat=pulses">Pulses (दालें)</a></li>
                    <li><a class="dropdown-item" href="products.php?cat=vegetables">Vegetables (सब्जियां)</a></li>
                    <li><a class="dropdown-item" href="products.php?cat=fruits">Fruits (फल)</a></li>
                </ul>
            </div>
        </div>

        <div class="row g-4">
            <?php if ($result && $result->num_rows > 0): ?>
                <?php while($row = $result->fetch_assoc()): ?>
                    <div class="col-md-4 col-sm-6">
                        <div class="card h-100 overflow-hidden shadow-sm">
                            <img src="<?php echo $row['image_path'] ? $row['image_path'] : 'https://via.placeholder.com/300x200?text=Crop+Image'; ?>" class="card-img-top" alt="<?php echo $row['product_name']; ?>" style="height: 200px; object-fit: cover;">
                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-2">
                                    <h5 class="card-title fw-bold text-success"><?php echo $row['product_name']; ?></h5>
                                    <span class="badge bg-light text-success border border-success"><?php echo ucfirst($row['category']); ?></span>
                                </div>
                                <p class="card-text text-muted mb-3"><i class="fas fa-map-marker-alt me-2"></i><?php echo $row['farmer_location']; ?></p>
                                
                                <div class="row g-2 mb-3 bg-light p-2 rounded">
                                    <div class="col-6">
                                        <small class="text-muted d-block">Quantity</small>
                                        <span class="fw-bold"><?php echo $row['quantity'] . " " . $row['unit']; ?></span>
                                    </div>
                                    <div class="col-6 text-end">
                                        <small class="text-muted d-block">Expected Price</small>
                                        <span class="fw-bold text-danger">₹<?php echo $row['price']; ?> / <?php echo $row['unit']; ?></span>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center mb-4">
                                    <div class="flex-shrink-0">
                                        <div class="bg-success text-white rounded-circle p-2 d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                                            <i class="fas fa-user"></i>
                                        </div>
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <small class="text-muted d-block">Farmer</small>
                                        <span class="fw-bold"><?php echo $row['farmer_name']; ?></span>
                                    </div>
                                </div>

                                <div class="row g-2">
                                    <div class="col-6">
                                        <a href="tel:<?php echo $row['farmer_phone']; ?>" class="btn btn-success w-100 py-2">
                                            <i class="fas fa-phone-alt me-2"></i>Call
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="https://wa.me/<?php echo $row['farmer_phone']; ?>" class="btn btn-outline-success w-100 py-2">
                                            <i class="fab fa-whatsapp me-2"></i>Chat
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <div class="col-12 text-center py-5">
                    <i class="fas fa-search fa-4x text-muted mb-3"></i>
                    <p class="lead">No crops found. Be the first to post!</p>
                    <a href="post_product.php" class="btn btn-green mt-3">Post Now</a>
                </div>
            <?php endif; ?>
        </div>
    </div>
</section>

<?php include 'includes/footer.php'; ?>

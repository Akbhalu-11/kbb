<?php include 'includes/header.php'; ?>

<!-- Hero Section -->
<section class="py-5 text-center bg-white" style="background-image: linear-gradient(rgba(46, 125, 50, 0.1), rgba(46, 125, 50, 0.1));">
    <div class="container py-lg-5">
        <h1 class="display-4 fw-bold mb-3 text-success">Welcome to Kisan Bazaar</h1>
        <p class="lead mb-4 mx-auto" style="max-width: 700px;">Directly connecting hard-working farmers with traders and customers. Fair prices, fresh products, and easy communication.</p>
        <div class="d-flex justify-content-center gap-3">
            <a href="post_product.php" class="btn btn-green btn-lg"><i class="fas fa-plus me-2"></i>Post Your Crop</a>
            <a href="products.php" class="btn btn-outline-success btn-lg"><i class="fas fa-search me-2"></i>Find Crops</a>
        </div>
    </div>
</section>

<!-- Category Navigation -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="section-title">Categories</h2>
        <div class="row g-4 mt-4 text-center">
            <div class="col-6 col-md-3">
                <a href="products.php?cat=grains" class="text-decoration-none text-dark">
                    <div class="card p-4">
                        <i class="fas fa-wheat-awn category-icon"></i>
                        <h5 class="fw-bold">Grains</h5>
                    </div>
                </a>
            </div>
            <div class="col-6 col-md-3">
                <a href="products.php?cat=pulses" class="text-decoration-none text-dark">
                    <div class="card p-4">
                        <i class="fas fa-seedling category-icon"></i>
                        <h5 class="fw-bold">Pulses</h5>
                    </div>
                </a>
            </div>
            <div class="col-6 col-md-3">
                <a href="products.php?cat=vegetables" class="text-decoration-none text-dark">
                    <div class="card p-4">
                        <i class="fas fa-carrot category-icon"></i>
                        <h5 class="fw-bold">Vegetables</h5>
                    </div>
                </a>
            </div>
            <div class="col-6 col-md-3">
                <a href="products.php?cat=fruits" class="text-decoration-none text-dark">
                    <div class="card p-4">
                        <i class="fas fa-apple-whole category-icon"></i>
                        <h5 class="fw-bold">Fruits</h5>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Farmer Centric Action Buttons -->
<section class="py-5">
    <div class="container text-center">
        <h2 class="section-title">Get Started Quickly</h2>
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <a href="farmer_profile.php" class="btn btn-success btn-farmer rounded-pill shadow">
                    <i class="fas fa-user-circle fa-2x"></i>
                    <span>Fill Farmer Details (किसान प्रोफाइल भरें)</span>
                </a>
                <a href="post_product.php" class="btn btn-primary btn-farmer rounded-pill shadow" style="background-color: #0d6efd;">
                    <i class="fas fa-camera fa-2x"></i>
                    <span>Post Photo of Crop (फसल का फोटो डालें)</span>
                </a>
                <a href="products.php" class="btn btn-warning btn-farmer rounded-pill shadow text-dark">
                    <i class="fas fa-list fa-2x"></i>
                    <span>See All Listings (सभी फसलें देखें)</span>
                </a>
            </div>
        </div>
    </div>
</section>

<?php include 'includes/footer.php'; ?>

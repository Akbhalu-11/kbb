<?php 
include 'includes/header.php'; 
include 'includes/db.php';

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $conn->real_escape_string($_POST['name']);
    $phone = $conn->real_escape_string($_POST['phone']);
    $location = $conn->real_escape_string($_POST['location']);
    $crops = $conn->real_escape_string($_POST['crops']);

    $sql = "INSERT INTO farmers (name, phone, location, crops_grown) VALUES ('$name', '$phone', '$location', '$crops')";
    
    if ($conn->query($sql) === TRUE) {
        $message = "Profile saved successfully!";
    } else {
        $message = "Error: " . $conn->error;
    }
}
?>

<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4 p-md-5">
                    <h2 class="section-title mb-4">Farmer Profile (किसान की जानकारी)</h2>
                    
                    <?php if($message): ?>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <?php echo $message; ?>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <?php endif; ?>

                    <form action="farmer_profile.php" method="POST">
                        <div class="mb-4">
                            <label class="form-label fw-bold"><i class="fas fa-user me-2"></i>Full Name (पूरा नाम)</label>
                            <input type="text" name="name" class="form-control form-control-lg" placeholder="Enter your name" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold"><i class="fas fa-phone me-2"></i>Phone Number (फ़ोन नंबर)</label>
                            <input type="tel" name="phone" class="form-control form-control-lg" placeholder="10-digit phone number" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold"><i class="fas fa-map-marker-alt me-2"></i>Detailed Farm Location & Address (खेत का पूरा पता)</label>
                            <input type="text" name="location" class="form-control form-control-lg" placeholder="Village, Tehsil, District, State" required>
                            <small class="text-muted">Buyers use this to find crops near them.</small>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold"><i class="fas fa-seedling me-2"></i>Crops You Grow (जो फसलें आप उगाते हैं)</label>
                            <textarea name="crops" class="form-control form-control-lg" rows="3" placeholder="Wheat, Rice, Cotton, etc."></textarea>
                        </div>
                        <div class="d-grid mt-5">
                            <button type="submit" class="btn btn-green btn-lg py-3 fw-bold">Save Profile (प्रोफ़ाइल सुरक्षित करें)</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include 'includes/footer.php'; ?>

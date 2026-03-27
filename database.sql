CREATE DATABASE IF NOT EXISTS kisan_bazaar;
USE kisan_bazaar;

-- Table for Farmer Profiles
CREATE TABLE IF NOT EXISTS farmers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    location VARCHAR(255) NOT NULL,
    crops_grown TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Product Listings
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_id INT,
    product_name VARCHAR(255) NOT NULL,
    category ENUM('grains', 'pulses', 'vegetables', 'fruits') NOT NULL,
    quantity DECIMAL(10,2) NOT NULL,
    unit ENUM('kilos', 'maunds') DEFAULT 'kilos',
    price DECIMAL(10,2) NOT NULL,
    image_path VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (farmer_id) REFERENCES farmers(id) ON DELETE CASCADE
);

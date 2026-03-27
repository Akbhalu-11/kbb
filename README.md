# Kisan Bazaar (किसान बाज़ार)

A simple and accessible web application connecting farmers directly with traders and customers.

## Features

-   **Farmer Profile**: Farmers can register their details, location, and crops they grow.
-   **Product Listing**: Farmers can post photos, quantities (in maunds or kilos), and expected prices for their crops.
-   **Direct Call/Chat**: Integrated buttons for direct calling or WhatsApp chat with the farmer.
-   **Categories**: Organized sections for Grains, Pulses, Vegetables, and Fruits.
-   **Accessible Design**: Large buttons and clear icons for easy navigation by all users.

## Tech Stack

-   **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5.3
-   **Backend**: PHP
-   **Database**: MySQL

## Setup Instructions

1.  **Database Configuration**:
    -   Create a database named `kisan_bazaar` in your MySQL server.
    -   Import the `database.sql` file to create the tables.
    -   (Optional) Import `seed_data.sql` to add sample listings.
    -   Update `includes/db.php` with your MySQL host, username, and password.

2.  **Web Server**:
    -   Place the project files in your web server's root directory (e.g., `htdocs` for XAMPP).
    -   Ensure that the `uploads/` directory is writable for image uploads.

3.  **Run**:
    -   Access the website via `http://localhost/kmj/index.php`.

## Accessibility (सुलभता)

The website is designed with simplicity in mind, using:
-   **Large Buttons (बड़े बटन)**: Easy to tap on mobile screens.
-   **Bilingual Labels (दोभाषी लेबल)**: Both English and Hindi text for better understanding.
-   **Visual Icons (दृश्य प्रतीक)**: Intuitive icons for categories and actions.

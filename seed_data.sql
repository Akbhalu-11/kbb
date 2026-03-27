-- Clear existing sample data to re-insert comprehensive list
DELETE FROM products;
DELETE FROM farmers;

-- Insert a comprehensive list of farmers with detailed locations across India
INSERT INTO farmers (id, name, phone, location, crops_grown) VALUES 
(1, 'Ramesh Patel', '9876543210', 'Mehsana, Gujarat (Near Highway, Village Balisana)', 'Wheat, Cumin, Castor'),
(2, 'Suresh Kumar', '9123456789', 'Amritsar, Punjab (VPO Jallupur, Tehsil Baba Bakala)', 'Rice, Mustard, Potatoes'),
(3, 'Anita Devi', '9988776655', 'Nashik, Maharashtra (Pimpalgaon, Niphad Tehsil)', 'Onions, Grapes, Pomegranate, Raisins'),
(4, 'Harpreet Singh', '9872233445', 'Ludhiana, Punjab (Doraha Tehsil, Village Rampur)', 'Wheat, Potato, Chana Dal'),
(5, 'Mohan Lal', '9414455667', 'Nagaur, Rajasthan (Merta City, Village Ren)', 'Moong Dal, Bajra, Moth Beans'),
(6, 'Lakshmi Bai', '9001122334', 'Vijayawada, Andhra Pradesh (Kanchikacherla)', 'Chillies, Mangoes, Pineapple'),
(7, 'Arjun Reddy', '9988001122', 'Guntur, Andhra Pradesh (Tenali)', 'Cotton, Chillies, Banginapalli Mango'),
(8, 'Savita More', '9822334455', 'Ratnagiri, Maharashtra (Ganpatipule, Konkan Coast)', 'Alphonso Mango, Cashew'),
(9, 'Babu Rao', '9845612345', 'Mandya, Karnataka (Near Sugar Mill, Maddur Tehsil)', 'Sugarcane, Pulses, Coconut'),
(10, 'Sita Ram', '9456123789', 'Muzzafarpur, Bihar (Patahi, Near Airport Road)', 'Litchi, Bananas, Jackfruit'),
(11, 'Rajinder Singh', '9812345678', 'Karnal, Haryana (Sector 12)', 'Rice, Pulses, Kabuli Chana'),
(12, 'Meena Kumari', '9876541234', 'Jabalpur, MP (Bhedaghat Road)', 'Lentils, Fruits, Dragon Fruit'),
(13, 'Vijay Kumar', '9822113344', 'Shimla, HP (Kufri Valley)', 'Apples, Cherries, Strawberry, Almond'),
(14, 'Somesh Gupta', '9122334455', 'Nagpur, Maharashtra (Orange City)', 'Oranges, Mosambi, Lemon'),
(15, 'Karthik Raja', '9844001122', 'Ooty, Tamil Nadu (Coonoor Road)', 'Blueberry, Raspberry, Plum'),
(16, 'Abdul Khader', '9440055667', 'Kochi, Kerala (Fort Kochi Area)', 'Coconut, Pineapple, Passion Fruit'),
(17, 'Gopal Das', '9833001122', 'Indore, MP (Rajwada Market Area)', 'Soybean, Chickpeas, Dates');

-- Comprehensive GRAINS (अनाज)
INSERT INTO products (farmer_id, product_name, category, quantity, unit, price, image_path, description) VALUES 
(4, 'Sharbat Wheat (गेहूँ)', 'grains', 100, 'maunds', 2400, 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?auto=format&fit=crop&w=400&q=80', 'Premium Sharbat variety wheat.'),
(11, 'Basmati Rice (चावल)', 'grains', 50, 'maunds', 4500, 'https://images.unsplash.com/photo-1586201327693-86645f745bc4?auto=format&fit=crop&w=400&q=80', 'Long grain aromatic Basmati.'),
(2, 'Mustard Seeds (सरसों)', 'grains', 30, 'maunds', 5200, 'https://images.unsplash.com/photo-1508013861974-9f6347163835?auto=format&fit=crop&w=400&q=80', 'High oil content mustard.'),
(5, 'Bajra (Pearl Millet)', 'grains', 40, 'maunds', 1800, 'https://images.unsplash.com/photo-1599488615731-7e5c2823ff28?auto=format&fit=crop&w=400&q=80', 'Rajasthan special Bajra.');

-- Comprehensive PULSES (दालें)
INSERT INTO products (farmer_id, product_name, category, quantity, unit, price, image_path, description) VALUES 
(5, 'Toor Dal (Arhar Dal)', 'pulses', 25, 'maunds', 5500, 'https://images.unsplash.com/photo-1585996731181-307f99955c6a?auto=format&fit=crop&w=400&q=80', 'Premium quality Arhar dal.'),
(5, 'Moong Dal (Green Gram)', 'pulses', 20, 'maunds', 4500, 'https://images.unsplash.com/photo-1599488615731-7e5c2823ff28?auto=format&fit=crop&w=400&q=80', 'Naturally grown Moong dal.'),
(11, 'Urad Dal (Black Gram)', 'pulses', 15, 'maunds', 5000, 'https://images.unsplash.com/photo-1626132646529-5aa733fe089c?auto=format&fit=crop&w=400&q=80', 'Fresh black gram dal.'),
(12, 'Masoor Dal (Red Lentil)', 'pulses', 30, 'maunds', 4200, 'https://images.unsplash.com/photo-1545114197-230876737a4e?auto=format&fit=crop&w=400&q=80', 'High quality red lentils.'),
(4, 'Chana Dal (Split Bengal Gram)', 'pulses', 15, 'maunds', 3800, 'https://images.unsplash.com/photo-1515942400420-2b98fed1f515?auto=format&fit=crop&w=400&q=80', 'Freshly split chana dal.'),
(4, 'Whole Chana (Kala Chana)', 'pulses', 40, 'maunds', 3500, 'https://images.unsplash.com/photo-1626132646529-5aa733fe089c?auto=format&fit=crop&w=400&q=80', 'Desi Kala Chana.'),
(11, 'Kabuli Chana (Chickpeas)', 'pulses', 20, 'maunds', 6000, 'https://images.unsplash.com/photo-1515942400420-2b98fed1f515?auto=format&fit=crop&w=400&q=80', 'Large Kabuli chickpeas.'),
(13, 'Rajma (Kidney Beans)', 'pulses', 10, 'maunds', 7500, 'https://images.unsplash.com/photo-1626132646529-5aa733fe089c?auto=format&fit=crop&w=400&q=80', 'Mountain variety Rajma.'),
(9, 'Lobia (Black-eyed Peas)', 'pulses', 12, 'maunds', 4800, 'https://images.unsplash.com/photo-1515942400420-2b98fed1f515?auto=format&fit=crop&w=400&q=80', 'Nutritious Lobia.'),
(5, 'Moth Beans (Matki)', 'pulses', 18, 'maunds', 5200, 'https://images.unsplash.com/photo-1599488615731-7e5c2823ff28?auto=format&fit=crop&w=400&q=80', 'Rajasthan special Matki.'),
(9, 'Horse Gram (Kulthi)', 'pulses', 8, 'maunds', 3200, 'https://images.unsplash.com/photo-1515942400420-2b98fed1f515?auto=format&fit=crop&w=400&q=80', 'Traditional Kulthi dal.'),
(11, 'Dry Green Peas', 'pulses', 25, 'maunds', 2800, 'https://images.unsplash.com/photo-1515942400420-2b98fed1f515?auto=format&fit=crop&w=400&q=80', 'Dry green peas.'),
(17, 'Soybean', 'pulses', 100, 'maunds', 4000, 'https://images.unsplash.com/photo-1589927986089-35812388d1f4?auto=format&fit=crop&w=400&q=80', 'High protein soybean.'),
(5, 'Whole Moong', 'pulses', 20, 'maunds', 4200, 'https://images.unsplash.com/photo-1599488615731-7e5c2823ff28?auto=format&fit=crop&w=400&q=80', 'Unsplit whole green gram.'),
(11, 'Whole Urad', 'pulses', 15, 'maunds', 4800, 'https://images.unsplash.com/photo-1626132646529-5aa733fe089c?auto=format&fit=crop&w=400&q=80', 'Unsplit whole black gram.'),
(12, 'Whole Masoor', 'pulses', 30, 'maunds', 4000, 'https://images.unsplash.com/photo-1545114197-230876737a4e?auto=format&fit=crop&w=400&q=80', 'Unsplit whole red lentil.');

-- Comprehensive FRUITS (फल)
-- Common Fruits
INSERT INTO products (farmer_id, product_name, category, quantity, unit, price, image_path, description) VALUES 
(13, 'Apple (सेब)', 'fruits', 500, 'kilos', 120, 'https://images.unsplash.com/photo-1560806887-1e4cd0b6bcd6?auto=format&fit=crop&w=400&q=80', 'Kashmiri apples from Shimla.'),
(10, 'Banana (केला)', 'fruits', 100, 'kilos', 40, 'https://images.unsplash.com/photo-1571771894821-ad9902d83f4a?auto=format&fit=crop&w=400&q=80', 'Sweet local bananas.'),
(8, 'Mango (Alphonso)', 'fruits', 20, 'maunds', 12000, 'https://images.unsplash.com/photo-1553279768-865429fa0078?auto=format&fit=crop&w=400&q=80', 'Original Ratnagiri Hapus.'),
(14, 'Orange (संतरा)', 'fruits', 300, 'kilos', 50, 'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?auto=format&fit=crop&w=400&q=80', 'Nagpur oranges.'),
(3, 'Grapes (अंगूर)', 'fruits', 100, 'kilos', 65, 'https://images.unsplash.com/photo-1533616688419-b7a585564566?auto=format&fit=crop&w=400&q=80', 'Nashik black seedless grapes.'),
(16, 'Pineapple (अनानास)', 'fruits', 50, 'kilos', 45, 'https://images.unsplash.com/photo-1550258114-b864e4c35e1f?auto=format&fit=crop&w=400&q=80', 'Fresh Kerala pineapple.'),
(12, 'Papaya (पपीता)', 'fruits', 80, 'kilos', 30, 'https://images.unsplash.com/photo-1526318896980-cf78c088247c?auto=format&fit=crop&w=400&q=80', 'Naturally ripened sweet papaya.'),
(12, 'Guava (अमरूद)', 'fruits', 60, 'kilos', 35, 'https://images.unsplash.com/photo-1536511113277-e506660fc060?auto=format&fit=crop&w=400&q=80', 'Allahabadi Safeda guava.'),
(2, 'Watermelon (तरबूज)', 'fruits', 200, 'kilos', 15, 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?auto=format&fit=crop&w=400&q=80', 'Sweet summer watermelons.'),
(5, 'Muskmelon (खरबूजा)', 'fruits', 150, 'kilos', 25, 'https://images.unsplash.com/photo-1595475253512-19e07222f7b2?auto=format&fit=crop&w=400&q=80', 'Rajasthan sweet muskmelons.');

-- Berries
INSERT INTO products (farmer_id, product_name, category, quantity, unit, price, image_path, description) VALUES 
(13, 'Strawberry', 'fruits', 20, 'kilos', 250, 'https://images.unsplash.com/photo-1464960350423-9f8868599931?auto=format&fit=crop&w=400&q=80', 'Fresh Mahabaleshwar strawberries.'),
(15, 'Blueberry', 'fruits', 5, 'kilos', 800, 'https://images.unsplash.com/photo-1491924331743-424030a38215?auto=format&fit=crop&w=400&q=80', 'Fresh Nilgiri blueberries.'),
(15, 'Raspberry', 'fruits', 10, 'kilos', 400, 'https://images.unsplash.com/photo-1534713503371-25f9bd129c1e?auto=format&fit=crop&w=400&q=80', 'Fresh mountain raspberries.'),
(15, 'Blackberry', 'fruits', 10, 'kilos', 450, 'https://images.unsplash.com/photo-1433385414320-a29aa0d26467?auto=format&fit=crop&w=400&q=80', 'Wild mountain blackberries.'),
(13, 'Cranberry', 'fruits', 5, 'kilos', 900, 'https://images.unsplash.com/photo-1603570650390-1e5f0393282f?auto=format&fit=crop&w=400&q=80', 'Premium fresh cranberries.');

-- Citrus Fruits
INSERT INTO products (farmer_id, product_name, category, quantity, unit, price, image_path, description) VALUES 
(14, 'Lemon (नींबू)', 'fruits', 50, 'kilos', 60, 'https://images.unsplash.com/photo-1590505681144-28a6885e3e3b?auto=format&fit=crop&w=400&q=80', 'Juicy seedless lemons.'),
(14, 'Sweet Lime (Mosambi)', 'fruits', 150, 'kilos', 55, 'https://images.unsplash.com/photo-1611080626919-7cf5a9caab53?auto=format&fit=crop&w=400&q=80', 'Fresh Nagpur Mosambi.'),
(14, 'Tangerine', 'fruits', 100, 'kilos', 40, 'https://images.unsplash.com/photo-1557800636-894a64c1696f?auto=format&fit=crop&w=400&q=80', 'Sweet Kinnow tangerines.'),
(14, 'Grapefruit', 'fruits', 30, 'kilos', 120, 'https://images.unsplash.com/photo-1528825831134-406165a89461?auto=format&fit=crop&w=400&q=80', 'Pink grapefruit from MH.'),
(14, 'Lime', 'fruits', 40, 'kilos', 50, 'https://images.unsplash.com/photo-1591438670318-15932df2290a?auto=format&fit=crop&w=400&q=80', 'Small sour green limes.');

-- Tropical Fruits
INSERT INTO products (farmer_id, product_name, category, quantity, unit, price, image_path, description) VALUES 
(16, 'Coconut (नारियल)', 'fruits', 500, 'kilos', 30, 'https://images.unsplash.com/photo-1543233444-40547c6e64b8?auto=format&fit=crop&w=400&q=80', 'Fresh Kochi coconuts.'),
(3, 'Pomegranate (अनार)', 'fruits', 100, 'kilos', 110, 'https://images.unsplash.com/photo-1615485290382-441e4d049cb5?auto=format&fit=crop&w=400&q=80', 'Nashik red pomegranate.'),
(12, 'Sapota (Chikoo)', 'fruits', 70, 'kilos', 40, 'https://images.unsplash.com/photo-1590005354167-6da97870c921?auto=format&fit=crop&w=400&q=80', 'Dahanu special Chikoo.'),
(10, 'Jackfruit (कटहल)', 'fruits', 40, 'kilos', 35, 'https://images.unsplash.com/photo-1596560548464-f01068e3c917?auto=format&fit=crop&w=400&q=80', 'Large sweet jackfruit.'),
(10, 'Lychee (लीची)', 'fruits', 100, 'kilos', 160, 'https://images.unsplash.com/photo-1501746768113-00fe01e5cd4c?auto=format&fit=crop&w=400&q=80', 'Shahi Lychee from Muzaffarpur.'),
(12, 'Dragon Fruit', 'fruits', 30, 'kilos', 150, 'https://images.unsplash.com/photo-1527324688102-04687d14c8b3?auto=format&fit=crop&w=400&q=80', 'Organic dragon fruit.'),
(16, 'Passion Fruit', 'fruits', 20, 'kilos', 200, 'https://images.unsplash.com/photo-1534324402225-86f26477e313?auto=format&fit=crop&w=400&q=80', 'Fresh tropical passion fruit.');

-- Other Fruits
INSERT INTO products (farmer_id, product_name, category, quantity, unit, price, image_path, description) VALUES 
(13, 'Pear (नाशपाती)', 'fruits', 80, 'kilos', 70, 'https://images.unsplash.com/photo-1514756331096-242f390033c1?auto=format&fit=crop&w=400&q=80', 'Juicy hill pears.'),
(15, 'Plum (आलू बुखारा)', 'fruits', 40, 'kilos', 90, 'https://images.unsplash.com/photo-1531063673323-28821919420d?auto=format&fit=crop&w=400&q=80', 'Mountain fresh plums.'),
(13, 'Peach (आडू)', 'fruits', 50, 'kilos', 110, 'https://images.unsplash.com/photo-1629991202241-2471200be33d?auto=format&fit=crop&w=400&q=80', 'Soft sweet peaches.'),
(13, 'Apricot (खुबानी)', 'fruits', 25, 'kilos', 180, 'https://images.unsplash.com/photo-1501746768113-00fe01e5cd4c?auto=format&fit=crop&w=400&q=80', 'Dried/Fresh apricots from HP.'),
(13, 'Cherry (चेरी)', 'fruits', 15, 'kilos', 350, 'https://images.unsplash.com/photo-1528821128474-27fcafe3b245?auto=format&fit=crop&w=400&q=80', 'Himachal red cherries.'),
(12, 'Fig (Anjeer)', 'fruits', 25, 'kilos', 400, 'https://images.unsplash.com/photo-1601379327928-3f59aa594833?auto=format&fit=crop&w=400&q=80', 'Fresh organic figs.'),
(17, 'Dates (Khajur)', 'fruits', 50, 'kilos', 180, 'https://images.unsplash.com/photo-1589135339689-13768560032c?auto=format&fit=crop&w=400&q=80', 'Imported quality desert dates.');

-- Dry Fruits (from fruits)
INSERT INTO products (farmer_id, product_name, category, quantity, unit, price, image_path, description) VALUES 
(13, 'Almond (बादाम)', 'fruits', 40, 'kilos', 800, 'https://images.unsplash.com/photo-1508817628294-5a453fa0b8fb?auto=format&fit=crop&w=400&q=80', 'Kashmiri Mamra almonds.'),
(8, 'Cashew (काजू)', 'fruits', 50, 'kilos', 750, 'https://images.unsplash.com/photo-1509070016581-915335454d19?auto=format&fit=crop&w=400&q=80', 'Goa/Konkan premium cashews.'),
(13, 'Walnut (अखरोट)', 'fruits', 30, 'kilos', 600, 'https://images.unsplash.com/photo-1589135339689-13768560032c?auto=format&fit=crop&w=400&q=80', 'Soft shell Kashmiri walnuts.'),
(17, 'Pistachio (पिस्ता)', 'fruits', 20, 'kilos', 950, 'https://images.unsplash.com/photo-1536511132770-e506660fc060?auto=format&fit=crop&w=400&q=80', 'Salted roasted pistachios.'),
(3, 'Raisins (किशमिश)', 'fruits', 60, 'kilos', 280, 'https://images.unsplash.com/photo-1618512496248-a07fe83aa8cb?auto=format&fit=crop&w=400&q=80', 'Seedless Nashik raisins.');

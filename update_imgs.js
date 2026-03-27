const fs = require('fs');
const filePath = 'c:\\Users\\Ayush\\OneDrive\\Desktop\\kmj\\listings_preview.html';
let content = fs.readFileSync(filePath, 'utf8');
content = content.replace(/class="card-img-top crop-img"(?!.*crossorigin)/g, 'class="card-img-top crop-img" crossorigin="anonymous"');
fs.writeFileSync(filePath, content);
console.log('Successfully updated <img> tags with crossorigin attribute.');

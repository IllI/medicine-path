#!/bin/bash

# Create public directory if it doesn't exist
mkdir -p app/public

# Copy existing public files (if any) to ensure we have static content
if [ -d "app/public" ]; then
  echo "Public directory exists with files:"
  ls -la app/public
else
  echo "Creating basic index.html"
  echo '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Medicine Path</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body { font-family: sans-serif; margin: 0; padding: 20px; text-align: center; }
    .container { max-width: 800px; margin: 0 auto; }
    h1 { color: #6a8977; }
  </style>
</head>
<body>
  <div class="container">
    <h1>This Medicine Path</h1>
    <p>Welcome to Medicine Path - a place of healing and transformation.</p>
    <p>Our site is currently being updated. Please check back soon.</p>
    <p><a href="/studio/">Access Sanity Studio →</a></p>
  </div>
</body>
</html>' > app/public/index.html
fi

# Build Sanity Studio
cd sanity
npm install --legacy-peer-deps
npm run build
cd ..

# Create studio directory and copy Sanity dist files
mkdir -p app/public/studio
cp -r sanity/dist/* app/public/studio/
echo "Build completed successfully" 
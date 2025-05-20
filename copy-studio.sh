#!/bin/bash

# Ensure output directories exist
mkdir -p app/public/studio

# Build Sanity Studio
echo "Building Sanity Studio..."
cd sanity
npm run build
cd ..

# Copy Sanity Studio files to Next.js public directory
echo "Copying Sanity Studio files to Next.js public directory..."
if [ -d "sanity/dist" ]; then
    cp -R sanity/dist/* app/public/studio/
    echo "✅ Successfully copied Sanity Studio to app/public/studio"
else
    echo "❌ Error: sanity/dist directory not found!"
    exit 1
fi

# Return success
echo "All done!" 
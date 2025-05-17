#!/bin/bash

# Print commands for debugging
set -ex

# Install dependencies for Next.js app
echo "=== Installing Next.js app dependencies ==="
cd app
npm install --legacy-peer-deps
npm run build

# Return to root directory
cd ..

# Install dependencies for Sanity
echo "=== Installing Sanity dependencies ==="
cd sanity
npm install --legacy-peer-deps
npm run build

# Return to root directory and report success
cd ..
echo "=== Build completed successfully ===" 
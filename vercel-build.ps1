# Print commands for debugging
Set-PSDebug -Trace 1

# Install dependencies for Next.js app
Write-Host "=== Installing Next.js app dependencies ===" -ForegroundColor Green
cd app
npm install --legacy-peer-deps
npm run build

# Return to root directory
cd ..

# Install dependencies for Sanity
Write-Host "=== Installing Sanity dependencies ===" -ForegroundColor Green
cd sanity
npm install --legacy-peer-deps
npm run build

# Return to root directory and report success
cd ..
Write-Host "=== Build completed successfully ===" -ForegroundColor Green 
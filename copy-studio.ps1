# Ensure output directories exist
if (!(Test-Path -Path "app/public/studio")) {
    New-Item -Path "app/public/studio" -ItemType Directory -Force
}

# Build Sanity Studio
Write-Host "Building Sanity Studio..."
Set-Location -Path "sanity"
npm run build
Set-Location -Path ".."

# Copy Sanity Studio files to Next.js public directory
Write-Host "Copying Sanity Studio files to Next.js public directory..."
if (Test-Path -Path "sanity/dist") {
    Copy-Item -Path "sanity/dist/*" -Destination "app/public/studio" -Recurse -Force
    Write-Host "✅ Successfully copied Sanity Studio to app/public/studio"
} else {
    Write-Host "❌ Error: sanity/dist directory not found!"
    exit 1
}

# Return success
Write-Host "All done!" 
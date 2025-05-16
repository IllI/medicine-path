Write-Host "Starting Medicine Path Development Environment" -ForegroundColor Green
Write-Host "-----------------------------------" -ForegroundColor Green
Write-Host ""
Write-Host "Opening Next.js frontend (app) in new terminal..." -ForegroundColor Cyan

# Start Next.js in a new PowerShell window
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $PWD\app; npm run dev"

Write-Host "Opening Sanity Studio in new terminal..." -ForegroundColor Yellow

# Start Sanity in a new PowerShell window
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $PWD\sanity; npm run dev"

Write-Host ""
Write-Host "Development servers started:" -ForegroundColor Green
Write-Host "- Next.js: http://localhost:3000" -ForegroundColor Cyan
Write-Host "- Sanity: http://localhost:3333" -ForegroundColor Yellow
Write-Host ""
Write-Host "Note: Close the terminal windows to stop the servers" -ForegroundColor Gray 
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

console.log('=== Starting build process ===');

try {
  // Build Next.js App
  console.log('=== Building Next.js App ===');
  execSync('cd app && npm install --legacy-peer-deps && npm run build', { stdio: 'inherit' });
  
  // Build Sanity Studio
  console.log('=== Building Sanity Studio ===');
  execSync('cd sanity && npm install --legacy-peer-deps && npm run build', { stdio: 'inherit' });
  
  // Create studio directory in app/public if it doesn't exist
  const studioDir = path.join('app', 'public', 'studio');
  if (!fs.existsSync(studioDir)) {
    fs.mkdirSync(studioDir, { recursive: true });
    console.log(`Created directory: ${studioDir}`);
  }
  
  // Copy Sanity dist to app/public/studio
  console.log('=== Copying Sanity build to app/public/studio ===');
  const sanitySrcDir = path.join('sanity', 'dist');
  
  function copyFolderSync(from, to) {
    // Create the destination folder if it doesn't exist
    if (!fs.existsSync(to)) fs.mkdirSync(to, { recursive: true });
    
    // Get all files and subdirectories in the source folder
    const files = fs.readdirSync(from);
    
    // Copy each file/directory to the destination
    files.forEach(file => {
      const sourceFile = path.join(from, file);
      const destFile = path.join(to, file);
      
      const stats = fs.statSync(sourceFile);
      
      if (stats.isDirectory()) {
        // If it's a directory, recursively copy it
        copyFolderSync(sourceFile, destFile);
      } else {
        // If it's a file, copy it directly
        fs.copyFileSync(sourceFile, destFile);
      }
    });
  }
  
  copyFolderSync(sanitySrcDir, studioDir);
  
  console.log('=== Build and copy process completed successfully ===');
} catch (error) {
  console.error('=== Build failed ===');
  console.error(error);
  process.exit(1);
} 
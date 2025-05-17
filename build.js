const { execSync } = require('child_process');

console.log('=== Starting build process ===');

try {
  // Build Next.js App
  console.log('=== Building Next.js App ===');
  execSync('cd app && npm install --legacy-peer-deps && npm run build', { stdio: 'inherit' });
  
  // Build Sanity Studio
  console.log('=== Building Sanity Studio ===');
  execSync('cd sanity && npm install --legacy-peer-deps && npm run build', { stdio: 'inherit' });
  
  console.log('=== Build successful ===');
} catch (error) {
  console.error('=== Build failed ===');
  console.error(error);
  process.exit(1);
} 
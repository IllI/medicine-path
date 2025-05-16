# Medicine Path

This is a monorepo for the Medicine Path project, containing:

- `/app`: Next.js frontend application
- `/sanity`: Sanity CMS studio

## Development

### Option 1: Using the Development Scripts (Recommended)

#### For Windows (PowerShell):

```powershell
# In PowerShell
./run-dev.ps1
```

#### For Linux/Mac/Git Bash/WSL:

```bash
# Make the script executable first
chmod +x run-dev.sh

# Then run it
./run-dev.sh
```

These scripts will open terminals for:
- Next.js frontend on http://localhost:3000
- Sanity Studio on http://localhost:3333

### Option 2: Running Individually

You can also run each service separately:

```bash
# Run Next.js frontend
cd app
npm run dev

# In another terminal, run Sanity Studio
cd sanity
npm run dev
```

## Deployment

The project is configured for deployment on Vercel.

### Deploying to Vercel

1. **Connect to GitHub**
   - Push your repository to GitHub
   - Create a new project in Vercel and connect to your GitHub repository

2. **Configure Project Settings**
   - Framework preset: Next.js
   - Root directory: `./` (root of repository)
   - Build command: `npm run build` (already set in vercel.json)
   - Output directory: `app/.next` (already set in vercel.json)
   - Install command: `npm install --legacy-peer-deps` (already set in vercel.json)

3. **Environment Variables**
   - Add all required environment variables in Vercel project settings
   - See `ENVIRONMENT_VARIABLES.md` for the complete list of required variables

4. **Deploy**
   - Click "Deploy" to start the deployment process
   - Vercel will automatically build and deploy your application

### Access Points After Deployment

- **Frontend**: `https://your-project.vercel.app/`
- **Sanity Studio**: `https://your-project.vercel.app/studio/`

### Troubleshooting Deployment

If you encounter issues during deployment:

1. Check the build logs in Vercel for specific errors
2. Ensure all environment variables are correctly set
3. Verify that the monorepo structure is maintained as expected
4. Make sure `vercel.json` contains the correct configuration

## Current Status

The monorepo is configured with:
- Workspaces for app and sanity
- Vercel deployment configuration
- Basic scripts for building and running

**Note:** There are currently dependency conflicts between the projects that prevent them from being run simultaneously via concurrently. The separate terminals approach works reliably until these are resolved.

# Medicine Path - Project Overview

## Tech Stack
- **Frontend**: Next.js (with React, TypeScript)
- **CMS**: Sanity.io
- **Styling**: Tailwind CSS
- **APIs**: Zoom API, Google Calendar API

## Project Structure
- `/app/src/` - Main application code
  - `/app` - Next.js app router structure
  - `/components` - React components
  - `/lib` - Utility functions and API clients
  - `/schemas` - Sanity schema definitions (app version)
  - `/types` - TypeScript type definitions
- `/sanity/` - Sanity Studio configuration
  - `/schemas` - Sanity schema definitions (studio version)

## Data Model (Sanity Schemas)

### Homepage
```typescript
// Main homepage content with sections for:
// - Hero section (heading, subheading, image)
// - Post-ceremony section (heading, subheading, text, image)
// - Integration section (heading, text, images array)
// - Honor medicine section (heading, text, image, button)
// - Philosophy section (heading, text, image)
// - About section (heading, text, image)
// - Contact section (heading, subheading, contactInfo, locationInfo)
// - Theme settings (colors, fonts)
```

### Service
```typescript
// Service offerings with:
// - name (string)
// - slug (for URLs)
// - durationMinutes (number)
// - priceInfo (string)
// - description (text)
// - image
```

### Page
```typescript
// Generic page content with:
// - title (string)
// - slug (for URLs)
// - body (blockContent)
```

### BlockContent
```typescript
// Rich text editor configuration for:
// - Text styles (normal, h1-h4, quotes)
// - Lists (bullet, numbered)
// - Text formatting (bold, italic, underline, strikethrough)
// - Links
// - Images with alt text
```

## Key Features

### Appointment Booking
The booking system uses a multi-step form to:
1. Select a service
2. Select a date and time
3. Enter contact information
4. Create appointments with Zoom integration

### Content Management
- Managed through Sanity Studio
- Structured content with defined schemas
- Image management with hotspot support

### Integrations
- **Zoom API**: Creates meeting links for virtual appointments
  - Server-to-Server OAuth authentication
  - Automated meeting creation with configurable settings
  - Fallback to mock data when API fails
- **Google Calendar**: Manages appointment scheduling

## Data Fetching
Sanity data is fetched using GROQ queries in `app/src/lib/sanity-client.ts`.

## Environment Variables
- `NEXT_PUBLIC_SANITY_PROJECT_ID` - Sanity project ID
- `NEXT_PUBLIC_SANITY_DATASET` - Sanity dataset name
- `NEXT_PUBLIC_SANITY_API_VERSION` - Sanity API version
- `SANITY_API_WRITE_TOKEN` - Token for write operations
- `ZOOM_CLIENT_ID` - Zoom API client ID
- `ZOOM_CLIENT_SECRET` - Zoom API client secret
- `ZOOM_ACCOUNT_ID` - Zoom account ID
- `ZOOM_ACCOUNT_EMAIL` - Zoom account email 
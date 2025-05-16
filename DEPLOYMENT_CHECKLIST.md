# Vercel Deployment Checklist

## Before Deploying
- [ ] Ensure ESLint and TypeScript errors are addressed or configured to be ignored during build
- [ ] Test build process locally with `npm run build`
- [ ] Make sure all required environment variables are documented 
- [ ] Verify proper routing between frontend and Sanity Studio
- [ ] Test live preview functionality locally
- [ ] Update any hardcoded URLs to use environment variables

## Preparing Repository
- [ ] Commit all changes to version control
- [ ] Push repository to GitHub
- [ ] Ensure `.gitignore` excludes all sensitive and unnecessary files
- [ ] Verify `vercel.json` has correct configuration

## Vercel Configuration
- [ ] Connect GitHub repository to Vercel
- [ ] Set root directory to `/` (root of repository)
- [ ] Configure framework preset as Next.js
- [ ] Verify build command is `npm run build`
- [ ] Confirm output directory is `app/.next`
- [ ] Set install command to `npm install --legacy-peer-deps`

## Environment Variables
- [ ] Add all Sanity configuration variables:
  - [ ] `NEXT_PUBLIC_SANITY_PROJECT_ID`
  - [ ] `NEXT_PUBLIC_SANITY_DATASET`
  - [ ] `NEXT_PUBLIC_SANITY_API_VERSION`
  - [ ] `SANITY_API_WRITE_TOKEN`
  - [ ] `SANITY_STUDIO_API_DATASET`
  - [ ] `SANITY_STUDIO_API_PROJECT_ID`
- [ ] Add any API integration variables (Zoom, Google Calendar)
- [ ] Ensure multi-line variables like private keys are properly formatted

## Deployment
- [ ] Deploy project
- [ ] Verify frontend loads correctly
- [ ] Verify Sanity Studio loads at `/studio` path
- [ ] Test content editing and live preview functionality
- [ ] Ensure API integrations work correctly

## Post-Deployment
- [ ] Set up domain and SSL if applicable
- [ ] Configure deployment protection if needed
- [ ] Set up auto-deployment from main/production branch
- [ ] Document deployment details in project documentation
- [ ] Set up monitoring and error tracking

## Troubleshooting Common Issues
- **Build Failures**: Check Vercel build logs for specific error messages
- **Missing Dependencies**: Make sure all dependencies are correctly defined in package.json
- **Environment Variables**: Verify all required environment variables are set in Vercel
- **Routing Issues**: Check vercel.json rewrites configuration
- **Studio Not Loading**: Verify studio path configuration and rewrites
- **API/Fetch Errors**: Ensure CORS settings are configured correctly 
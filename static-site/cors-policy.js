/*
CORS POLICY SETUP GUIDE

In order for your static website to fetch data from your Sanity API, 
you need to add your site to the CORS origins allowed list.

Follow these steps:

1. Go to https://www.sanity.io/manage 
2. Select your project
3. Go to API > CORS origins
4. Click "Add CORS origin"
5. Enter your production URL: https://medicinepath-static.vercel.app
6. Check "Allow credentials" 
7. Save

Once this is done, your static site will be able to fetch data from Sanity.
*/ 
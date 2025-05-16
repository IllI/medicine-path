# Environment Variables Guide for Vercel Deployment

When deploying the Medicine Path monorepo to Vercel, you'll need to configure the following environment variables in your Vercel project settings.

## Required Variables

### Sanity Configuration
| Variable Name | Description | Example Value |
|---------------|-------------|--------------|
| `NEXT_PUBLIC_SANITY_PROJECT_ID` | Your Sanity project ID | `abcd1234` |
| `NEXT_PUBLIC_SANITY_DATASET` | Sanity dataset name | `production` |
| `NEXT_PUBLIC_SANITY_API_VERSION` | Sanity API version | `2023-05-03` |
| `SANITY_API_WRITE_TOKEN` | Token for write operations | `sk_...` |
| `SANITY_STUDIO_API_DATASET` | Dataset for Sanity Studio | `production` |
| `SANITY_STUDIO_API_PROJECT_ID` | Project ID for Sanity Studio | `abcd1234` |

### Zoom API (if using)
| Variable Name | Description | Example Value |
|---------------|-------------|--------------|
| `ZOOM_CLIENT_ID` | Zoom API client ID | `...` |
| `ZOOM_CLIENT_SECRET` | Zoom API client secret | `...` |
| `ZOOM_ACCOUNT_ID` | Zoom account ID | `...` |
| `ZOOM_ACCOUNT_EMAIL` | Zoom account email | `user@example.com` |

### Google Calendar (if using)
| Variable Name | Description | Example Value |
|---------------|-------------|--------------|
| `GOOGLE_CLIENT_EMAIL` | Google service account email | `account@project.iam.gserviceaccount.com` |
| `GOOGLE_PRIVATE_KEY` | Google service account private key | `-----BEGIN PRIVATE KEY-----\n...` |
| `GOOGLE_CALENDAR_ID` | Google Calendar ID | `calendar@group.calendar.google.com` |

## How to Add Environment Variables in Vercel

1. Go to your project in the Vercel dashboard
2. Navigate to "Settings" > "Environment Variables"
3. Add each variable individually or import an .env file
4. Make sure to select the appropriate environments (Production, Preview, Development)
5. Save the changes

## Environment Limitations and Scope

- Environment variables prefixed with `NEXT_PUBLIC_` will be exposed to the browser
- Secret keys and tokens should never use the `NEXT_PUBLIC_` prefix
- Some variables may be needed in both the Next.js app and Sanity Studio

## Local Development

For local development, create the following files:

- `.env.local` in the root directory
- `app/.env.local` for Next.js-specific variables
- `sanity/.env.local` for Sanity-specific variables

**Important:** Always add `.env*` files to your `.gitignore` to prevent exposing secrets. 
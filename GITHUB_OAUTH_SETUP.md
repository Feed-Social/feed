# GitHub OAuth Setup for Feed

## Supabase Dashboard Steps

### 1. Enable GitHub Provider
1. Go to your Supabase project dashboard
2. Navigate to **Authentication** > **Providers**
3. Click on **GitHub**
4. Toggle **Enable GitHub provider** to ON
5. Click **Save**

### 2. Get Supabase OAuth Credentials
1. In the GitHub provider settings, you'll see:
   - **Client ID**: Copy this (you'll need it for GitHub OAuth app)
   - **Client Secret**: Copy this (you'll need it for GitHub OAuth app)
   - **Redirect URL**: Copy this (format: `https://<your-project-ref>.supabase.co/auth/v1/callback`)

### 3. Create GitHub OAuth App
1. Go to [GitHub Developer Settings](https://github.com/settings/developers)
2. Click **OAuth Apps** > **New OAuth App**
3. Fill in the form:
   - **Application name**: Feed (or your preferred name)
   - **Homepage URL**: Your app's URL (e.g., `https://feedsocial.pages.dev` or `http://localhost:3000` for local dev)
   - **Application description**: Social media platform
   - **Authorization callback URL**: Paste the Supabase redirect URL from step 2
4. Click **Register application**

### 4. Configure GitHub OAuth App
1. After registration, you'll see:
   - **Client ID**: Copy this
   - **Generate a new client secret**: Click this button and copy the secret
2. Go back to Supabase dashboard > Authentication > Providers > GitHub
3. Paste the GitHub **Client ID** and **Client Secret** into the Supabase fields
4. Click **Save**

### 5. Configure GitHub OAuth App Scopes (Optional)
1. In your GitHub OAuth app settings, you can add scopes if needed
2. For basic auth, default scopes are usually sufficient
3. Common scopes: `user:email`, `read:user`

### 6. Test the Setup
1. Go to your Feed app
2. Click "Continue with GitHub"
3. You should be redirected to GitHub for authorization
4. After authorizing, you should be redirected back to your app and logged in

## Optional: Disable Email Confirmation (for testing)

### Supabase Dashboard Steps
1. Go to **Authentication** > **Providers** > **Email**
2. Toggle **Confirm email** to OFF
3. Click **Save**

This allows users to sign up without email confirmation, useful for development/testing.

## Troubleshooting

### "Redirect URI mismatch" error
- Ensure the callback URL in GitHub OAuth app matches exactly with Supabase redirect URL
- Check for trailing slashes or protocol differences (http vs https)

### "Invalid client credentials" error
- Double-check that Client ID and Secret are correctly copied
- Ensure you're using the GitHub OAuth app credentials, not Supabase credentials

### User profile not created
- Check that the `handle_new_user` trigger is properly set up
- Verify the trigger is firing by checking the auth.users table after signup

## Production Checklist
- [ ] Enable email confirmation for production
- [ ] Use production URLs (not localhost)
- [ ] Add proper error handling for OAuth failures
- [ ] Test the full OAuth flow end-to-end
- [ ] Set up proper user profile completion flow

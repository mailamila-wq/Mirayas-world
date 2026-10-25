# Miraya's World 2.0

## Setup
1. Create a Supabase project. In Authentication > Users, add a parent email/password user. Copy the user's UUID.
2. In Supabase SQL Editor, open `supabase.sql`, replace `PARENT_USER_UUID` with the UUID and run it once. (If you rerun it, existing policies may cause errors.)
3. In Supabase Project Settings / API Keys, copy the project URL and **publishable** key into `config.js`. Never put secret or service_role keys in browser code.
4. Upload `index.html` and `config.js` to the **root** of your existing GitHub Pages repository. Keep `supabase.sql` private/off the published site if you prefer. Do not upload the ZIP itself.
5. Open your website > Parent > sign in > add questions > Preview > Publish. Miraya sees published activities in Play after refreshing the page.

## Notes
- Parent authentication and Row Level Security protect writes. Anyone with the public URL can view published activities. Don't publish sensitive child information.
- Child progress remains in the iPad's browser localStorage, not Supabase. Use Export Progress to back it up.
- Matching activities use tap-to-match, suitable for iPad touch screens.
- This is an initial working builder. No image upload, AI generator, or offline caching yet.
- Preview creates a temporary in-memory activity and does not publish it.

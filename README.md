# Change Agent Workshop

Static workshop site for Change Agent 2026.

## Supabase setup

1. Open the Supabase SQL Editor for project `fpgkpwojfrxtulhvltu`.
2. Run [`supabase/schema.sql`](supabase/schema.sql).
3. In Project Settings > API, copy the **anon public** key.
4. Add it in `index.html` as `window.__SUPABASE_ANON_KEY__` before deployment.

The site intentionally permits shared workshop data access without individual sign-in. Do not store confidential personal data in this project.

## Deployment

Import this GitHub repository into Vercel as a static site. No build command is required; the output directory is the repository root.
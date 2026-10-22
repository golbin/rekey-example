NEXT_PUBLIC_APP_URL=https://shop.example.com
NEXT_PUBLIC_SUPABASE_URL=https://abcdefghijklmnopqrst.supabase.co
OPENAI_API_KEY={{ op://Acme - Prod/openai.shop/credential }}
BETTER_AUTH_SECRET={{ op://Acme - Prod/self.shop.auth-secret/credential }}
DATABASE_URL=postgresql://postgres.abcdefghijklmnopqrst:{{ op://Acme - Prod/supabase-db.abcdefghijklmnopqrst/password }}@aws-0-us-east-1.pooler.supabase.com:6543/postgres
CRON_SECRET={{ op://Acme - Prod/self.shop.cron-secret/credential }}
RESEND_API_KEY={{ op://Acme - Prod/resend.shop/credential }}
# SENTRY_AUTH_TOKEN: sensitive in Vercel, value unknown (not managed)

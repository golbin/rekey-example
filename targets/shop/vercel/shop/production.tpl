NEXT_PUBLIC_APP_URL=https://shop.example.com
NEXT_PUBLIC_SUPABASE_URL=https://abcdefghijklmnopqrst.supabase.co
OPENAI_API_KEY={{ op://Acme - Prod/shop.openai/credential }}
BETTER_AUTH_SECRET={{ op://Acme - Prod/shop.self.auth-secret/credential }}
DATABASE_URL=postgresql://postgres.abcdefghijklmnopqrst:{{ op://Acme - Prod/shop.supabase-db/password }}@aws-0-us-east-1.pooler.supabase.com:6543/postgres
CRON_SECRET={{ op://Acme - Prod/shop.self.cron-secret/credential }}
RESEND_API_KEY={{ op://Acme - Prod/shop.resend/credential }}
# SENTRY_AUTH_TOKEN: sensitive in Vercel, value unknown (not managed)

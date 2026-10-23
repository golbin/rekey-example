OPENAI_API_KEY={{ op://Acme - Local/shop.openai/credential }}
BETTER_AUTH_SECRET={{ op://Acme - Prod/shop.self.auth-secret/credential }}
DATABASE_URL=postgresql://postgres.abcdefghijklmnopqrst:{{ op://Acme - Prod/shop.supabase-db/password }}@aws-0-us-east-1.pooler.supabase.com:5432/postgres

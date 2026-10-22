**English** · [한국어](README.ko.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [Español](README.es.md)

# rekey example

Example team data for [rekey](https://github.com/golbin/rekey): where each API key of a made-up company, Acme, is used. Every value is fake, and there are no key values at all: those live in 1Password.

## Start your own

1. **Use this template** (button above) → create a **private** repository. Team data shows how your infrastructure is wired, so keep it private.
2. Get the tool and your copy:
   ```bash
   pipx install git+https://github.com/golbin/rekey
   git clone <your new repo> ~/code/keys      # next to your projects
   cd ~/code/keys
   ```
3. Replace the examples with your own:
   ```bash
   rm -r targets keys.toml
   rekey init --vault "<your vault>" --source vercel --source supabase --source railway
   rekey import all
   git add . && git commit -m "Our keys"
   ```

Then follow the [setup guide](https://github.com/golbin/rekey/blob/main/docs/en/setup.md).

## Look around first

No 1Password needed for this:

```bash
rekey ls                                    # 10 keys, how each is issued, where it is used
rekey where openai.shop                     # one key used in 5 places
REKEY_STORE=file:/tmp/rekey.json rekey rotate all --dry-run   # what a rotation would do
```

| File | Shows |
|---|---|
| `targets/file/shop/web/.env.local.tpl` | a local .env: keys only, a password inside a URL |
| `targets/file/shop/api/.env.tpl` | an R2 key pair (two fields of one key) |
| `targets/vercel/shop/production.tpl` | plain settings next to keys, and a variable rekey can't read |
| `targets/vercel/shop/preview.tpl` | the same key in another environment |
| `targets/railway/shop/production/api.tpl` | a Railway service |
| `targets/supabase/<ref>.tpl` | Supabase Edge Function secrets |
| `targets/github/acme/shop/production.tpl` | a GitHub Actions secret in an environment |
| `targets/file/old-blog/.env.tpl` | a key only a retired project still has |
| `keys.toml` | `locked`, `check`, `retire`, `note`, `page` |

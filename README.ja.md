[English](README.md) · [한국어](README.ko.md) · [中文](README.zh.md) · **日本語** · [Español](README.es.md)

# rekey のサンプル

[rekey](https://github.com/golbin/rekey) が使うチームデータの例です。架空の会社 Acme の API キーがどこで使われているかを書いています。値はすべて架空で、キーの値はまったく入っていません。キーの値は 1Password に置きます。

## 自分のチーム用に始める

1. 上の **Use this template** ボタンで**非公開**リポジトリを作ります。チームデータからはインフラ構成が分かるので、非公開にしてください。
2. ツールをインストールし、リポジトリを取得します。
   ```bash
   pipx install git+https://github.com/golbin/rekey
   git clone <新しいリポジトリ> ~/code/keys      # 各プロジェクトと同じフォルダに
   cd ~/code/keys
   ```
3. サンプルを自分のものに置き換えます。
   ```bash
   rm -r targets keys.toml
   rekey init --vault "<自分の vault>" --source vercel --source supabase --source railway
   rekey import all
   git add . && git commit -m "Our keys"
   ```

続きは[準備ガイド](https://github.com/golbin/rekey/blob/main/docs/ja/setup.md)に従ってください。

## まず眺めてみる

1Password は不要です。

```bash
rekey ls                                    # キー 10 個、発行方法、使用先
rekey where openai.shop                     # ひとつのキーが 5 か所で使われている
REKEY_STORE=file:/tmp/rekey.json rekey rotate all --dry-run   # ローテーションすると何が起きるか
```

| ファイル | 示していること |
|---|---|
| `targets/file/shop/web/.env.local.tpl` | ローカルの .env：キーだけ、URL の中のパスワード |
| `targets/file/shop/api/.env.tpl` | R2 のキーペア（ひとつのキーの 2 つのフィールド） |
| `targets/vercel/shop/production.tpl` | キーと並ぶ通常の設定、rekey が読めない変数 |
| `targets/vercel/shop/preview.tpl` | 同じキーを別の環境で |
| `targets/railway/shop/production/api.tpl` | Railway のサービス |
| `targets/supabase/<ref>.tpl` | Supabase Edge Function secrets |
| `targets/github/acme/shop/production.tpl` | GitHub Actions の環境 secret |
| `targets/file/old-blog/.env.tpl` | 使われなくなったプロジェクトにだけ残るキー |
| `keys.toml` | `locked`、`check`、`retire`、`note`、`page` |

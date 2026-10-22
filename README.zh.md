[English](README.md) · [한국어](README.ko.md) · **中文** · [日本語](README.ja.md) · [Español](README.es.md)

# rekey 示例

[rekey](https://github.com/golbin/rekey) 使用的团队数据示例：记录了一家虚构公司 Acme 的每个 API 密钥用在哪里。密钥放在 `Acme - Prod`、`Acme - Dev`、`Acme - Local` 三个保险库中，命名为 `<项目>.<服务>`。所有值都是虚构的，而且完全没有密钥值——密钥值保存在 1Password 中。

## 用作你自己的起点

1. 点击上方 **Use this template** → 创建一个**私有**仓库。团队数据会暴露你的基础设施结构，请保持私有。
2. 安装工具并获取你的副本：
   ```bash
   pipx install git+https://github.com/golbin/rekey
   git clone <你的新仓库> ~/code/keys      # 放在各项目旁边
   cd ~/code/keys
   ```
3. 用你自己的内容替换示例：
   ```bash
   rm -r targets keys.toml
   rekey init --vault "<你的 vault>" --source vercel --source supabase --source railway
   rekey arrange "<你的 vault 前缀> - {env}"   # 每个环境一个保险库
   rekey import all
   git add . && git commit -m "Our keys"
   ```

然后按照[准备指南](https://github.com/golbin/rekey/blob/main/docs/zh/setup.md)继续。

## 先看看

不需要 1Password：

```bash
rekey ls                                    # 14 个密钥、3 个保险库、签发方式、使用处
rekey where shop.openai                     # 同一名称在 Prod、Dev、Local：每个环境一个密钥
REKEY_STORE=file:/tmp/rekey.json rekey rotate all --dry-run   # 轮换时会发生什么
```

| 文件 | 展示内容 |
|---|---|
| `targets/file/shop/web/.env.local.tpl` | 本地 .env：只有密钥，URL 中的密码 |
| `targets/file/shop/api/.env.tpl` | R2 密钥对（一个密钥的两个字段） |
| `targets/vercel/shop/production.tpl` | 与密钥并列的普通配置，以及 rekey 无法读取的变量 |
| `targets/vercel/shop/preview.tpl` | 同一个密钥用在另一个环境 |
| `targets/railway/shop/production/api.tpl` | Railway 服务 |
| `targets/supabase/<ref>.tpl` | Supabase Edge Function secrets |
| `targets/github/acme/shop/production.tpl` | GitHub Actions 环境 secret |
| `targets/file/old-blog/.env.tpl` | 只剩在已停用项目中的密钥 |
| `keys.toml` | `locked`、`check`、`retire`、`note`、`page` |

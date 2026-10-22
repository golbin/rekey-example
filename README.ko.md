[English](README.md) · **한국어** · [中文](README.zh.md) · [日本語](README.ja.md) · [Español](README.es.md)

# rekey 예시

[rekey](https://github.com/golbin/rekey)가 쓰는 팀 데이터의 예시입니다. 가상의 회사 Acme의 API 키가 어디에 쓰이는지 적혀 있습니다. 모든 값은 가짜이고, 키 값은 아예 없습니다. 키 값은 1Password에 둡니다.

## 우리 팀 것으로 시작하기

1. 위의 **Use this template** 버튼으로 **비공개** 저장소를 만듭니다. 팀 데이터에는 인프라 구성이 드러나므로 비공개로 둡니다.
2. 도구를 설치하고 저장소를 받습니다.
   ```bash
   pipx install git+https://github.com/golbin/rekey
   git clone <새 저장소> ~/code/keys      # 프로젝트들과 같은 폴더에
   cd ~/code/keys
   ```
3. 예시를 우리 것으로 바꿉니다.
   ```bash
   rm -r targets keys.toml
   rekey init --vault "<우리 vault>" --source vercel --source supabase --source railway
   rekey import all
   git add . && git commit -m "Our keys"
   ```

이어서 [준비 가이드](https://github.com/golbin/rekey/blob/main/docs/ko/setup.md)를 따르세요.

## 먼저 둘러보기

1Password 없이도 됩니다.

```bash
rekey ls                                    # 키 10개, 발급 방식, 사용처
rekey where openai.shop                     # 키 하나가 5곳에서 쓰임
REKEY_STORE=file:/tmp/rekey.json rekey rotate all --dry-run   # 교체하면 무슨 일이 일어나는지
```

| 파일 | 보여 주는 것 |
|---|---|
| `targets/file/shop/web/.env.local.tpl` | 로컬 .env: 키만 있음, URL 안의 비밀번호 |
| `targets/file/shop/api/.env.tpl` | R2 키 쌍 (키 하나의 두 필드) |
| `targets/vercel/shop/production.tpl` | 키와 함께 있는 일반 설정, rekey가 읽을 수 없는 변수 |
| `targets/vercel/shop/preview.tpl` | 같은 키를 다른 환경에서 |
| `targets/railway/shop/production/api.tpl` | Railway 서비스 |
| `targets/supabase/<ref>.tpl` | Supabase Edge Function secrets |
| `targets/github/acme/shop/production.tpl` | GitHub Actions 환경 secret |
| `targets/file/old-blog/.env.tpl` | 안 쓰는 프로젝트에만 남은 키 |
| `keys.toml` | `locked`, `check`, `retire`, `note`, `page` |

[English](README.md) · [한국어](README.ko.md) · [中文](README.zh.md) · [日本語](README.ja.md) · **Español**

# Ejemplo de rekey

Datos de equipo de ejemplo para [rekey](https://github.com/golbin/rekey): dónde se usa cada clave de API de una empresa inventada, Acme. Las claves están en tres bóvedas, `Acme - Prod`, `Acme - Dev` y `Acme - Local`, y se llaman `<proyecto>.<servicio>`. Todos los valores son falsos y no hay ningún valor de clave: esos viven en 1Password.

## Empieza el tuyo

1. **Use this template** (botón de arriba) → crea un repositorio **privado**. Los datos del equipo muestran cómo está montada tu infraestructura, así que mantenlos privados.
2. Instala la herramienta y descarga tu copia:
   ```bash
   pipx install git+https://github.com/golbin/rekey
   git clone <tu repositorio nuevo> ~/code/keys      # junto a tus proyectos
   cd ~/code/keys
   ```
3. Sustituye los ejemplos por los tuyos:
   ```bash
   rm -r targets keys.toml
   rekey init --vault "<tu bóveda>" --source vercel --source supabase --source railway
   rekey arrange "<prefijo de tu bóveda> - {env}"   # una bóveda por entorno
   rekey import all
   git add . && git commit -m "Our keys"
   ```

Después sigue la [guía de preparación](https://github.com/golbin/rekey/blob/main/docs/es/setup.md).

## Échale un vistazo primero

No hace falta 1Password:

```bash
rekey ls                                    # 14 claves en 3 bóvedas, cómo se emite cada una y dónde se usa
rekey where shop.openai                     # el mismo nombre en Prod, Dev y Local: una clave por entorno
REKEY_STORE=file:/tmp/rekey.json rekey rotate all --dry-run   # qué haría una rotación
```

| Archivo | Muestra |
|---|---|
| `targets/file/shop/web/.env.local.tpl` | un .env local: solo claves, una contraseña dentro de una URL |
| `targets/file/shop/api/.env.tpl` | un par de claves de R2 (dos campos de una misma clave) |
| `targets/vercel/shop/production.tpl` | configuración normal junto a claves, y una variable que rekey no puede leer |
| `targets/vercel/shop/preview.tpl` | la misma clave en otro entorno |
| `targets/railway/shop/production/api.tpl` | un servicio de Railway |
| `targets/supabase/<ref>.tpl` | secrets de Supabase Edge Functions |
| `targets/github/acme/shop/production.tpl` | un secret de GitHub Actions en un entorno |
| `targets/file/old-blog/.env.tpl` | una clave que solo conserva un proyecto retirado |
| `keys.toml` | `locked`, `check`, `retire`, `note`, `page` |

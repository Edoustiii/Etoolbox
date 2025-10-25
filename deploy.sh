#!/usr/bin/env sh

# راهنمای دپلوی به GitHub Pages

# 1. ابتدا بیلد بگیرید
npm run build

# 2. فایل‌های خروجی در docs/.vitepress/dist ایجاد می‌شوند

# 3. برای دپلوی دستی:
#    - به پوشه docs/.vitepress/dist بروید
#    - یک git repository جدید بسازید
#    - آن را به برنچ gh-pages مخزن خود push کنید

# یا از GitHub Actions استفاده کنید (فایل .github/workflows/deploy.yml)

echo "✅ Build completed! Output: docs/.vitepress/dist"
echo ""
echo "📦 برای دپلوی به GitHub Pages:"
echo "   1. فایل .github/workflows/deploy.yml را commit کنید"
echo "   2. در تنظیمات مخزن GitHub، Pages را فعال کنید"
echo "   3. Source را روی 'GitHub Actions' تنظیم کنید"
echo "   4. هر push به main باعث دپلوی خودکار می‌شود"

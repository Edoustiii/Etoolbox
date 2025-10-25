# 🎯 خلاصه دستورات

## نصب و اجرا
```bash
# نصب وابستگی‌ها
npm install

# اجرای محیط توسعه
npm run dev

# ساخت نسخه نهایی
npm run build

# پیش‌نمایش
npm run preview
```

## دپلوی به GitHub Pages

### آماده‌سازی اولیه
```bash
git init
git add .
git commit -m "Initial commit: EmadT3ch Tools"
git branch -M main
git remote add origin https://github.com/USERNAME/REPO.git
git push -u origin main
```

### تنظیمات GitHub
1. به Settings → Pages بروید
2. Source را روی "GitHub Actions" تنظیم کنید
3. تمام! هر push باعث دپلوی خودکار می‌شود

## فایل‌های مهم برای ویرایش

| فایل | هدف |
|------|-----|
| `docs/index.md` | محتوای صفحه اصلی |
| `docs/about.md` | صفحه درباره |
| `docs/.vitepress/config.js` | تنظیمات سایت (عنوان، منو، لینک‌ها) |
| `docs/.vitepress/theme/style.css` | استایل‌ها و رنگ‌ها |
| `docs/public/Assets/` | تصاویر و لوگو |

## تغییر رنگ‌های نئونی

در `style.css` این متغیرها را تغییر دهید:
```css
:root {
  --neon-blue: #58a6ff;      /* آبی نئونی */
  --neon-purple: #a371f7;    /* بنفش */
  --neon-cyan: #39d0d8;      /* سبز آبی */
  --neon-pink: #ff7b72;      /* صورتی */
}
```

## نسخه HTML ساده (بدون Node)

فایل: `simple-html-version/index.html`
- فقط باز کنید و استفاده کنید!
- نیازی به نصب چیزی ندارد

---

**📱 کانال تلگرام:** [@EmadT3ch](https://t.me/EmadT3ch)

# 🚀 راهنمای راه‌اندازی سریع EmadT3ch Tools

این راهنما به شما کمک می‌کند تا پروژه EmadT3ch Tools را به سرعت راه‌اندازی کنید.

---

## 📋 فهرست مطالب

1. [پیش‌نیازها](#پیش‌نیازها)
2. [نصب و راه‌اندازی VitePress](#نصب-و-راه‌اندازی-vitepress)
3. [استفاده از نسخه HTML ساده](#استفاده-از-نسخه-html-ساده)
4. [انتشار روی GitHub Pages](#انتشار-روی-github-pages)
5. [سفارشی‌سازی](#سفارشی‌سازی)
6. [مشکلات رایج](#مشکلات-رایج)

---

## 🔧 پیش‌نیازها

### برای نسخه VitePress:
- **Node.js** نسخه 18 یا بالاتر ([دانلود](https://nodejs.org))
- **npm** (به همراه Node.js نصب می‌شود)
- **Git** (اختیاری - برای کنترل نسخه)

### برای نسخه HTML ساده:
- فقط یک مرورگر وب! 🎉

---

## 🚀 نصب و راه‌اندازی VitePress

### گام 1: نصب وابستگی‌ها

ابتدا به پوشه پروژه بروید:

```bash
cd "C:\Users\Emad\Documents\موقت\1"
```

سپس وابستگی‌ها را نصب کنید:

```bash
npm install
```

⏱️ **زمان تقریبی:** 2-5 دقیقه (بسته به سرعت اینترنت)

---

### گام 2: اجرای محیط توسعه

برای مشاهده سایت در حال توسعه:

```bash
npm run dev
```

✅ سایت روی آدرس زیر در دسترس خواهد بود:
```
http://localhost:5173
```

برای توقف سرور، `Ctrl + C` را فشار دهید.

---

### گام 3: ساخت نسخه نهایی

برای ساخت فایل‌های آماده انتشار:

```bash
npm run build
```

📦 خروجی در پوشه `docs/.vitepress/dist` قرار می‌گیرد.

---

### گام 4: پیش‌نمایش نسخه ساخته شده

برای مشاهده نسخه نهایی:

```bash
npm run preview
```

---

## 🌐 استفاده از نسخه HTML ساده

اگر نمی‌خواهید Node.js نصب کنید:

### روش 1: اجرای محلی
1. به پوشه `simple-html-version` بروید
2. فایل `index.html` را با مرورگر باز کنید
3. تمام! 🎉

### روش 2: آپلود روی سرور
- فایل `index.html` را روی هر سرور وب (مثل GitHub Pages) آپلود کنید
- مسیر تصاویر را در صورت نیاز تنظیم کنید

---

## 📤 انتشار روی GitHub Pages

### روش 1: استفاده از GitHub Actions (توصیه می‌شود)

1. **ایجاد مخزن GitHub:**
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/USERNAME/REPO.git
git push -u origin main
```

2. **فعال‌سازی GitHub Pages:**
   - به تنظیمات مخزن بروید
   - به بخش **Pages** بروید
   - **Source** را روی **GitHub Actions** تنظیم کنید

3. **اولین دپلوی:**
   - فایل `.github/workflows/deploy.yml` از قبل آماده است
   - با هر `git push` به برنچ `main`، سایت به‌طور خودکار منتشر می‌شود

✅ سایت شما روی آدرس زیر در دسترس خواهد بود:
```
https://USERNAME.github.io/REPO/
```

---

### روش 2: دپلوی دستی

```bash
# ساخت پروژه
npm run build

# رفتن به پوشه خروجی
cd docs/.vitepress/dist

# ایجاد git repository
git init
git add -A
git commit -m 'deploy'

# ارسال به برنچ gh-pages
git push -f https://github.com/USERNAME/REPO.git main:gh-pages
```

سپس در تنظیمات GitHub Pages، برنچ `gh-pages` را انتخاب کنید.

---

## 🎨 سفارشی‌سازی

### تغییر محتوا

1. **صفحه اصلی:** ویرایش `docs/index.md`
2. **صفحه درباره:** ویرایش `docs/about.md`
3. **تنظیمات سایت:** ویرایش `docs/.vitepress/config.js`

### تغییر طراحی

1. **رنگ‌ها:** ویرایش متغیرهای `:root` در `docs/.vitepress/theme/style.css`
2. **لوگو:** جایگزینی `docs/public/Assets/emadtech-neon.svg`
3. **فونت‌ها:** تغییر `--vp-font-family-base` در CSS

### افزودن محتوا

برای افزودن یک بخش جدید به `index.md`:

```markdown
## 🆕 عنوان بخش جدید

| نام | توضیحات | لینک |
|-----|---------|------|
| **نام برنامه** | توضیح کوتاه | [دانلود](لینک) |
```

---

## ❓ مشکلات رایج

### خطا: "vitepress: command not found"

**راه‌حل:**
```bash
npm install
```

---

### صفحه خالی یا سفید می‌شود

**راه‌حل:**
- بررسی کنید که `base` در `config.js` درست تنظیم شده باشد
- برای GitHub Pages:
  - اگر URL شما `username.github.io/repo` است، `base: '/repo/'`
  - اگر URL شما `username.github.io` است، `base: '/'`

---

### فونت‌های فارسی نمایش داده نمی‌شوند

**راه‌حل:**
- اطمینان حاصل کنید که اتصال اینترنت فعال است (فونت‌ها از Google Fonts بارگذاری می‌شوند)
- یا فونت‌ها را به صورت محلی دانلود کرده و در پوشه `public` قرار دهید

---

### تصاویر/لوگو نمایش داده نمی‌شود

**راه‌حل:**
- بررسی کنید که فایل‌های SVG در `docs/public/Assets/` قرار دارند
- مسیرها باید با `/Assets/` شروع شوند (نه `./Assets/`)

---

## 📂 ساختار پروژه

```
emadtech-tools/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions workflow
├── docs/
│   ├── .vitepress/
│   │   ├── config.js           # تنظیمات VitePress
│   │   ├── theme/
│   │   │   ├── index.js        # تم سفارشی
│   │   │   └── style.css       # استایل‌های سفارشی
│   │   └── dist/               # خروجی build (ساخته می‌شود)
│   ├── public/
│   │   └── Assets/
│   │       ├── emadtech-neon.svg
│   │       └── blue-line.svg
│   ├── index.md                # صفحه اصلی
│   └── about.md                # صفحه درباره
├── simple-html-version/
│   ├── index.html              # نسخه HTML ساده
│   └── README.md
├── .gitignore
├── package.json
├── README.md
├── QUICKSTART.md               # این فایل
├── deploy.sh
└── deploy.js
```

---

## 🎓 یادگیری بیشتر

### منابع VitePress:
- [مستندات رسمی VitePress](https://vitepress.dev)
- [راهنمای Markdown](https://www.markdownguide.org)
- [مستندات GitHub Pages](https://pages.github.com)

### منابع طراحی:
- [Glassmorphism Generator](https://hype4.academy/tools/glassmorphism-generator)
- [Gradient Generator](https://cssgradient.io)
- [Google Fonts](https://fonts.google.com)

---

## 💡 نکات و ترفندها

### 1. تست سریع تغییرات
```bash
npm run dev
```
تغییرات به صورت زنده (live reload) اعمال می‌شوند.

### 2. بهینه‌سازی تصاویر
- از SVG برای لوگوها استفاده کنید (حجم کم + کیفیت بالا)
- تصاویر PNG/JPG را فشرده کنید ([TinyPNG](https://tinypng.com))

### 3. سئو (SEO)
- عنوان و توضیحات صفحات را در frontmatter تکمیل کنید
- از هدرها (`h1`, `h2`, `h3`) به ترتیب استفاده کنید

### 4. دپلوی سریع‌تر
با فعال‌سازی GitHub Actions، دیگر نیازی به دپلوی دستی نیست:
```bash
git add .
git commit -m "Update content"
git push
# ✅ سایت به صورت خودکار منتشر می‌شود!
```

---

## 🆘 دریافت کمک

اگر مشکلی داشتید:

1. **بررسی Console مرورگر** (F12 → Console)
2. **بررسی Terminal** برای خطاهای Node.js
3. **مراجعه به Issues** این پروژه در GitHub
4. **پرسش در کانال تلگرام:** [@EmadT3ch](https://t.me/EmadT3ch)

---

## ✅ چک‌لیست راه‌اندازی

- [ ] Node.js نصب شده (برای نسخه VitePress)
- [ ] `npm install` اجرا شده
- [ ] `npm run dev` کار می‌کند
- [ ] محتوای `index.md` سفارشی‌سازی شده
- [ ] لوگو و تصاویر جایگزین شده‌اند
- [ ] لینک‌های تلگرام و GitHub به‌روز شده‌اند
- [ ] `npm run build` بدون خطا اجرا می‌شود
- [ ] پروژه روی GitHub آپلود شده
- [ ] GitHub Pages فعال شده
- [ ] سایت به درستی نمایش داده می‌شود

---

## 🎉 موفق باشید!

حالا آماده‌اید که یک وبسایت حرفه‌ای و زیبا بسازید!

برای هرگونه سوال یا پیشنهاد، با من در تماس باشید:

**📱 کانال تلگرام:** [@EmadT3ch](https://t.me/EmadT3ch)  
**👨‍💻 طراح:** Emad Dousti

---

<div align="center">

**ساخته شده با ❤️ در ایران**

</div>

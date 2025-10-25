# 🌟 EmadT3ch Tools

یک وبسایت مدرن و زیبا برای معرفی بهترین نرم‌افزارها و وبسایت‌های کاربردی Windows و Android

## 🚀 راه‌اندازی سریع

### نصب وابستگی‌ها
```bash
npm install
```

### اجرای محیط توسعه
```bash
npm run dev
```

سایت روی `http://localhost:5173` در دسترس خواهد بود.

### ساخت نسخه نهایی
```bash
npm run build
```

### پیش‌نمایش نسخه ساخته شده
```bash
npm run preview
```

## 📁 ساختار پروژه

```
.
├── docs/
│   ├── .vitepress/
│   │   ├── config.js          # تنظیمات VitePress
│   │   └── theme/
│   │       ├── index.js       # تم سفارشی
│   │       └── style.css      # استایل‌های سفارشی
│   ├── public/
│   │   └── Assets/
│   │       ├── emadtech-neon.svg
│   │       └── blue-line.svg
│   └── index.md               # صفحه اصلی
├── package.json
└── README.md
```

## 🎨 ویژگی‌ها

- ✨ طراحی Dark Mode مدرن با افکت‌های نئونی
- 🌐 پشتیبانی کامل از راست‌به‌چپ (RTL)
- 📱 طراحی واکنش‌گرا (Responsive)
- 🎭 افکت‌های Glassmorphism و انیمیشن‌های ملایم
- 🔍 بهینه‌سازی شده برای موتورهای جستجو
- 🚀 آماده برای انتشار روی GitHub Pages

## 📦 انتشار روی GitHub Pages

1. فایل `.github/workflows/deploy.yml` را ایجاد کنید
2. در تنظیمات مخزن GitHub، GitHub Pages را فعال کنید
3. منبع را روی "GitHub Actions" تنظیم کنید
4. هر push به برنچ `main` باعث انتشار خودکار می‌شود

یا به صورت دستی:
```bash
npm run build
# محتویات docs/.vitepress/dist را روی gh-pages برنچ قرار دهید
```

## 🛠 تکنولوژی‌های استفاده شده

- **VitePress** - فریمورک ساخت سایت استاتیک
- **Vazirmatn Font** - فونت فارسی مدرن
- **CSS3** - استایل‌دهی پیشرفته
- **Markdown** - نوشتار محتوا

## 📞 ارتباط

- تلگرام: [@EmadT3ch](https://t.me/EmadT3ch)
- طراح: Emad Dousti

## 📄 مجوز

MIT License - برای استفاده شخصی و آموزشی آزاد هستید.

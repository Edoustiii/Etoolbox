# 🔧 راهنمای کامل رفع خطای Git در VitePress

## ❌ خطای دریافتی:
```
[plugin:vitepress] spawn git ENOENT
```

---

## 📖 توضیح فنی خطا

این خطا زمانی رخ می‌دهد که:

1. **VitePress** تلاش می‌کند از دستور `git log` برای دریافت تاریخ آخرین بروزرسانی فایل‌ها استفاده کند
2. Git در سیستم شما نصب نیست یا در متغیر محیطی `PATH` قرار ندارد
3. پلاگین داخلی VitePress به نام `@vitepress/plugin-git` نمی‌تواند فرآیند Git را اجرا کند (`spawn`)
4. خطای `ENOENT` (Entity Not Found) به معنی "فایل یا دستور پیدا نشد" است

---

## ✅ راه‌حل‌ها

### **راه‌حل ۱: غیرفعال کردن ویژگی lastUpdated** (توصیه می‌شود ✨)

این ساده‌ترین و سریع‌ترین راه حل است که **بدون نیاز به نصب Git** کار می‌کند.

#### مراحل:

1. فایل `docs/.vitepress/config.js` را باز کنید
2. بخش `lastUpdated` را پیدا کنید و کامنت کنید یا حذف کنید:

```javascript
// ❌ قبل از تغییر (باعث خطا می‌شود):
themeConfig: {
  // ...
  lastUpdated: {
    text: 'آخرین بروزرسانی',
    formatOptions: {
      dateStyle: 'short',
      timeStyle: 'short'
    }
  }
}

// ✅ بعد از تغییر (بدون خطا):
themeConfig: {
  // ...
  // lastUpdated غیرفعال شد تا از خطای Git جلوگیری شود
}
```

3. فایل را ذخیره کنید
4. دستور زیر را اجرا کنید:

```powershell
npm run dev
```

**نتیجه:** پروژه بدون خطا اجرا می‌شود! ✅

---

### **راه‌حل ۲: نصب و پیکربندی Git**

اگر می‌خواهید از ویژگی "آخرین بروزرسانی" استفاده کنید، باید Git را نصب کنید.

#### مرحله ۱: نصب Git

1. از [git-scm.com/download/win](https://git-scm.com/download/win) دانلود کنید
2. نصب کنید (تمام تنظیمات پیش‌فرض را قبول کنید)
3. **مهم:** در هنگام نصب، گزینه **"Add Git to PATH"** را انتخاب کنید

#### مرحله ۲: تست کردن

PowerShell یا CMD را ببندید و دوباره باز کنید، سپس:

```powershell
git --version
```

اگر خروجی شبیه این را دیدید، Git نصب شده است:
```
git version 2.43.0.windows.1
```

#### مرحله ۳: مقداردهی اولیه Git در پروژه

```powershell
cd "C:\Users\Emad\Documents\موقت\1"
git init
git add .
git commit -m "Initial commit"
```

حالا VitePress می‌تواند تاریخ آخرین بروزرسانی را نمایش دهد.

---

### **راه‌حل ۳: اضافه کردن دستی Git به PATH** (اگر نصب است ولی کار نمی‌کند)

#### روش اول: از طریق رابط گرافیکی

1. کلیک راست روی **This PC** → **Properties**
2. **Advanced system settings** → **Environment Variables**
3. در بخش **System variables**، متغیر **Path** را Edit کنید
4. **New** کلیک کنید و این مسیر را اضافه کنید:
   ```
   C:\Program Files\Git\cmd
   ```
5. دوباره **New** و این را اضافه کنید:
   ```
   C:\Program Files\Git\bin
   ```
6. **OK** → PowerShell را ببندید و دوباره باز کنید

#### روش دوم: از طریق PowerShell (نیاز به دسترسی Administrator)

```powershell
# اجرای PowerShell به عنوان Administrator
$env:Path += ";C:\Program Files\Git\cmd;C:\Program Files\Git\bin"
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)
```

بعد از آن PowerShell را ببندید و دوباره باز کنید.

---

## 🧪 تست نهایی

بعد از اعمال هر یک از راه‌حل‌ها:

### ۱. پاک کردن کش (اختیاری ولی توصیه می‌شود)

```powershell
Remove-Item -Recurse -Force docs\.vitepress\cache
Remove-Item -Recurse -Force docs\.vitepress\dist
Remove-Item -Recurse -Force node_modules\.vite
```

### ۲. اجرای پروژه

```powershell
npm run dev
```

### ۳. علائم موفقیت ✅

اگر پروژه بدون خطا اجرا شد، باید پیام‌های زیر را ببینید:

```
  vitepress v1.x.x

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
  ➜  press h to show help
```

اگر این پیام‌ها را دیدید و هیچ خطایی در console نیست، **تبریک! مشکل حل شد** 🎉

### ۴. باز کردن سایت

مرورگر خود را باز کنید و به آدرس زیر بروید:
```
http://localhost:5173
```

---

## 🎯 راه‌حل پیشنهادی من

برای پروژه شما **راه‌حل ۱** را توصیه می‌کنم:
- **سریع و آسان** است
- **هیچ نصب اضافی** نیاز ندارد
- برای یادگیری و توسعه کاملاً کافی است
- می‌توانید بعداً Git را اضافه کنید

---

## 📊 مقایسه راه‌حل‌ها

| راه‌حل | مزایا | معایب | زمان اجرا |
|--------|-------|--------|-----------|
| **غیرفعال کردن lastUpdated** | ✅ سریع<br>✅ بدون نیاز به Git<br>✅ بدون خطا | ❌ تاریخ بروزرسانی نمایش داده نمی‌شود | 1 دقیقه |
| **نصب Git** | ✅ تمام ویژگی‌ها فعال<br>✅ آماده برای GitHub | ❌ نیاز به دانلود و نصب<br>❌ 100+ MB حجم | 10-15 دقیقه |
| **اضافه به PATH** | ✅ Git قبلاً نصب است | ❌ نیاز به دسترسی Admin | 2-3 دقیقه |

---

## 🆘 رفع مشکلات احتمالی

### مشکل ۱: بعد از تغییر config.js هنوز خطا می‌دهد

**راه‌حل:**
```powershell
# کش را پاک کنید
Remove-Item -Recurse -Force docs\.vitepress\cache
npm run dev
```

### مشکل ۲: Git نصب است ولی دستور git --version کار نمی‌کند

**راه‌حل:**
1. PowerShell را **به عنوان Administrator** باز کنید
2. این دستور را اجرا کنید:
```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
```
3. PowerShell را ببندید و دوباره باز کنید (بدون Admin)
4. دوباره تست کنید: `git --version`

### مشکل ۳: پورت 5173 استفاده می‌شود

**راه‌حل:**
```powershell
# پورت دیگری استفاده کنید
npm run dev -- --port 3000
```

---

## 📝 خلاصه

### دستورات سریع برای شروع:

```powershell
# ۱. رفتن به پوشه پروژه
cd "C:\Users\Emad\Documents\موقت\1"

# ۲. پاک کردن کش (در صورت نیاز)
Remove-Item -Recurse -Force docs\.vitepress\cache -ErrorAction SilentlyContinue

# ۳. اجرای پروژه
npm run dev

# ۴. باز کردن در مرورگر
start http://localhost:5173
```

---

## 🎓 یادگیری بیشتر

- [مستندات رسمی VitePress](https://vitepress.dev)
- [پیکربندی VitePress](https://vitepress.dev/reference/site-config)
- [رفع مشکلات رایج](https://vitepress.dev/guide/troubleshooting)

---

## ✨ نکات مهم

1. **همیشه config.js را ذخیره کنید** قبل از اجرای مجدد
2. **کش را پاک کنید** اگر تغییرات اعمال نمی‌شود
3. **PowerShell را ببندید و باز کنید** بعد از تغییر PATH
4. برای **deploy در GitHub Pages**، Git لازم است

---

**✅ با اعمال این تغییرات، پروژه شما بدون هیچ خطایی اجرا می‌شود!**

اگر هنوز مشکل دارید، دقیقاً متن خطا را برایم بفرستید تا کمک کنم. 🚀

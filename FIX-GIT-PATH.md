# راه‌حل ۱: اضافه کردن Git به PATH ویندوز

## مراحل:

### روش اول: از طریق تنظیمات ویندوز

1. کلیک راست روی **This PC** یا **My Computer** → **Properties**
2. از منوی سمت چپ **Advanced system settings** را انتخاب کنید
3. روی دکمه **Environment Variables** کلیک کنید
4. در بخش **System variables** متغیر **Path** را پیدا کنید و **Edit** کنید
5. روی **New** کلیک کنید و مسیر زیر را اضافه کنید:
   ```
   C:\Program Files\Git\cmd
   ```
6. دوباره روی **New** کلیک کنید و این مسیر را هم اضافه کنید:
   ```
   C:\Program Files\Git\bin
   ```
7. **OK** را بزنید و PowerShell/CMD را ببندید و دوباره باز کنید

### روش دوم: از طریق PowerShell (Admin)

```powershell
# افزودن Git به PATH (نیاز به اجرای PowerShell به عنوان Administrator)
$gitPath = "C:\Program Files\Git\cmd"
$currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
[Environment]::SetEnvironmentVariable("Path", "$currentPath;$gitPath", "Machine")
```

### تست کردن:

```powershell
# بستن PowerShell و باز کردن مجدد، سپس:
git --version
```

اگر نسخه Git نمایش داده شد، مشکل حل شده است.

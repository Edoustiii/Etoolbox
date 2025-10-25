# اسکریپت تست و رفع خودکار خطای Git در VitePress
# نویسنده: Emad Dousti
# تاریخ: 2025-10-25

Write-Host "🔍 شروع تشخیص و رفع خطای Git در VitePress..." -ForegroundColor Cyan
Write-Host ""

# تابع چک کردن وجود Git
function Test-GitInstallation {
    try {
        $gitVersion = git --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Git نصب شده است: $gitVersion" -ForegroundColor Green
            return $true
        }
    }
    catch {
        Write-Host "❌ Git یافت نشد یا در PATH قرار ندارد" -ForegroundColor Red
        return $false
    }
    return $false
}

# تابع چک کردن فایل config.js
function Test-VitePressConfig {
    $configPath = "docs\.vitepress\config.js"
    
    if (Test-Path $configPath) {
        Write-Host "✅ فایل config.js پیدا شد" -ForegroundColor Green
        
        $content = Get-Content $configPath -Raw
        
        if ($content -match "lastUpdated:\s*\{") {
            Write-Host "⚠️  ویژگی lastUpdated فعال است - احتمال خطای Git وجود دارد" -ForegroundColor Yellow
            return $false
        }
        else {
            Write-Host "✅ ویژگی lastUpdated غیرفعال است یا کامنت شده" -ForegroundColor Green
            return $true
        }
    }
    else {
        Write-Host "❌ فایل config.js پیدا نشد!" -ForegroundColor Red
        return $false
    }
}

# تابع پاک کردن کش
function Clear-VitePressCache {
    Write-Host ""
    Write-Host "🧹 پاک کردن کش VitePress..." -ForegroundColor Cyan
    
    $paths = @(
        "docs\.vitepress\cache",
        "docs\.vitepress\dist",
        "node_modules\.vite"
    )
    
    foreach ($path in $paths) {
        if (Test-Path $path) {
            Remove-Item -Recurse -Force $path -ErrorAction SilentlyContinue
            Write-Host "  ✓ پاک شد: $path" -ForegroundColor Gray
        }
    }
    
    Write-Host "✅ کش پاک شد" -ForegroundColor Green
}

# تابع رفع خودکار
function Fix-GitError {
    Write-Host ""
    Write-Host "🔧 رفع خودکار مشکل..." -ForegroundColor Cyan
    
    $configPath = "docs\.vitepress\config.js"
    
    if (Test-Path $configPath) {
        $content = Get-Content $configPath -Raw
        
        # کامنت کردن بخش lastUpdated
        $pattern = "(?s)(// تنظیمات آخرین بروزرسانی\s*)lastUpdated:\s*\{[^}]+\}"
        $replacement = '$1// lastUpdated غیرفعال شد برای جلوگیری از خطای Git' + "`n    // اگر Git نصب کردید، این خط را uncomment کنید"
        
        $newContent = $content -replace $pattern, $replacement
        
        if ($newContent -ne $content) {
            Set-Content -Path $configPath -Value $newContent -Encoding UTF8
            Write-Host "✅ فایل config.js اصلاح شد" -ForegroundColor Green
            return $true
        }
        else {
            Write-Host "ℹ️  نیازی به تغییر نیست" -ForegroundColor Blue
            return $true
        }
    }
    
    return $false
}

# شروع عملیات
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "  تشخیص وضعیت سیستم" -ForegroundColor White
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

# چک کردن Git
$gitInstalled = Test-GitInstallation
Write-Host ""

# چک کردن config
$configOk = Test-VitePressConfig
Write-Host ""

# تصمیم‌گیری
if (-not $gitInstalled -and -not $configOk) {
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host "  🔧 رفع خودکار مشکل" -ForegroundColor White
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    
    Write-Host ""
    Write-Host "Git نصب نیست و config.js نیاز به اصلاح دارد." -ForegroundColor Yellow
    Write-Host ""
    
    $choice = Read-Host "آیا می‌خواهید config.js را به صورت خودکار اصلاح کنم؟ (Y/N)"
    
    if ($choice -eq "Y" -or $choice -eq "y" -or $choice -eq "") {
        if (Fix-GitError) {
            Clear-VitePressCache
            
            Write-Host ""
            Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
            Write-Host "  ✅ مشکل برطرف شد!" -ForegroundColor White
            Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
            Write-Host ""
            Write-Host "🚀 اکنون می‌توانید پروژه را اجرا کنید:" -ForegroundColor Cyan
            Write-Host "   npm run dev" -ForegroundColor White
            Write-Host ""
        }
    }
}
elseif ($gitInstalled -and -not $configOk) {
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
    Write-Host "  ℹ️  اطلاعات" -ForegroundColor White
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
    Write-Host ""
    Write-Host "Git نصب است. می‌توانید از ویژگی lastUpdated استفاده کنید." -ForegroundColor Blue
    Write-Host "ابتدا باید مخزن Git را مقداردهی کنید:" -ForegroundColor Blue
    Write-Host ""
    Write-Host "  git init" -ForegroundColor White
    Write-Host "  git add ." -ForegroundColor White
    Write-Host "  git commit -m 'Initial commit'" -ForegroundColor White
    Write-Host ""
}
else {
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
    Write-Host "  ✅ همه چیز آماده است!" -ForegroundColor White
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
    Write-Host ""
    Write-Host "پروژه شما آماده اجرا است:" -ForegroundColor Green
    Write-Host "  npm run dev" -ForegroundColor White
    Write-Host ""
}

# راهنمای اضافی
Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "  📚 راهنمای بیشتر" -ForegroundColor White
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Write-Host "برای جزئیات بیشتر فایل FIX-GIT-ERROR.md را مطالعه کنید." -ForegroundColor Gray
Write-Host ""

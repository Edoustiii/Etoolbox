# EmadT3ch Tools - اجرای سرور توسعه

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  EmadT3ch Tools - Dev Server" -ForegroundColor Yellow
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# فعال‌سازی اجرای اسکریپت برای این جلسه
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# رفتن به پوشه پروژه
Set-Location -Path "c:\Users\Emad\Documents\موقت\1"

Write-Host "✅ پوشه پروژه: " -NoNewline -ForegroundColor Green
Write-Host (Get-Location).Path -ForegroundColor White
Write-Host ""

# اجرای سرور
Write-Host "🚀 در حال راه‌اندازی سرور..." -ForegroundColor Magenta
Write-Host ""

npm run dev

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  سرور متوقف شد" -ForegroundColor Red
Write-Host "==================================" -ForegroundColor Cyan

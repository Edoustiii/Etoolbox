import { defineConfig } from 'vitepress'

export default defineConfig({
  // متادیتا و اطلاعات سایت
  title: 'EmadT3ch Tools',
  description: 'لیست بهترین برنامه‌ها و وبسایت‌های کاربردی برای Windows و Android',
  lang: 'fa-IR',
  
  // تنظیمات Head
  head: [
    ['link', { rel: 'icon', type: 'image/svg+xml', href: '/Assets/emadtech-neon.svg' }],
    ['meta', { name: 'theme-color', content: '#0d1117' }],
    ['meta', { name: 'author', content: 'Emad Dousti' }],
    ['meta', { property: 'og:type', content: 'website' }],
    ['meta', { property: 'og:title', content: 'EmadT3ch Tools' }],
    ['meta', { property: 'og:description', content: 'لیست بهترین برنامه‌ها و وبسایت‌های کاربردی برای Windows و Android' }],
    ['meta', { name: 'viewport', content: 'width=device-width, initial-scale=1.0' }],
    // فونت Vazirmatn از CDN
    ['link', { rel: 'preconnect', href: 'https://fonts.googleapis.com' }],
    ['link', { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' }],
    ['link', { href: 'https://fonts.googleapis.com/css2?family=Vazirmatn:wght@300;400;500;600;700&display=swap', rel: 'stylesheet' }],
    ['link', { href: 'https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap', rel: 'stylesheet' }],
  ],

  // تنظیمات تم
  themeConfig: {
    // لوگو
    logo: '/Assets/emadtech-neon.svg',
    siteTitle: 'EmadT3ch Tools',

    // منوی بالای صفحه
    nav: [
      { text: '🏠 خانه', link: '/Etoolbox' },
      { text: '📖 درباره', link: '/about' },
      { text: '📖 مطالب آموزشی', link: '/learning' },
    ],

    // منوی کناری (اختیاری)
    sidebar: false,

    // فوتر
    footer: {
      message: '🌟 Designed & Built with ❤️ by Emad Dousti',
      copyright: '📱 <a href="https://t.me/EmadT3ch" target="_blank" style="color: #58a6ff;">@EmadT3ch</a> | © 2025 EmadT3ch Tools'
    },

    // دکمه ویرایش در GitHub (اختیاری)
    editLink: {
      pattern: 'https://github.com/yourusername/emadtech-tools/edit/main/docs/:path',
      text: 'ویرایش این صفحه در GitHub'
    },

    // جستجو محلی
    search: {
      provider: 'local',
      options: {
        locales: {
          fa: {
            translations: {
              button: {
                buttonText: 'جستجو',
                buttonAriaLabel: 'جستجو'
              },
              modal: {
                noResultsText: 'نتیجه‌ای یافت نشد',
                resetButtonTitle: 'پاک کردن',
                footer: {
                  selectText: 'انتخاب',
                  navigateText: 'پیمایش'
                }
              }
            }
          }
        }
      }
    },

    // لینک‌های اجتماعی
    socialLinks: [
      { icon: 'github', link: 'https://github.com/yourusername' },
      { 
        icon: {
          svg: '<svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Telegram</title><path d="M11.944 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.056 0zm4.962 7.224c.1-.002.321.023.465.14a.506.506 0 0 1 .171.325c.016.093.036.306.02.472-.18 1.898-.962 6.502-1.36 8.627-.168.9-.499 1.201-.82 1.23-.696.065-1.225-.46-1.9-.902-1.056-.693-1.653-1.124-2.678-1.8-1.185-.78-.417-1.21.258-1.91.177-.184 3.247-2.977 3.307-3.23.007-.032.014-.15-.056-.212s-.174-.041-.249-.024c-.106.024-1.793 1.14-5.061 3.345-.48.33-.913.49-1.302.48-.428-.008-1.252-.241-1.865-.44-.752-.245-1.349-.374-1.297-.789.027-.216.325-.437.893-.663 3.498-1.524 5.83-2.529 6.998-3.014 3.332-1.386 4.025-1.627 4.476-1.635z"/></svg>'
        }, 
        link: 'https://t.me/EmadT3ch' 
      }
    ],

    // تنظیمات outline
    outline: {
      level: [2, 3],
      label: 'فهرست مطالب'
    },

    // متن‌های سفارشی
    docFooter: {
      prev: 'صفحه قبل',
      next: 'صفحه بعد'
    },

    sidebarMenuLabel: 'منو',
    returnToTopLabel: 'بازگشت به بالا',
    langMenuLabel: 'تغییر زبان',

    // تنظیمات آخرین بروزرسانی
    // ⚠️ غیرفعال شده برای جلوگیری از خطای Git
    // lastUpdated: {
    //   text: 'آخرین بروزرسانی',
    //   formatOptions: {
    //     dateStyle: 'short',
    //     timeStyle: 'short'
    //   }
    // }
  },

  // تنظیمات Markdown
  markdown: {
    theme: {
      light: 'github-light',
      dark: 'github-dark'
    },
    lineNumbers: false,
    container: {
      tipLabel: '💡 نکته',
      warningLabel: '⚠️ هشدار',
      dangerLabel: '❌ خطر',
      infoLabel: 'ℹ️ اطلاعات',
      detailsLabel: 'جزئیات'
    }
  },

  // تنظیمات Build
  base: '/',
  outDir: './docs/.vitepress/dist',
  cacheDir: './docs/.vitepress/cache',
  cleanUrls: true,
  
  // بهینه‌سازی
  vite: {
    build: {
      minify: 'terser',
      chunkSizeWarningLimit: 1000
    }
  },

  // حالت تاریک پیش‌فرض (غیرقابل تغییر)
  appearance: 'dark',
  
  // غیرفعال کردن دکمه تغییر تم
  appearanceToggle: false,

  // تنظیمات sitemap (اختیاری)
  sitemap: {
    hostname: 'https://yourusername.github.io/emadtech-tools'
  }
})

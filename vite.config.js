import { defineConfig } from 'vite'

export default defineConfig({
  // تنظیمات برای جلوگیری از خطای Git
  server: {
    watch: {
      usePolling: true,
      interval: 100
    }
  },
  
  // تنظیمات بیلد
  build: {
    rollupOptions: {
      onwarn(warning, warn) {
        // نادیده گرفتن هشدارهای مربوط به Git
        if (warning.code === 'PLUGIN_WARNING' && warning.message.includes('git')) {
          return
        }
        warn(warning)
      }
    }
  },

  // تنظیمات بهینه‌سازی
  optimizeDeps: {
    exclude: ['vitepress']
  }
})

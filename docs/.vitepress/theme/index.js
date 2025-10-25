// docs/.vitepress/theme/index.js
import DefaultTheme from 'vitepress/theme'
import './style.css'

export default {
  extends: DefaultTheme,
  enhanceApp({ app, router, siteData }) {
    // می‌توانید اینجا plugin‌های اضافی اضافه کنید
  }
}

import Vue from 'vue'
import App from './App.vue'
import router from './router'
// 引入初始化normalize.css
import 'normalize.css/normalize.css'
// 引入less
import '@/assets/css/theme.less'
// 引入svg全局组件注册
import '@/assets/icons/index';
//中英文切换
import VueI18n from 'vue-i18n'
import ZH from '@/lang/zh.js'
import EN from '@/lang/en.js'
Vue.use(VueI18n)
const i18n=new VueI18n({
    locale: localStorage.getItem('languageSet')||'zh',   //从localStorage里获取用户中英文选择，没有则默认中文
    messages:{
        'zh': ZH,
        'en': EN
    }
})


Vue.config.productionTip = false

new Vue({
  router,
  i18n,
  render: h => h(App),
}).$mount('#app')

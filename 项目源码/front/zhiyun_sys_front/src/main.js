import Vue from 'vue'
import App from './App.vue'
import router from './router'
// 引入初始化normalize.css
import 'normalize.css/normalize.css'
// 引入less
import '@/assets/css/theme.less'
// 引入svg全局组件注册
import '@/assets/icons/index';
// Animate动画效果
import animate from 'animate.css'
// 引入iconfont
import '@/assets/icons/iconfont/iconfont.css'
// Elementui
import ElementUI from 'element-ui';
// 自定义主题
import '@/style/theme/index.css'
Vue.use(ElementUI);
// 引入vuex
import store from './store'
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

//引入echarts
import * as echarts from 'echarts'
//引入vue-echarts
import VueEcharts from 'vue-echarts'

//注册为全局组件
Vue.component('v-chart', VueEcharts)
Vue.prototype.$echarts = echarts

Vue.config.productionTip = false

new Vue({
  store,
  router,
  i18n,
  render: h => h(App),
}).$mount('#app')

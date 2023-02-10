import Vue from 'vue'
import App from './App.vue'
import router from './router'
// 引入初始化normalize.css
import 'normalize.css/normalize.css'
import '@/assets/css/theme.less'


Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')

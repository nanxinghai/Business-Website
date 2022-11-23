import Vue from 'vue'
import App from './App.vue'
// 引入router文件夹下的index.js
import router from './router'
import store from './store'
// 引入全局CSS
import '@/assets/css/index.less'
// 引入初始化normalize.css
import 'normalize.css/normalize.css'
// 按需引入elementui
import { Col,Row } from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(Col)
Vue.use(Row)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')

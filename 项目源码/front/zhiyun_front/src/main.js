import Vue from 'vue'
import App from './App.vue'
// 引入router文件夹下的index.js
import router from './router'
import store from './store'
// 引入全局CSS
import '@/assets/css/index.less'
// 引入初始化normalize.css
import 'normalize.css/normalize.css'
// 引入图标库
import '@/assets/iconfont/iconfont.css'
// 全屏滚动 vue-fullpage.js
import 'fullpage.js/vendors/scrolloverflow';
import VueFullPage from 'vue-fullpage.js';
Vue.use(VueFullPage);
// Animate动画效果
import animate from 'animate.css'
// 引入svg全局组件注册
import '@/assets/icons/index';
// 按需引入elementui
import { Col,Row,Divider,Message } from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css'
// 引入elementui的隐藏属性(响应式隐藏元素)
import 'element-ui/lib/theme-chalk/display.css';
Vue.use(Col)
Vue.use(Row)
Vue.use(Divider)
Vue.prototype.$message = Message;

Vue.config.productionTip = false


new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')

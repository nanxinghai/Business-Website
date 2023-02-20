import Vue from 'vue'
import Vuex from 'vuex'
// 菜单侧边栏
import menuOptions from '@/store/aside/index.js'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    menuOptions
  }
})
export default store
import Vue from 'vue'
import Vuex from 'vuex'
// 菜单侧边栏
import menuOptions from '@/store/aside/index.js'
// tag数组
import tagOptions  from '@/store/tag/index.js'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    menuOptions,
    tagOptions
  }
})
export default store
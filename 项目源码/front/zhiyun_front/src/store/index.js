import Vue from 'vue'
import Vuex from 'vuex'
// 引入菜单权限下的store
import menu from './menu'

Vue.use(Vuex)

// Vuex的模块化
const store = new Vuex.Store({
    modules:{
        menu
    }
})
export default store
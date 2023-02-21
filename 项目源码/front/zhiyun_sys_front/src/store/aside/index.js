import {IsChildren} from './method.js'
const menuOptions = {
    namespaced: true,//开启命名空间
    actions:{
        changeCollapse(context,value){
            context.commit('CHANGECOLLAPSE')
        },
        changeMenu(context,value){
            context.commit('CHANGEMENU',value)
        },
        clearMenu(context,value){
            context.commit('CLEARMENU',value)
        }
    },
    mutations:{
        // 切换isCollapse的值
        CHANGECOLLAPSE(state,value){
            state.isCollapse = !state.isCollapse
        },
        // 改变路由
        CHANGEMENU(state,value){
            state.menu = value
            sessionStorage.setItem('menuinfo',JSON.stringify(value))
        },
        // 清除
        CLEARMENU(state,value){
            state.menu = []
            sessionStorage.removeItem('menuinfo')
        },
        // 添加路由 
        ADDROUTER(state,router){
            // 从sessionStorage中取出菜单信息
            let menuinfo = sessionStorage.getItem('menuinfo')
            // 解决因为刷新Vuex数据被清空 而从sessionStorage取出赋值给Vuex
            if(state.menu.length === 0)
            state.menu = JSON.parse(menuinfo) || []
            // 待添加的路由
            let toBeAddRoute = []
            if(router.options.routes[0].children.length === 0){
                state.menu.forEach(element => {
                    let route = IsChildren(element)
                    toBeAddRoute = toBeAddRoute.concat(route)
                });
            }
            // 404页面
            let error = {
                name:'error',
                path:'error',
                component: () => import(`@/views/error/index.vue`)
            }
            toBeAddRoute.push(error)
            toBeAddRoute.forEach(e => {
                router.addRoute('root',e)
            })
        }
    },
    state:{
        isCollapse: false, // 侧边栏是否折叠
        menu:[]
    },
    getters:{
        title(state){
            if(state.isCollapse){
                return "后台"
            }else{
                return "通用后台管理系统"
            }
        }
    }
}
export default menuOptions
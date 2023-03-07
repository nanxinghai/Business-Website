import VueRouter from 'vue-router'
import Vue from 'vue'
import {IsChildren} from '@/store/aside/method.js'
// 引入store
import store from '@/store/index.js'
Vue.use(VueRouter)

// 路由规则
const route = [
    {
        name: 'root',
        path: '/',
        component: ()=> import('@/views/main.vue'),
        redirect: '/home',
        children: [
            // {
            //     name: 'home',
            //     path: 'home',
            //     component: () => import('@/views/home/index.vue')
            // }
        ]
    },
    {
        name: 'login',
        path: '/login',
        component: () => import('@/views/login/index.vue')
    }
]

const router = new VueRouter({
    // mode:'history',
    routes:route
})

/**
 * 判断当前路由是否存在
 * @param to
 * @returns {boolean}
 */
 function hasRoute(to) {
    let find = router.getRoutes().find(item => item.name === to.name);
    return !!find;

}
/**
 * 页面刷新后vuerouter数据丢失
 */
function addRouteBecauseFresh(){
    // // 待添加的路由
    // let toBeAddRoute = []
    // let menuinfo = JSON.parse(sessionStorage.getItem('menuinfo'))
    // if(menuinfo !== null){
    //     menuinfo.forEach(element => {
    //         let route = IsChildren(element)
    //         toBeAddRoute = toBeAddRoute.concat(route)
    //     });
    //     toBeAddRoute.forEach(e => {
    //         router.addRoute('root',e)
    //     })
    // }
    store.commit('menuOptions/ADDROUTER',router)
}
/**
 * 页面刷新后vuex的menu数据丢失
 */
function addAsideBecauseFresh(){
    let menuinfo = JSON.parse(sessionStorage.getItem('menuinfo'))
    if(menuinfo !== null){
        store.commit('menuOptions/CLEARMENU')
        store.commit('menuOptions/CHANGEMENU',menuinfo)
    }
}

// 全局前置路由
router.beforeEach((to, from, next) => {
    let token = localStorage.getItem('token')
    // 访问路径不是登录页面 需检查token
    if(to.name != 'login'){
        if(token ==='' || token === undefined || token === null){
            next({name:'login'})
        }else{
            // 如果路由不存在，表示因为刷新而丢失了router
            if(!hasRoute(to)){
                addRouteBecauseFresh()
                addAsideBecauseFresh()
                // 添加完路由后 必须需要替换，可以禁止历史记录（搞了半天）
                router.replace({...to});
            }
            if(to.query.code || to.query.state){
                const newto = {...to}
                delete newto.query.code
                delete newto.query.state
                router.replace(newto)
            }else{
                next()
            }
        }
    }else{
        
        next()
    }
})

// 全局后置路由
router.afterEach((to,from) => {
    // console.log("to",to)
    // console.log("from",from)
})

export default router
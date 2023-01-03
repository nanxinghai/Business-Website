import VueRouter from 'vue-router'
import Vue from 'vue'
import store from '@/store'

Vue.use(VueRouter)

// 路由规则
const route = [
    // 路由重定向
    {
        path: '/',
        redirect: '/homePage'
    },
    {
        name: '404',
        path: '/error',
        component: () => import('@/views/error/index.vue')
    }
]

//创建方法
const createRouter = () => new VueRouter({
    mode: 'hash',
    routes: route
})

const router = createRouter()


/**
 * 判断当前路由是否存在
 * @param to
 * @returns {boolean}
 */
function hasRoute(to) {
    let find = router.getRoutes().find(item => item.name === to.name);
    return !!find;

}

// 全局前置路由
router.beforeEach((to, from, next) => {
    // 判断是否有该路由,没有才添加(我搞了一天的重复添加问题)
    if (!hasRoute(to)) {
        let menurouter = store.state.menu.menurouter
        let newrouter = []
        menurouter.forEach((value, index) => {
            let obj = {
                name: value.name,
                path: value.path,
                component: () => import(`@/views/${value.name}/index.vue`)
            }
            newrouter.push(obj)
        });
        // 如果路由都不满足,跳转至404页面,必须添加在最后
        newrouter.push({
            path: '*',
            redirect: '/error'
        })
        // 动态添加路由
        router.addRoutes(newrouter)
        next(to.fullPath)
    } else {
        next()
    }
})


export default router
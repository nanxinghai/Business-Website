import VueRouter from 'vue-router'
import Vue from 'vue'

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
        name: 'Login',
        path: '/login',
        component: () => import('@/views/login/index.vue')
    }
]

const router = new VueRouter({
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

// 全局前置路由
router.beforeEach((to, from, next) => {
    next()
})

// 全局后置路由
router.afterEach((to,from) => {
    // console.log("to",to)
    // console.log("from",from)
})

export default router
export default {
    namespaced: true,//开启命名空间,只有开启这个才能使用模块化
    state:{
        menurouter:[
            {
                name:'homePage',
                path:'/homePage',
                // component:() => import('@/views/homePage/index.vue')
            },
            {
                name:'serviceScope',
                path:'/serviceScope',
                // component:() => import('@/views/serviceScope/index.vue')
            },
            {
                name:'processExample',
                path:'/processExample',
                // component:() => import('@/views/processExample/index.vue')
            },
            {
                name:'aboutUs',
                path:'/aboutUs',
                // component:() => import('@/views/aboutUs/index.vue')
            },
        ]   
    },
    actions:{
        // 更新路由
        setMenuRouter(context,value){
            context.commit('SETMENUROUTER',value)
        }
    },
    mutations:{
        // 更新路由数组
        SETMENUROUTER(state,value){
            state.menurouter = value
        }
    }
}
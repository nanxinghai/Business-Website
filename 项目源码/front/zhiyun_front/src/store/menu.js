export default {
    namespaced: true,//开启命名空间,只有开启这个才能使用模块化
    state:{
        menurouter:[]   
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
const tagOptions = {
  namespaced: true,//开启命名空间
  actions:{
      // 添加面包屑
      addTag(context,value){
        let flag = false
        for(let item of context.state.tags){
            if(item.name == value.name){
                flag = true
            }
        }
        if(flag) return
        context.commit('ADDTAG',value)
      },
      // 减少面包屑
      deleteTag(context,value){
        let flag = -1
        context.state.tags.forEach((item,index) => {
            if(item.name == value.name){
                flag = index
            }
        })
        context.commit('DELETETAG',flag)
      }
  },
  mutations:{
    ADDTAG(state,value){
      state.tags.push(value)
    },
    DELETETAG(state,index){
      state.tags.splice(index,1)
    }
  },
  state:{
    tags:[
      {
          label:"首页",
          name:"home",
          path:"/home",
      }
    ]
  },
  getters:{
      
  }
}

export default tagOptions
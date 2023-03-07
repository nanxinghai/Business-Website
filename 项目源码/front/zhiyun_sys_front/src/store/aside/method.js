/**
 *  判断是否有children从而决定是否添加路由
 * @param {*} obj 返回的添加路由
 * @param {*} ele 
 */
export const IsChildren = (ele)=> {
  let obj = []
            if(ele.hasOwnProperty('children')  && ele.children.length !== 0){
                let elchildren = ele.children
                elchildren.forEach(e => {
                    // 如果还有children
                    if(e.hasOwnProperty('children') && e.children.length !== 0){
                        this.IsChildren(e.children)
                    }else{
                        let data = {}
                        data.name = e.path
                        data.path = e.path
                        data.component = () => import(`@/views/${e.path}/index.vue`)
                        data.meta = e
                        obj.push(data)
                    }
                })
                return obj
            }else{
                let o = {}
                o.name = ele.path
                o.path = ele.path
                o.component = () => import(`@/views/${ele.path}/index.vue`)
                o.meta = ele
                obj.push(o)
                return obj
  }
}
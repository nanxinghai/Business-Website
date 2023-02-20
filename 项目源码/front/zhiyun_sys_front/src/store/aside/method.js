/**
 *  判断是否有children从而决定是否添加路由
 * @param {*} obj 返回的添加路由
 * @param {*} ele 
 */
export const IsChildren = (ele)=> {
  let obj = []
            if(ele.hasOwnProperty('children')){
                let elchildren = ele.children
                elchildren.forEach(e => {
                    // 如果还有children
                    if(e.hasOwnProperty('children')){
                        this.IsChildren(e.children)
                    }else{
                        let data = {}
                        data.name = e.name
                        data.path = e.name
                        data.component = () => import(`@/views/${e.name}/index.vue`)
                        data.meta = e
                        obj.push(data)
                    }
                })
                return obj
            }else{
                let o = {}
                o.name = ele.name
                o.path = ele.name
                o.component = () => import(`@/views/${ele.name}/index.vue`)
                o.meta = ele
                obj.push(o)
                return obj
  }
}
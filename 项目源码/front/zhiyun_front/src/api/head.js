import instance from '@/api'

// 查询启用菜单路由
export const getMenuData = function(obj) {
    let data =  instance({
        params: obj,
        method:'get',
        url:'/menu/getMenuData'
    })
    return data
}

// 数据
export const insertData = ((obj) => {
    return instance({
        params: obj,
        method:'get',
        url:'/log/insertData'
    })
})
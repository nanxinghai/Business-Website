import instance from '@/api'

// 查询启用菜单路由
export const getMenuData = ((obj) => {
    return instance({
        params: obj,
        method:'get',
        url:'/menu/getMenuData'
    })
})
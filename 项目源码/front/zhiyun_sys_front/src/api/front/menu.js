import instance from '@/axios'

// 查询前台菜单列表，分页
export const pageList = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/menu/pageList'
    })
})

// 编辑前台菜单
export const editMenu = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/menu/editMenu'
    })
})

// 新增前台菜单
export const addOne = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/menu/addOne'
    })
})
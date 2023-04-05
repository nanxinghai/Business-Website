import instance from '@/axios'

// 查询前台菜单列表，分页
export const pageList = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/menu/pageList'
    })
})
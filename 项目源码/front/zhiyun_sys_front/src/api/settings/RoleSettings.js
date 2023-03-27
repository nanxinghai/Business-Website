import instance from '@/axios'

// 查询角色列表，分页
export const pageListRole = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/roleSettings/pageListRole'
    })
})
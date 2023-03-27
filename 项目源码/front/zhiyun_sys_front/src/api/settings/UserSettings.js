import instance from '@/axios'

// 查询用户列表，分页
export const pageListUser = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/userSettings/pageListUser'
    })
})
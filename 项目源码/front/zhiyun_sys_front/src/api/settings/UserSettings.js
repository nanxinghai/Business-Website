import instance from '@/axios'

// 查询用户列表，分页
export const pageListUser = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/userSettings/pageListUser'
    })
})

// 添加用户列表
export const addOneUser = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/userSettings/addOneUser'
    })
})

// 查询用户角色
export const queryUserRole = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/userSettings/queryUserRole'
    })
})

// 更改用户角色
export const changeUserRole = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/userSettings/changeUserRole'
    })
})
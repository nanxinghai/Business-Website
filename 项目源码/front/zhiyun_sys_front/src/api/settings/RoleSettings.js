import instance from '@/axios'

// 查询角色列表，分页
export const pageListRole = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/roleSettings/pageListRole'
    })
})

// 添加角色列表
export const addOneRole = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/roleSettings/addOneRole'
    })
})

// 查询角色权限
export const queryRolePer = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/roleSettings/queryRolePer'
    })
})

// 更改角色权限
export const changeRolePer = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/roleSettings/changeRolePer'
    })
})

// 禁用角色状态
export const forbbinStatus = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/roleSettings/forbbinStatus'
    })
})

// 恢复角色状态
export const returnStatus = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/roleSettings/returnStatus'
    })
})
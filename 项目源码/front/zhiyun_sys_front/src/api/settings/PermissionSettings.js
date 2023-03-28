import instance from '@/axios'

// 查询权限列表，分页
export const pageListPer = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/permissionSettings/pageListPer'
    })
})

// 添加权限列表
export const addOnePer = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/permissionSettings/addOnePer'
    })
})

// 添加权限列表
export const editOnePer = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/permissionSettings/editOnePer'
    })
})


// 停用权限数据
export const stopStatus = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/permissionSettings/stopStatus'
    })
})

// 恢复权限数据
export const returnStatus = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/permissionSettings/returnStatus'
    })
})
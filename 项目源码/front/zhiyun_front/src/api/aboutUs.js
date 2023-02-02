import instance from '@/api'

// 查询相关联系我们数据
export const getContactData = ((obj) => {
    return instance({
        params: obj,
        method:'get',
        url:'/contact/getContactData'
    })
})

// 添加需求
export const addDemand = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/demand/add'
    })
})
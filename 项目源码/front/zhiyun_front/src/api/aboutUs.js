import instance from '@/api'

// 查询相关联系我们数据
export const getContactData = ((obj) => {
    return instance({
        params: obj,
        method:'get',
        url:'/contact/getContactData'
    })
})
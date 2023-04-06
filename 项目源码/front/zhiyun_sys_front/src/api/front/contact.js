import instance from '@/axios'

// 查询联系我们信息
export const getContact = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/contact/getContact'
    })
})

// 编辑联系我们信息
export const edidContact = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/contact/edidContact'
    })
})
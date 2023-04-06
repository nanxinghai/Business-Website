import instance from '@/axios'

// 查询底部设置号码列表
export const pageList = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/foot/pageList'
    })
})

// 编辑底部设置号码
export const editSysPhone = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/foot/editSysPhone'
    })
})

// 添加底部设置号码
export const addOne = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/foot/addOne'
    })
})

// 获取底部设置号二维码
export const getOne = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/foot/getOne'
    })
})

// 上传底部设置二维码
export const uploadQrcode = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/foot/uploadQrcode'
    })
})
import instance from '@/axios'

// 用户名登录
export const getLogData = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/home/getLogData'
    })
})
import instance from '@/axios'

export const phoneNumLogin = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/login'
    })
})
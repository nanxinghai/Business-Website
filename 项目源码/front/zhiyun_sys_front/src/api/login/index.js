import instance from '@/axios'

// 用户名登录
export const phoneNumLogin = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/login'
    })
})

// 发送验证码
export const getSmsCode = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/getSmsCode'
    })
})

// 验证码登录
export const codeLogin = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/codeLogin'
    })
})

// 微信扫码回调
export const weChatCallBack = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/weChatCallBack'
    })
})
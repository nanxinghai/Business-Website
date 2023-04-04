import instance from '@/axios'

// 查询当前个人信息
export const getPersonInfo = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/personal/getPersonInfo'
    })
})

// 更新当前个人信息
export const editUser = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/personal/editUser'
    })
})
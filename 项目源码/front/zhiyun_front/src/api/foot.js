import instance from '@/api'

// 查询底部数据
export const getFootData = ((obj) => {
    return instance({
        params: obj,
        method:'get',
        url:'/foot/getFootData'
    })
})
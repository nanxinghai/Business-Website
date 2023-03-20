import instance from '@/axios'

// 获取首页表格数据
export const getLogData = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/home/getLogData'
    })
})

// 获取PV、UV数据
export const getPUvData = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/home/getPUvData'
    })
})
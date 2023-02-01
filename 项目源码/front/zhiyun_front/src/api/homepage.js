import instance from '@/api'

// 查询轮播图数据
export const getSwiperData = ((obj) => {
    return instance({
        params: obj,
        method:'get',
        url:'/swiper/getSwiperData'
    })
})
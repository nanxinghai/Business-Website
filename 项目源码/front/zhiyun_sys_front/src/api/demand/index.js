import instance from '@/axios'

// 查询需求列表，分页
export const pageList = ((obj) => {
    return instance({
        data: obj,
        method:'post',
        url:'/sys/demand/pageList'
    })
})

// 更改需求状态
export const updateIsRelation = ((obj) => {
  return instance({
      data: obj,
      method:'post',
      url:'/sys/demand/updateIsRelation'
  })
})
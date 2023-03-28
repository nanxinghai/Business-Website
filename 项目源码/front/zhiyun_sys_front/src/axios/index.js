import axios from "axios"
import {Message} from 'element-ui'

const instance = axios.create({
  baseURL:'http://localhost:80/'
})

// 添加请求拦截器
instance.interceptors.request.use(function (config) {
  let userInfo = JSON.parse(localStorage.getItem('userInfo'))
  let token = localStorage.getItem('token')
  if(userInfo !== null && userInfo !== undefined && token !== null && token !== undefined){
    config.headers['token'] = token
  }
  return config;
}, function (error) {
  return Promise.reject(error);
});

// 添加响应拦截器
instance.interceptors.response.use(function (response) {
  if(response.data.code === 0){
    return response.data;
  }else {
    // 错误信息的提示框
    Message({
      type: 'error',
      message: response.data.msg,
      showClose: true,
    })
  }
  return Promise.reject(response)
}, function (error) {
  return Promise.reject(error);
});

export default instance
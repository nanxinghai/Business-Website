<template>
  <div class="containers">
    <div class="head">
      <div class="left_logo">
        <svg-icon icon-class="common_logo"></svg-icon>
      </div>
      <div class="right_changelang">
        <div class="in_box">
          <ChangeLang></ChangeLang>
        </div>
      </div>
    </div>
    <div class="body">
      <!-- 左图 -->
      <div class="left_img">
        <img :src="require('@/assets/img/login_bg.png')" alt="">
      </div>
      <!-- 右盒子 -->
      <div class="right_box">
        <!-- 手机号登录 -->
        <transition enter-active-class="animated fadeInLeft"
        >
          <div class="login_box" v-if="loginMethod === 'phoneLogin'" :class="loginMethod === 'phoneLogin' ? '' : 'hidden'">
            <h1>{{$t('login.title')}}</h1>
            <!-- 副标题 -->
            <div class="sub_title">
              <span :class="{'active':subLogin}" @click="switchSubLogin(true)">{{$t('login.subTitle1')}}</span>
              <span class="two" :class="{'active':!subLogin}" @click="switchSubLogin(false)">{{$t('login.subTitle2')}}</span>
            </div>
            <!-- 密码登录表单 -->
            <transition enter-active-class="animated fadeInLeft"
            >
              <div class="login_form" v-if="subLogin">
                <form style="height:100%;width:100%;">
                  <input type="text" :placeholder="$t('login.passPlaceHolder1')" style="margin-top: 14%;" v-model="phoneLoginData.phonenumber"/>
                  <div class="pass">
                    <input type="password" :placeholder="$t('login.passPlaceHolder2')" v-model="phoneLoginData.password"/>
                    <div>{{$t('login.forgetPass')}}</div>
                  </div>
                  <div class="tips_box"></div>
                  <input  type="button" :value="$t('login.title')" @click="loginByPhone"/>
                </form>
              </div>
            </transition>
            <!-- 验证码登录表单 -->
            <transition enter-active-class="animated fadeInRight"
            >
              <div class="login_form" v-if="!subLogin">
                <form style="height:100%;width:100%;">
                  <input type="number" :placeholder="$t('login.codePlaceHolder1')" v-model="codeLoginData.phone" style="margin-top: 14%;"/>
                  <div class="pass">
                    <input type="number" :placeholder="$t('login.codePlaceHolder2')" v-model="codeLoginData.code"/>
                    <div @click="sendCode" v-if="codeText">{{$t('login.getCode')}}</div>
                    <div v-else>{{count}} s </div>
                  </div>
                  <div class="tips_box"></div>
                  <input  type="button" :value="$t('login.title')" @click="loginByCode"/>
                </form>
              </div>
            </transition>
            <!-- 第三方登录 -->
            <div class="login_method">
              <div class="other_method">{{$t('login.otherLoginMethod')}}</div>
              <div class="method_icon" @click="changeLoginMethod('wxchatLogin')">
                <img :src="require('@/assets/img/sign-weixin.png')" alt="" width="100%">
              </div>
            </div>
          </div>
        </transition>
        <!-- 微信扫描 -->
        <transition enter-active-class="animated fadeInRight"
        >
          <div class="login_box" v-if="loginMethod === 'wxchatLogin'" :class="loginMethod === 'wxchatLogin' ? '' : 'hidden'">
            <div class="tips">{{$t('login.wxTips')}}</div>
            <!-- 二维码 -->
            <div class="login_form" style="position: relative;">
              <!-- <img :src="require('@/assets/img/qrcode.png')" alt="" class="wxPng"> -->
              <div class="wxPng" id="wxPng"></div>
              <div class="protocol">
                {{$t('login.protocolText1')}}
                <a href="#">{{$t('login.protocolText2')}}</a>
                {{$t('login.protocolText3')}}
                <a href="#">{{$t('login.protocolText4')}}</a>
                {{$t('login.protocolText5')}}
              </div>
            </div>
            <div class="login_method">
              <div class="other_method">{{$t('login.otherLoginMethod1')}}</div>
              <div class="method_icon" @click="changeLoginMethod('phoneLogin')">
                <img :src="require('@/assets/img/sign-phone.png')" alt="" width="100%">
              </div>
            </div>
          </div>
        </transition>
      </div>
    </div>
  </div>
</template>

<script>
import {phoneNumLogin,getSmsCode,codeLogin,weChatCallBack} from '@/api/login/index.js'
import {nanoid} from  'nanoid'
import ChangeLang from '@/components/common/changeLang.vue'
export default {
    name:'Login',
    components:{ChangeLang},
    data(){
      return {
        subLogin: true,
        loginMethod: 'phoneLogin',
        // 手机号登录表单数据
        phoneLoginData:{
          phonenumber:'',
          password:''
        },
        // 验证码登录
        codeLoginData:{
          phone:'',
          code:''
        },
        timer: null, //设置计时器,
        // 倒计时60s
        codeText:true,
        count:60,
        // 微信二维码链接
        wxQrCode:''
      }
    },
    created(){
      let code = this.getQueryString("code");
      if(code === null || code === undefined || code === ""){
        return;
      }
      weChatCallBack({code}).then((res) => {
        if(res.code === 0){
            let {token,userInfo,permissionList} = res.data
            // 将token存储起来
            localStorage.setItem('token',token)
            // 将userInfo也存储起来
            localStorage.setItem('userInfo',JSON.stringify(userInfo))
            // 清除菜单store
            this.$store.commit('menuOptions/CLEARMENU')
            // 将数据加入菜单store（后面渲染菜单）
            this.$store.commit('menuOptions/CHANGEMENU',permissionList)
            // 添加动态路由
            this.$store.commit('menuOptions/ADDROUTER',this.$router)

            // 登录成功 跳转路由
            this.$router.push({name:'root'})
          }else{
            this.$notify.error({
              title: '错误',
              message: res.msg
            });
          }
      })
    },
    methods:{
      // 切换
      switchSubLogin(value){
        this.subLogin = value
      },
      // 改变登录方式 手机号/微信
      changeLoginMethod(value){
        this.loginMethod = value
        // 如果跳转到微信登录
        if(value === 'wxchatLogin'){
          setTimeout(() => {
            var obj = new WxLogin({           
                              self_redirect:false,
                              id:"wxPng", 
                              appid: "wxd853562a0548a7d0", 
                              scope: "snsapi_login", 
                              redirect_uri: encodeURIComponent("http://bugtracker.itsource.cn"),
                              state: "",
                              style: "black",
                              href: "data:text/css;base64,LmltcG93ZXJCb3ggLnRpdGxlewogIGRpc3BsYXk6IG5vbmU7Cn0KCi5pbXBvd2VyQm94IC53YWl0aW5nIC5pbmZvIHsKICBkaXNwbGF5OiBub25lOwp9CgouaW1wb3dlckJveCAud2FpdGluZyAud3JwX2NvZGUgewogIG1hcmdpbjogMCBhdXRvOyAKICB3aWR0aDogMjAwcHg7CiAgYm9yZGVyOiBub25lOwp9CgouaW1wb3dlckJveCAud2FpdGluZyAucXJjb2RlIHsKICBib3JkZXI6IDA7CiAgd2lkdGg6IDEwMCU7Cn0="
                            });
          },300)
          // getQrWXCode().then((res) => {
          //   if(res.code === 0){
          //     this.wxQrCode = res.data.url
          //   }else{
          //     this.$notify.error({
          //       title: '错误',
          //       message: res.msg
          //     });
          //   }
          // })
        }
      },
      // 调用登录方法
      login(){
        let token = nanoid()
        localStorage.setItem('token',token)
        let permission = [
          {
            id: '1',
            menuName: '首页',
            path: 'home'
          },
          {
            id:'2',
            menuName: '前台设置',
            path: 'front',
            children: [
              {
                id:'3',
                menuName:'菜单开发',
                path:'menu'
              },
              {
                id:'4',
                menuName:'底部设置',
                path:'foot'
              },
              {
                id:'5',
                menuName:'联系我们',
                path:'concact'
              }
            ]
          }
        ]
        // 清除菜单store
        this.$store.commit('menuOptions/CLEARMENU')
        // 将数据加入菜单store（后面渲染菜单）
        this.$store.commit('menuOptions/CHANGEMENU',permission)
        // 添加动态路由
        this.$store.commit('menuOptions/ADDROUTER',this.$router)
        // 登录成功 跳转路由
        this.$router.push({name:'root'})

      },
      // 手机号登录
      loginByPhone(){
        phoneNumLogin(this.phoneLoginData).then(res => {
          if(res.code === 0){
            let {token,userInfo,permissionList} = res.data
            // 将token存储起来
            localStorage.setItem('token',token)
            // 将userInfo也存储起来
            localStorage.setItem('userInfo',JSON.stringify(userInfo))
            // 清除菜单store
            this.$store.commit('menuOptions/CLEARMENU')
            // 将数据加入菜单store（后面渲染菜单）
            this.$store.commit('menuOptions/CHANGEMENU',permissionList)
            // 添加动态路由
            this.$store.commit('menuOptions/ADDROUTER',this.$router)
            // 登录成功 跳转路由
            this.$router.push({name:'root'})
          }else{
            this.$notify.error({
              title: '错误',
              message: res.msg
            });
          }
        })
      },
      // 调用发送验证码
      sendCode(){
        // 1、校验手机号
        let flag = this.verificationPhone(this.codeLoginData.phone)
        if(!flag){
          return;
        }
        // 2、开启倒计时
        if (!this.timer) {
          this.codeText = false
          this.timer = setInterval(() => {
            if(this.count > 0 && this.count <= 60){
              this.count--;
            }else{
              this.codeText = true
              clearInterval(this.timer);
              this.timer = null;
              this.count = 60
            }
          },1000)
        }
        // 3、调用发送验证码接口
        getSmsCode(this.codeLoginData).then((res) => {
          if(res.code === 0){
            this.$notify({
              title: '成功',
              message: '验证码发送成功，请注意查收',
              type: 'success'
            });
          }else{
            this.$notify.error({
              title: '错误',
              message: res.msg
            });
          }
        })
      },
      verificationPhone(phone){
        let reg = /^[1][3,4,5,7,8][0-9]{9}$/;
        let flag = true
        if(!reg.test(phone)){
          switch (phone) {
            case "":
              flag = false
              this.$notify.error({
                title: '错误',
                message: '请填写手机号码'
              });
              break;
            default:
              flag = false
              this.$notify.error({
                title: '错误',
                message: '手机号码格式错误'
              });
              break;
          }
        }
        return flag;
      },
      verificationCode(code){
        let x = /^[0-9]{4,6}$/gim;
        if (x.test(code)) {
          return true;
        }else{
          this.$notify.error({
            title: '错误',
            message: '验证码必须4-6位'
          });
          return false; 
        }
      },
      // 验证码登录
      loginByCode(){
        // 1、校验手机号
        let flag = this.verificationPhone(this.codeLoginData.phone)
        if(!flag){
          return;
        }
        let flagcode = this.verificationCode(this.codeLoginData.code)
        if(!flagcode){
          retrun;
        }
        codeLogin(this.codeLoginData).then((res) => {
          if(res.code === 0){
            let {token,userInfo,permissionList} = res.data
            // 将token存储起来
            localStorage.setItem('token',token)
            // 将userInfo也存储起来
            localStorage.setItem('userInfo',JSON.stringify(userInfo))
            // 清除菜单store
            this.$store.commit('menuOptions/CLEARMENU')
            // 将数据加入菜单store（后面渲染菜单）
            this.$store.commit('menuOptions/CHANGEMENU',permissionList)
            // 添加动态路由
            this.$store.commit('menuOptions/ADDROUTER',this.$router)
            // 登录成功 跳转路由
            this.$router.push({name:'root'})
          }else{
            this.$notify.error({
              title: '错误',
              message: res.msg
            });
          }
        })
      },
      getQueryString(name) {
        var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
          return unescape(r[2]);
        }
        return null;
      }
    },
}
</script>

<style lang="less" scoped>
.containers {
  overflow: hidden;
  background-color: #EDF9FC;
  height: 100vh;
  position: relative;
  .head {
    position: absolute;
    width: 100%;
    height: 10%;
    display: flex;
    align-items: center;
    &>div {
      width: 50%;
      height: 80%;
    }
    .left_logo {
      font-size: 75px;
      padding-left: 3%;
    }
    .right_changelang {
      display: flex;
      align-items: center;
      flex-direction: row-reverse;
      .in_box {
        width: 20%;
        height: 40%;
        margin-right: 5%;
        margin-top: 2%;
      }
    }
  }
  .body {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-evenly;
    &>div {
      width: 30%;
      height: 55%;
    }
    .left_img {
      img {
        width: 100%;
        display: block;
        margin-top: 10%;
      }
    }
    .right_box {
      .login_box {
        padding: 0 8%;
        box-sizing: border-box;
        overflow: hidden;
        margin: 0 auto;
        width: 70%;
        height: 100%;
        background-color: #FFFFFF;
        border-radius: 5%;
        box-shadow: 4px 4px 10px 4px rgb(0 0 0 / 20%);
        // 微信扫码提示
        .tips {
          text-align: center;
          color: @font_color_dark;
          font-size: @font_size_middle;
          white-space: nowrap;
          margin-top: 33%;
        }
        .sub_title {
          width: 100%;
          height: 32px;
          margin-top: 10%;
          overflow: hidden;
          white-space: nowrap;
          &>span {
            cursor: pointer;
            display: inline-block;
            height: 30px;
            font-size: @font_size_large;
            color: @font_color_grey;
          }
          &>.active {
            color: @font_color_dark;
            border-bottom: 2px #096DD9 solid;
            font-weight: 600;
          }
          .two {
            margin-left: 10%;
          }
        }
        .login_form {
          width: 100%;
          height: 60%;
          border-bottom: 1px #F0F0F0 solid;
          .wxPng {
            // 扫码图片
            position: absolute;
            top: 15%;
            left: 50%;
            transform: translateY(-50%);
            transform: translateX(-50%);
            overflow: hidden;
            height: 70%;
          }
          .protocol {
            // 隐私协议
            font-size: @font_size_small;
            text-align: center;
            bottom: 10%;
            position: absolute;
            width: 100%;
            &>a {
              text-decoration: none;
              color: @font_color_red;
            }
          }
          input[type="text"],input[type="password"],input {
            width: 100%;
            height: 16%;
            border-radius: 6px;
            border: 2px #096DD9 solid;
            margin-top: 8%;
            padding-left: 3%;
            box-sizing: border-box;
          }
          input[type="text"]:focus,input[type="password"]:focus,input:focus {
            outline: 0;
            border: 2px #096DD9 solid;
          }
          // 去除type=number的默认样式start
          input[type=number] {
              -moz-appearance:textfield;
          }
          input[type=number]::-webkit-inner-spin-button,
          input[type=number]::-webkit-outer-spin-button {
              -webkit-appearance: none;
              margin: 0;
          }
          // 去除type=number的默认样式end
          .pass {
            width: 100%;
            height: 16%;
            overflow: hidden;
            margin-top: 8%;
            position: relative;
            &>input[type="password"],&>input[type="text"],&>input {
              margin-top:0;
              height: 100%;
            }
            &>div {
              cursor: pointer;
              color: black;
              font-size: @font_size_small;
              position: absolute;
              right: 5%;
              top:50%;
              transform: translateY(-50%);
            }
          }
          .tips_box {
            color: @font_color_red;
            font-size: @font_size_ssmall;
            margin-top: 8%;
            height: 12px;
            overflow: hidden;
          }
          input[type="button"] {
            cursor: pointer;
            width: 100%;
            height: 16%;
            background-color: #096DD9;
            box-sizing: border-box;
            border-radius: 6px;
            border: 1px #096DD9 solid;
            color: #FFFFFF;
            margin-top: 8%;
          }
        }
        .login_method {
          height: 8%;
          overflow: hidden;
          margin-top: 7%;
          .other_method {
            float: left;
            font-size: @font_size_small;
            color: @font_color_grey;
            height: 100%;
            line-height: 40px;
          }
          .method_icon {
            cursor: pointer;
            box-sizing: border-box;
            float: right;
            height: 40px;
            width: 40px;
            border: 1px #F0F0F0 solid;
            border-radius: 50%;
          }
        }
      }
    }
  }
}
.hidden {
  display: none;
}
</style>
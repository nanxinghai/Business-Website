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
        <div class="login_box" v-if="loginMethod === 'phoneLogin'">
          <h1>{{$t('login.title')}}</h1>
          <!-- 副标题 -->
          <div class="sub_title">
            <span :class="{'active':subLogin}" @click="switchSubLogin(true)">{{$t('login.subTitle1')}}</span>
            <span class="two" :class="{'active':!subLogin}" @click="switchSubLogin(false)">{{$t('login.subTitle2')}}</span>
          </div>
          <!-- 密码登录表单 -->
          <div class="login_form" v-if="subLogin">
            <form style="height:100%;width:100%;">
              <input type="text" :placeholder="$t('login.passPlaceHolder1')" style="margin-top: 14%;"/>
              <div class="pass">
                <input type="password" :placeholder="$t('login.passPlaceHolder2')"/>
                <div>{{$t('login.forgetPass')}}</div>
              </div>
              <div class="tips_box">{{$t('login.passTips')}}</div>
              <input  type="button" :value="$t('login.title')"/>
            </form>
          </div>
          <!-- 验证码登录表单 -->
          <div class="login_form" v-if="!subLogin">
            <form style="height:100%;width:100%;">
              <input type="text" :placeholder="$t('login.codePlaceHolder1')" style="margin-top: 14%;"/>
              <div class="pass">
                <input type="password" :placeholder="$t('login.codePlaceHolder2')"/>
                <div>{{$t('login.getCode')}}</div>
              </div>
              <div class="tips_box">{{$t('login.codeTips')}}</div>
              <input  type="button" :value="$t('login.title')"/>
            </form>
          </div>
          <!-- 第三方登录 -->
          <div class="login_method">
            <div class="other_method">{{$t('login.otherLoginMethod')}}</div>
            <div class="method_icon">
              <img :src="require('@/assets/img/sign-weixin.png')" alt="" width="100%">
            </div>
          </div>
        </div>
        <!-- 微信扫描 -->
        <div class="login_box" v-if="loginMethod === 'wxchatLogin'">
          <div class="tips">{{$t('login.wxTips')}}</div>
          <!-- 二维码 -->
          <div class="login_form">

          </div>
          <div class="login_method">
            <div class="other_method">{{$t('login.otherLoginMethod')}}</div>
            <div class="method_icon">
              <img :src="require('@/assets/img/sign-phone.png')" alt="" width="100%">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ChangeLang from '@/components/common/changeLang.vue'
export default {
    name:'Login',
    components:{ChangeLang},
    data(){
      return {
        subLogin: true,
        loginMethod: 'wxchatLogin'
      }
    },
    methods:{
      // 切换
      switchSubLogin(value){
        this.subLogin = value
      }
    },
}
</script>

<style lang="less" scoped>
.containers {
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
          input[type="text"],input[type="password"] {
            width: 100%;
            height: 16%;
            border-radius: 6px;
            border: 2px #096DD9 solid;
            margin-top: 8%;
            padding-left: 3%;
            box-sizing: border-box;
          }
          input[type="text"]:focus,input[type="password"]:focus {
            outline: 0;
            border: 2px #096DD9 solid;
          }
          .pass {
            width: 100%;
            height: 16%;
            overflow: hidden;
            margin-top: 8%;
            position: relative;
            &>input[type="password"] {
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
</style>
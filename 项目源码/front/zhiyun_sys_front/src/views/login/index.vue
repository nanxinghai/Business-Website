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
      <div class="left_img">
        <img :src="require('@/assets/img/login_bg.png')" alt="">
      </div>
      <div class="right_box">
        <div class="login_box">
          <h1>{{$t('login.title')}}</h1>
          <div class="sub_title">
            <span class="active">{{$t('login.subTitle1')}}</span>
            <span class="two">{{$t('login.subTitle2')}}</span>
          </div>
          <div class="login_form">
            <form style="height:100%;width:100%;">
              <input type="text" :placeholder="$t('login.passPlaceHolder1')" style="margin-top: 13%;"/>
              <input type="text" :placeholder="$t('login.passPlaceHolder2')"/>
              <div class="tips_box">{{$t('login.passTips')}}</div>
              <input  type="button" :value="$t('login.title')"/>
            </form>
          </div>
          <div class="login_method"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ChangeLang from '@/components/common/changeLang.vue'
export default {
    name:'Login',
    components:{ChangeLang}
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
      height: 60%;
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
        background-color: white;
        border-radius: 5%;
        box-shadow: 4px 4px 10px 4px rgb(0 0 0 / 20%);
        .sub_title {
          width: 100%;
          height: 32px;
          margin-top: 10%;
          overflow: hidden;
          white-space: nowrap;
          &>span {
            // float: left;
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
          input[type="text"] {
            width: 100%;
            height: 13%;
            border-radius: 6px;
            border: 2px #096DD9 solid;
            margin-top: 7%;
            padding-left: 3%;
            box-sizing: border-box;
          }
          input[type="text"]:focus {
            outline: 0;
            border: 2px #096DD9 solid;
          }
        }
        .login_method {

        }
      }
    }
  }
}
</style>
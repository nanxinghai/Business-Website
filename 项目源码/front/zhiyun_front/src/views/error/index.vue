<template>
  <div class="error">
    <full-page :options="options" ref="fullpage">
      <!-- 第一屏 -->
      <div class="section bg_down">
        <Header></Header>
        <el-row type="flex" justify="space-between" align="middle" class="error_box">
          <el-col :span="12" class="error_box_1">
            <img src="static/error/404.png" alt="">
          </el-col>
          <el-col :span="12" class="error_box_1">
            <div class="right_box">
              <div class="word">
                抱歉，您访问的页面已冲出地球表面~
              </div>
              <div class="btn">
                <router-link to="/homePage">回到首页</router-link>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
      <!-- 底部 -->
      <div class="section fp-auto-height">
        <Foot></Foot>
      </div>
    </full-page>
  </div>
</template>

<script>
import Header from '@/components/common/head.vue'
import Foot from '@/components/common/foot.vue'
import mixin from '@/mixin/index.js'
export default {
    name:'Error',
    components:{Header,Foot},
    mixins:[mixin]
}
</script>

<style lang="less" scoped>
.error {
  .error_box {
    height: 100%;
    width: 80%;
    margin: 0 auto;
    .error_box_1 {
      height: 62%;
      text-align: center;
      &>img {
        height: 100%;
      }
      .right_box {
        width: 100%;
        height: 50%;
        margin-top: 30%;
        .word {
          .pageTitle()
        }
        .btn {
          margin: 8% auto;
          cursor: pointer;
          width: 146px;
          height: 42px;
          opacity: 1;
          border-radius: 24px;
          background-color: @font_pageButtonBlue_color;
          color: white;
          text-align: center;
          line-height: 42px;
          font-size: @font_size_small;
          letter-spacing: 2px;
          &>a {
            color: white;
            text-decoration: none;
          }
        }
      }
    }
  } 
}
</style>
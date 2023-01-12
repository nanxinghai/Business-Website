<template>
  <div class="pro_ex">
    <full-page :options="options" ref="fullpage">
      <!-- 第一屏 -->
      <div class="section bg_up">
        <Header></Header>
        <div class="pro_box_1">
          <div class="pro_box_1_top">
            <div>项目流程</div>
            <div>PROJECT PROCESS</div>
            <div>为企业量身定制开发软件操作简单快捷，随时随地访问您需要的实时数据，帮助企业更简捷地达成交易</div>
          </div>
          <el-row type="flex" justify="space-around" class="pro_box_1_bottom">
            <el-col :span="6">
              <svg-icon icon-class="pro_1_1"></svg-icon>
            </el-col>
            <el-col :span="6"></el-col>
            <el-col :span="6"></el-col>
            <el-col :span="6"></el-col>
          </el-row>
        </div>
      </div>
      <!-- 第二屏 -->
      <div class="section bg_down">

      </div>
      <!-- 第三屏 -->
      <div class="section bg_up">

      </div>
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
  name:'processExample',
  components:{Header,Foot},
  mixins:[mixin]
}
</script>

<style lang="less" scoped>
.pro_ex {
  .pro_box_1 {
    border: 1px solid transparent;
    height: 100%;
    width: 80%;
    margin: 0 auto;
    .pro_box_1_top {
      margin-top: 15vh;
      width: 100%;
      text-align: center;
      &>div:nth-child(1) {
        .pageTitle()
      }
      &>div:nth-child(2) {
        .pageSubTitle()
      }
      &>div:nth-child(3) {
        .pageWordDes()
      }
    }
    .pro_box_1_bottom {
      height: 30vh;
    }
  }
}
</style>
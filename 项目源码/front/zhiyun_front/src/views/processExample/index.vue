<template>
  <div class="pro_ex">
    <full-page :options="options" ref="fullpage">
      <!-- 第一屏 -->
      <div class="section bg_up">
        <Header></Header>
        <div class="pro_box_1">
          <transition enter-active-class="animated fadeInUp">
            <div class="pro_box_1_top" v-show="currentIndex == 0">
              <div>项目流程</div>
              <div>PROJECT PROCESS</div>
              <div>为企业量身定制开发软件操作简单快捷，随时随地访问您需要的实时数据，帮助企业更简捷地达成交易</div>
            </div>
          </transition>
          <transition enter-active-class="animated fadeInUp">
            <el-row type="flex" justify="space-around" class="pro_box_1_bottom" v-show="currentIndex == 0">
              <el-col :span="6">
                <svg-icon icon-class="pro_1_1" class="svgclass"></svg-icon>
                <div class="title">项目立项</div>
                <div class="sub_title">项目启动，成立专项小组流程分析</div>
              </el-col>
              <el-col :span="6">
                <svg-icon icon-class="pro_1_2" class="svgclass"></svg-icon>
                <div class="title">需求评估</div>
                <div class="sub_title">需求收集、定位分析，提供解决方案</div>
              </el-col>
              <el-col :span="6">
                <svg-icon icon-class="pro_1_3" class="svgclass"></svg-icon>
                <div class="title">产品规划</div>
                <div class="sub_title">资料整理、原型图制作、确定工时</div>
              </el-col>
              <el-col :span="6">
                <svg-icon icon-class="pro_1_4" class="svgclass"></svg-icon>
                <div class="title">UI设计</div>
                <div class="sub_title">设计分析，页面设计， 用户体验研究</div>
              </el-col>
            </el-row>
          </transition>
          <transition enter-active-class="animated fadeInUp">
            <el-row type="flex" justify="space-around" class="pro_box_1_bottom" v-show="currentIndex == 0">
              <el-col :span="6">
                <svg-icon icon-class="pro_1_5" class="svgclass"></svg-icon>
                <div class="title">程序开发</div>
                <div class="sub_title">项目启动，成立专项小组流程分析</div>
              </el-col>
              <el-col :span="6">
                <svg-icon icon-class="pro_1_6" class="svgclass"></svg-icon>
                <div class="title">质量审核</div>
                <div class="sub_title">兼容性测试，功能测试，压力测试</div>
              </el-col>
              <el-col :span="6">
                <svg-icon icon-class="pro_1_7" class="svgclass"></svg-icon>
                <div class="title">部署上线</div>
                <div class="sub_title">验收合格、运营上线，项目部署</div>
              </el-col>
              <el-col :span="6">
                <svg-icon icon-class="pro_1_8" class="svgclass"></svg-icon>
                <div class="title">验收交付</div>
                <div class="sub_title">原型图、设计稿、源码、操作文档交付</div>
              </el-col>
            </el-row>
          </transition>
        </div>
      </div>
      <!-- 第二屏 -->
      <div class="section bg_down">
        <div class="proex_box">
          <transition enter-active-class="animated fadeInUp">
            <div class="proex_1" v-show="currentIndex == 1">
              <div class="proex_1_1">优秀客户案例</div>
              <div class="proex_1_2">OUR COMMITMENT</div>
              <div class="proex_1_3">提供优质服务项目，为企业量身定制开发软件</div>
            </div>
          </transition>
          <el-row style="height:40%;margin-top:10vh;" type="flex" justify="space-around">
            <el-col :span="5" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="proex_2_box" v-show="currentIndex == 1">
                  <img src="/static/homepage/proex1.png" alt="">
                  <div class="proex_2_box_word">
                    私家智能定制APP
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="5" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="proex_2_box" v-show="currentIndex == 1">
                  <img src="/static/homepage/proex2.png" alt="">
                  <div class="proex_2_box_word">
                    公司企业定制系统
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="5" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="proex_2_box" v-show="currentIndex == 1">
                  <img src="/static/homepage/proex3.png" alt="">
                  <div class="proex_2_box_word">
                    公司定制官网
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="5" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="proex_2_box" v-show="currentIndex == 1">
                  <img src="/static/homepage/proex4.png" alt="">
                  <div class="proex_2_box_word">
                    大型物流企业定制小程序
                  </div>
                </div>
              </transition>
            </el-col>
          </el-row>
        </div>
      </div>
      <!-- 第三屏 -->
      <div class="section bg_up">
        <div class="pro_box_3">
          <div class="pro_box_3_top">
            <div>项目流程</div>
            <div>PROJECT PROCESS</div>
            <div>为企业量身定制开发软件操作简单快捷，随时随地访问您需要的实时数据，帮助企业更简捷地达成交易</div>
          </div>
          <el-row class="pro_box_3_middle" type="flex" justify="space-around">
            <el-col :span="8"></el-col>
            <el-col :span="8"></el-col>
            <el-col :span="8"></el-col>
          </el-row>
          <div class="pro_box_3_bottom">
            追求品质与力求不断超越自己的团队，每一位成员也是亲密的伙伴，与公司一起成长与发展。我们尊重每次合作的机会与挑战，不断精进，力求。团队秉承专注、专业的设计服务思维，让客户通过设计发挥产品的更大价值，并发掘无限的可能。热爱设计并坚信设计的力量让我们不断前进
          </div>
        </div>
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
      margin-top: 10vh;
      height: 20vh;
      .el-col {
        text-align: center;
        .svgclass {
          font-size: 50px;
          display: block;
          margin: 0 auto;
        }
        .title {
          margin-top: 2vh;
          color: #333;
          font-size: @font_size_middle;
        }
        .sub_title {
          margin-top: 5vh !important;
          .pageSubTitle()
        }
      }
    }
  }
  .proex_box {
      overflow: hidden;
      height: 100%;
      width: 90%;
      margin: 0 auto;
      .proex_1 {
        margin-top: 15vh;
        text-align: center;
        .proex_1_1 {
          .pageTitle()
        }
        .proex_1_2 {
          .pageSubTitle()
        }
        .proex_1_3 {
          .pageWordDes()
        }
      }
      .proex_2_box {
        width: 100%;
        height: 100%;
        &>img {
          width: 100%;
        }
        .proex_2_box_word {
          text-align: center;
          font-size: @font_size_small;
          color: @font_grey_color;
        }
      }
  }
  .pro_box_3 {
    border: 1px solid transparent;
    height: 100%;
    width: 80%;
    margin: 0 auto;
    .pro_box_3_top {
      text-align: center;
      margin-top: 10vh;
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
    .pro_box_3_middle {
      height: 40%;
    }
    .pro_box_3_bottom {
      text-align: center;
      font-size: @font_size_small;
      color: @font_grey_color;
    }
  }
}
</style>
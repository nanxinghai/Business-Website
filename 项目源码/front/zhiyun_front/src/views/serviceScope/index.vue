<template>
  <div class="service_scope">
    <full-page :options="options" ref="fullpage">
      <div class="section sc_box_1 bg_up">
        <Header></Header>
        <div class="sc_box">
          <transition enter-active-class="animated fadeInUp">
            <div class="sc_1" v-show="currentIndex == 0">
              <div class="sc_1_1">公司服务范围</div>
              <div class="sc_1_2">COMPANY SERVICE SCOPE</div>
              <div class="sc_1_3">为企业量身定制开发软件操作简单快捷，随时随地访问您需要的实时数据，帮助企业更简捷地达成交易</div>
            </div>
          </transition>
          <el-row style="height:40%;margin-top:8vh;" type="flex" justify="space-around">
            <el-col :span="6" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="sc_2_box" v-show="currentIndex == 0">
                  <img src="/static/homepage/scope1.png" alt="">
                  <div class="sc_2_box_word">
                    <h4>企业网站系统开发</h4>
                    <span>设计开发合适的网站系统方案，精准打磨每一个细节</span>
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="6" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="sc_2_box" v-show="currentIndex == 0">
                  <img src="/static/homepage/scope2.png" alt="">
                  <div class="sc_2_box_word">
                    <h4>智能APP整合资源</h4>
                    <span>利用搜索引擎的规则提高网站在有关搜索引擎内的自然排名</span>
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="6" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="sc_2_box" v-show="currentIndex == 0">
                  <img src="/static/homepage/scope3.png" alt="">
                  <div class="sc_2_box_word">
                    <h4>小程序开发</h4>
                    <span>强大稳定的开店系统快速搭建电商小程序，一体化小程序解决方案</span>
                  </div>
                </div>
              </transition>
            </el-col>
          </el-row>
        </div>
      </div>
      <div class="section sc_box_2 bg_down">
        <div class="sc_box">
          <transition enter-active-class="animated fadeInUp">
            <div class="sc_box_2_1" v-show="currentIndex == 1">
              <div class="sc_2_1">公司服务范围</div>
              <div class="sc_2_2">COMPANY SERVICE SCOPE</div>
              <div class="sc_2_3">为企业量身定制开发软件操作简单快捷，随时随地访问您需要的实时数据，帮助企业更简捷地达成交易</div>
            </div>
          </transition>
          <el-row type="flex" justify="space-around" class="sc_box_bottom">
            <transition enter-active-class="animated fadeInLeft">
              <el-col :span="8" class="sc_box_bottom_1" v-show="currentIndex == 1">
                <img src="/static/servicescope/sc_2_1.png" alt="" >
              </el-col>
            </transition>
            <el-col :span="16">
              <transition enter-active-class="animated fadeInRight">
              <div class="sc_box_bottom_2_in" v-show="currentIndex == 1">
                <el-row class="sc_box_bottom_2_in_1">
                  <el-col :span="3">
                    <img src="/static/servicescope/sc_2_2.png" alt="">
                  </el-col>
                  <el-col :span="9">
                    <div class="word_top">一站式服务</div>
                    <div class="word_bottom">关于互联网的那些事儿，太麻烦我们帮您搞定</div>
                  </el-col>
                  <el-col :span="3">
                    <img src="/static/servicescope/sc_2_3.png" alt="">
                  </el-col>
                  <el-col :span="9">
                    <div class="word_top">无理由退款</div>
                    <div class="word_bottom">如果你不满意，那是我们的问题，我们说退就退</div>
                  </el-col>
                </el-row>
                <el-row class="sc_box_bottom_2_in_1">
                  <el-col :span="3">
                    <img src="/static/servicescope/sc_2_4.png" alt="">
                  </el-col>
                  <el-col :span="9">
                    <div class="word_top">全网络推广</div>
                    <div class="word_bottom">有那么多推广渠道，到底做那个？我们帮您全做</div>
                  </el-col>
                  <el-col :span="3">
                    <img src="/static/servicescope/sc_2_5.png" alt="">
                  </el-col>
                  <el-col :span="9">
                    <div class="word_top">自主研发</div>
                    <div class="word_bottom">我们的技术，我们的产品，都有保护和申请</div>
                  </el-col>
                </el-row>
              </div>
              </transition>
            </el-col>
          </el-row>
        </div>
      </div>
      <div class="section bg_up sc_box_3">

      </div>
      <!-- 页脚底部 -->
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
  name:'serviceScope',
  components:{Header,Foot},
  mixins:[mixin]
}
</script>

<style lang="less" scoped>
.service_scope {
  .sc_box_1 {
    .sc_box {
      overflow: hidden;
      height: 100%;
      width: 80%;
      margin: 0 auto;
      .sc_1 {
        margin-top: 25vh;
        text-align: center;
        .sc_1_1 {
          .pageTitle()
        }
        .sc_1_2 {
          .pageSubTitle()
        }
        .sc_1_3 {
          .pageWordDes()
        }
      }
      .sc_2_box {
        overflow: hidden;
        width: 100%;
        height: 100%;
        border-radius: 10px;
        background: rgba(255, 255, 255, 1);
        border: 1px solid rgba(227, 216, 216, 1);
        text-align: center;
        box-shadow: 0px 4px 0px 0px #54a0f7;
        &>img {
          margin-top: 10vh;
        }
        .sc_2_box_word {
          overflow: hidden;
          text-align: center;
          width: 80%;
          margin: 0 auto;
          &>h4 {
            margin: 1vh;
          }
          &>span {
            font-size: @font_size_small;
            color: @font_grey_color;
          }
        }
      }
    }
  }
  .sc_box_2 {
    .sc_box {
      border: 1px solid transparent;
      height: 100%;
      width: 80%;
      margin: 0 auto;
      .sc_box_2_1 {
        margin-top: 10vh;
        .sc_2_1 {
          .pageTitle()
        }
        .sc_2_2 {
          .pageSubTitle()
        }
        .sc_2_3 {
          .pageWordDes()
        }
      }
      .sc_box_bottom {
        height:47%;
        margin-top:10vh;
        .sc_box_bottom_1 {
          &>img {
            width: 100%;
          }
        }
        .sc_box_bottom_2_in {
          margin-top:8vh;
          height: 100%;
          width: 100%;
          .sc_box_bottom_2_in_1 {
            margin-top: 10vh;
            height:20%;
            .el-col {
              height: 100%;
              &>img {
                height: 100%;
                margin: 0 auto;
                display: block;
              }
              .word_top {
                margin-top: 2vh;
                color: #000000;
                font-size: @font_size_middle;
              }
              .word_bottom {
                margin-top: 1vh;
                color: @font_grey_color;
                font-size: @font_size_small;
              }
            }
          }
        }
      }
    }
  }
  .sc_box_3 {
    
  }
}
</style>
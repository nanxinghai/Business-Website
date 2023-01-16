<template>
  <div class="about_us">
    <full-page :options="options" ref="fullpage">
      <!-- 第一屏 -->
      <div class="section bg_up abu_box_1">
        <Header></Header>
        <el-row style="height:100%;width: 70%;margin: 0 auto;" 
        type="flex" justify="space-between" align="middle">
          <el-col :sm="{span:24}" :lg="{span:10}" class="left">
            <transition enter-active-class="animated fadeInLeft">
              <div v-show="currentIndex == 0">
                <div class="ab_left_1">
                  <div class="top">专注提供企业软件研发服务</div>
                  <div class="buttom">ABOUT US</div>
                </div>
                <div class="ab_left_2">
                  <span>我们拥有专业水平的系统开发队伍，具有丰富的系统开发制作经验和新颖的创意水平。
                    我们强调以客户为中心的经验策划理念，将客户的网络行为特征作为设计的核心，
                    结合客户所在行业的网络特点，针对不同行业的每一位客户设计与其品牌、服务、业务等相适合的网站系统方案
                  </span>
                </div>
                <div class="ab_left_3">
                  <span>
                    公司秉承着“为用户提供服务！”的经营理念，已为众多企业搭建好有效的互联网平台。
                    在业界中取得骄人成绩。公司遵循“感恩”、“喜乐”、“健康”、“致知”、“诚意”、“正心”、的价值观，
                    及敢想敢为，说到做到；坚持到底，永不放弃的精神。致力实现员工、客户、社会等多方满意多方和谐的环境。
                  </span>
                </div>
              </div>
            </transition>
          </el-col>
          <el-col :sm="{span:24}" :lg="{span:10}" class="right">
            <transition enter-active-class="animated fadeInRight">
              <div v-show="currentIndex == 0">
                <img src="static/homepage/aboutUs.png">
              </div>
            </transition>
          </el-col>
        </el-row>
      </div>
      <!-- 第二屏 -->
      <div class="section bg_down">
        <div class="abu_box_2">
          <transition enter-active-class="animated fadeInUp">
            <div class="abu_box_2_top" v-show="currentIndex == 1">
              <div>核心理念</div>
              <div>MORE INFORMATION</div>
              <div>为企业量身定制开发软件操作简单快捷，随时随地访问您需要的实时数据，帮助企业更简捷地达成交易</div>
            </div>
          </transition>
          <el-row type="flex" justify="space-around" class="abu_box_2_bottom">
            <transition enter-active-class="animated fadeInLeft">
              <el-col :span="10" v-show="currentIndex == 1">
                <img src="static/aboutus/abu_2_1.png" alt="">
                <div>全网络推广</div>
                <div>AI•智能推广以云计算为支持，7大搜索引擎全覆盖。并通过多平台多渠道的全面网络推广方式，覆盖电脑端和手机端，不仅解决被搜到</div>
              </el-col>
            </transition>
            <transition enter-active-class="animated fadeInRight">
              <el-col :span="10" v-show="currentIndex == 1">
                <img src="static/aboutus/abu_2_2.png" alt="">
                <div>方案集成</div>
                <div>技术研发、业务实训、平台运营；以产、学、研的模式提供一站式的互联网服务。并通过多年的积累，在业内整合了丰富的资源，打通了多方渠道</div>
              </el-col>
            </transition>
          </el-row>
        </div>
      </div>
      <!-- 第三屏 -->
      <div class="section bg_up">
        <div class="abu_box_3">
          <transition enter-active-class="animated fadeInUp">
            <div class="abu_box_3_top" v-show="currentIndex == 2 || currentIndex == 3">
              <div>联系我们</div>
              <div>CONTACT US</div>
              <div>
                <el-row type="flex" justify="space-around">
                  <el-col :span="6">联系QQ：2830224482 </el-col>
                  <el-col :span="6">手机号码：13438835715</el-col>
                  <el-col :span="6">联系邮箱：2830224482@qq.com</el-col>
                  <el-col :span="6">联系地址：黑龙江省鹤岗市工农区新鹤路金广大厦1808</el-col>
                </el-row>
              </div>
            </div>
          </transition>
          <el-row type="flex" justify="space-between" class="abu_box_3_bottom">
            <transition enter-active-class="animated fadeInLeft">
              <el-col :span="12" v-show="currentIndex == 2 || currentIndex == 3">
                <iframe  src="./static/aboutus/map.html" name="iframeDemo" scrolling="no" style="width: 100%;height: 100%;" frameborder="0"></iframe>
              </el-col>
            </transition>
            <transition enter-active-class="animated fadeInRight">
              <el-col :span="11" v-show="currentIndex == 2 || currentIndex == 3">
                <form class="abu_box_3_form">
                  <el-row type="flex" justify="space-between" class="form_row">
                    <el-col :span="11">
                      <div>姓名    <i class="iconfont icon-bitian"></i></div>
                      <input type="text" />
                    </el-col>
                    <el-col :span="11">
                      <div>地址    <i class="iconfont icon-bitian"></i></div>
                      <input type="text" />
                    </el-col>
                  </el-row>
                  <el-row type="flex" justify="space-between" class="form_row">
                    <el-col :span="11">
                      <div>手机    <i class="iconfont icon-bitian"></i></div>
                      <input type="text" />
                    </el-col>
                    <el-col :span="11">
                      <div>邮箱    <i class="iconfont icon-bitian"></i></div>
                      <input type="text" />
                    </el-col>
                  </el-row>
                  <el-row type="flex" justify="space-between" class="form_row" style="height: 30%">
                    <el-col :span="24">
                      <div>需求    <i class="iconfont icon-bitian"></i></div>
                      <textarea/>
                    </el-col>
                  </el-row>
                  <div class="form_file">
                    <input type="checkbox" style="vertical-align: middle;margin-top: -3px"/>
                    <span> 我已经阅读并同意 </span>
                    <span style="color:#0879FF">《隐私保护协议》</span>
                  </div>
                  <div class="form_btn">
                    立即申请
                  </div>
                </form>
              </el-col>
            </transition>
          </el-row>
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
  name:'aboutUs',
  components:{Header,Foot},
  mixins:[mixin]
}
</script>

<style lang="less" scoped>
.about_us {
  .abu_box_1 {
    .left {
      height: 70%;
      &>div {
        width: 100%;
        height: 100%;
        .ab_left_1 {
          margin-top: 12vh;
          .top{
            font-size: @font_size_large;
            color: @font_pageTitleBlue_color;
          }
          .buttom{
            margin-top: 2vh;
            font-size: @font_size_small;
            color: @font_pageWordGrey_color;
          }
        }
        .ab_left_2 {
          max-height: 30vh;
          overflow: hidden;
          text-overflow: ellipsis;
          margin-top: 5vh;
          font-size: @font_size_small;
          color: @font_pageWordGrey_color;
          letter-spacing: 5px;
          line-height: 25px;
        }
        .ab_left_3 {
          margin-top: 4vh;
          max-height: 30vh;
          overflow: hidden;
          text-overflow: ellipsis;
          font-size: @font_size_small;
          color: @font_pageWordGrey_color;
          letter-spacing: 5px;
          line-height: 25px;
        }
      }
    }
    .right {
      height: 70%;
      div {
        width: 100%;
        height: 100%;
        img {
          margin-left: 22%;
          display: block;
          height: 100%;
        }
      }
    }
  }
  .abu_box_2 {
    border: 1px solid transparent;
    height: 100%;
    width: 80%;
    margin: 0 auto;
    .abu_box_2_top {
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
    .abu_box_2_bottom {
      height: 60%;
      margin-top: 10vh;
      .el-col {
        text-align: center;
        &>img {
          width: 100%;
        }
        &>div:nth-child(2) {
          margin-top: 2vh;
          font-size: @font_size_middle;
          color: #333;
        }
        &>div:nth-child(3) {
          margin-top: 2vh;
          font-size: @font_size_small;
          color: @font_grey_color;
        }
      }
    }
  }
  .abu_box_3 {
    border: 1px solid transparent;
    height: 100%;
    width: 80%;
    margin: 0 auto;
    .abu_box_3_top {
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
    .abu_box_3_bottom {
      height: 45%;
      margin-top: 15vh;
      .abu_box_3_form {
        border: 1px solid transparent;
        width: 100%;
        height: 100%;
        padding-top: 5%;
        .form_row {
          height: 20%;
          .el-col {
            &>div {
              color: @font_grey_color;
              font-size: @font_size_small;
            }
            .icon-bitian {
              color: red;
            }
            &>input[type="text"]{
              margin-top: 1vh;
              box-sizing: border-box;
              border: 0;
              background-color: #F7F6F7;
              -web-kit-appearance:none;
              -moz-appearance: none;
              display:block;
              outline:0;
              text-decoration:none;
              width:100%;
              height: 50%;
            }
            &>textarea {
              resize: none;
              margin-top: 1vh;
              width: 100%;
              height:75%;
              border: 0; 
              -web-kit-appearance:none;
              -moz-appearance: none;  
              background-color: #F7F6F7;  
              display:block;
              outline:0;
              text-decoration:none;
            }
          }
        }
        .form_file {
          margin-top: 2vh;
          font-size: @font_size_small;
          color: @font_grey_color;
        }
        .form_btn {
          cursor: pointer;
          margin-top: 2vh;
          text-align: center;
          font-size: @font_size_middle;
          line-height: 30px;
          color: #ffffff;
          height: 8%;
          width: 35%;
          background-color: #1E50AE;
        }
      }
    }
  }
}
</style>
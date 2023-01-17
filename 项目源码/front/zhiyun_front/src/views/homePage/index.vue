<template>
  <div class="homePage">
    <full-page :options="options" ref="fullpage">
      <!-- 第一屏 -->
      <div class="section bg_up">
        <!-- 菜单导航 -->
        <Header></Header>
        <!-- 轮播图 -->
        <div class="slide first">
          <div class="info">
            <router-link :to="{
              name:'aboutUs',
              params:{
                isMove: true
              }
            }">
              <img src="static/homepage/hm1_1.png" alt="">
            </router-link>
          </div>
          <!-- <img src="static/homepage/1.png" /> -->
          <video  controls autoplay muted loop style="width:100%" id="video1">
            <source src="static/homepage/hm1_1.mp4" />
          </video>
        </div>
        <div class="slide">
          <img src="static/homepage/hm1_2.png" />
        </div>
      </div>
      <!-- 第二屏 -->
      <div class="section bg_down about_us" >
        <el-row style="height:100%;width: 70%;margin: 0 auto;" 
        type="flex" justify="space-between" align="middle">
          <el-col :sm="{span:24}" :lg="{span:10}" class="left">
            <transition enter-active-class="animated fadeInLeft">
              <div v-show="currentIndex == 1">
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
                  <div class="ab_btn"><router-link to="/aboutUs">了解更多</router-link></div>
                </div>
              </div>
            </transition>
          </el-col>
          <el-col :sm="{span:24}" :lg="{span:10}" class="right">
            <transition enter-active-class="animated fadeInRight">
              <div v-show="currentIndex == 1">
                <img src="static/homepage/aboutUs.png">
              </div>
            </transition>
          </el-col>
        </el-row>
      </div>
      <!-- 第三屏 -->
      <div class="section bg_up service_scope" >
        <div class="sc_box">
          <transition enter-active-class="animated fadeInUp">
            <div class="sc_1" v-show="currentIndex == 2">
              <div class="sc_1_1">公司服务范围</div>
              <div class="sc_1_2">COMPANY SERVICE SCOPE</div>
              <div class="sc_1_3">为企业量身定制开发软件操作简单快捷，随时随地访问您需要的实时数据，帮助企业更简捷地达成交易</div>
            </div>
          </transition>
          <el-row style="height:40%;margin-top:8vh;" type="flex" justify="space-around">
            <el-col :span="6" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="sc_2_box" v-show="currentIndex == 2">
                  <img src="static/homepage/scope1.png" alt="">
                  <div class="sc_2_box_word">
                    <h4>企业网站系统开发</h4>
                    <span>设计开发合适的网站系统方案，精准打磨每一个细节</span>
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="6" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="sc_2_box" v-show="currentIndex == 2">
                  <img src="static/homepage/scope2.png" alt="">
                  <div class="sc_2_box_word">
                    <h4>智能APP整合资源</h4>
                    <span>利用搜索引擎的规则提高网站在有关搜索引擎内的自然排名</span>
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="6" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="sc_2_box" v-show="currentIndex == 2">
                  <img src="static/homepage/scope3.png" alt="">
                  <div class="sc_2_box_word">
                    <h4>小程序开发</h4>
                    <span>强大稳定的开店系统快速搭建电商小程序，一体化小程序解决方案</span>
                  </div>
                </div>
              </transition>
            </el-col>
          </el-row>
          <div class="sc_3">
            <transition enter-active-class="animated fadeInUp">
              <div class="sc_3_btn" v-show="currentIndex == 2"><router-link to="/serviceScope">了解更多</router-link></div>
            </transition>
          </div>
        </div>
      </div>
      <!-- 第四屏 -->
      <div class="section bg_down pro_exam" >
        <div class="proex_box">
          <transition enter-active-class="animated fadeInUp">
            <div class="proex_1" v-show="currentIndex == 3">
              <div class="proex_1_1">优秀客户案例</div>
              <div class="proex_1_2">OUR COMMITMENT</div>
              <div class="proex_1_3">提供优质服务项目，为企业量身定制开发软件</div>
            </div>
          </transition>
          <el-row style="height:40%;margin-top:8vh;" type="flex" justify="space-around">
            <el-col :span="5" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="proex_2_box" v-show="currentIndex == 3">
                  <img src="static/homepage/proex1.png" alt="">
                  <div class="proex_2_box_word">
                    私家智能定制APP
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="5" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="proex_2_box" v-show="currentIndex == 3">
                  <img src="static/homepage/proex2.png" alt="">
                  <div class="proex_2_box_word">
                    公司企业定制系统
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="5" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="proex_2_box" v-show="currentIndex == 3">
                  <img src="static/homepage/proex3.png" alt="">
                  <div class="proex_2_box_word">
                    公司定制官网
                  </div>
                </div>
              </transition>
            </el-col>
            <el-col :span="5" style="height:100%;">
              <transition enter-active-class="animated fadeInUp">
                <div class="proex_2_box" v-show="currentIndex == 3">
                  <img src="static/homepage/proex4.png" alt="">
                  <div class="proex_2_box_word">
                    大型物流企业定制小程序
                  </div>
                </div>
              </transition>
            </el-col>
          </el-row>
          <div class="proex_3">
            <transition enter-active-class="animated fadeInUp">
              <div class="proex_3_btn" v-show="currentIndex == 3"><router-link to="/processExample">了解更多</router-link></div>
            </transition>
          </div>
        </div>
      </div>
      <!-- 第五屏 -->
      <div class="section bg_up use_company" >
        <div class="uc_box">
          <transition enter-active-class="animated fadeInUp">
            <div class="uc_box_1" v-show="currentIndex == 4 || currentIndex == 5">
              <div class="uc_box_1_1">为全球商户提供 7 x 24 小时优质服务</div>
              <div class="uc_box_1_2">WE OFFER MORE SUITABLE SOLUTIONS</div>
              <div class="uc_box_1_3">靠谱的服务是所有项目成功的必备条件</div>
            </div>
          </transition>
          <transition enter-active-class="animated fadeInUp">
            <el-row class="uc_box_2" type="flex" justify="space-between" v-show="currentIndex == 4 || currentIndex == 5">
              <el-col :span="6">
                <img src="static/homepage/uc1.png" alt="">
              </el-col>
              <el-col :span="6">
                <img src="static/homepage/uc2.png" alt="">
              </el-col>
              <el-col :span="6">
                <img src="static/homepage/uc3.png" alt="">
              </el-col>
              <el-col :span="6">
                <img src="static/homepage/uc4.png" alt="">
              </el-col>
            </el-row>
          </transition>
          <transition enter-active-class="animated fadeInUp">
            <el-row class="uc_box_2" type="flex" justify="space-between" v-show="currentIndex == 4 || currentIndex == 5">
              <el-col :span="6">
                <img src="static/homepage/uc5.png" alt="">
              </el-col>
              <el-col :span="6">
                <img src="static/homepage/uc6.png" alt="">
              </el-col>
              <el-col :span="6">
                <img src="static/homepage/uc7.png" alt="">
              </el-col>
              <el-col :span="6">
                <img src="static/homepage/uc8.png" alt="">
              </el-col>
            </el-row>
          </transition>
        </div>
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
  name: 'homePage',
  components: { Header, Foot },
  mixins:[mixin],
  data() {
    return {
      options: {
        licenseKey: 'OPEN-SOURCE-GPLV3-LICENSE',
        //是否显示导航，默认为false(竖向)
        navigation: true,
        //是否显示两侧的箭头
        controlArrows: true,
        //横向slide幻灯片是否循环滚动(最后一张再切换回到第一张)
        loopHorizontal: true,
        //为每个section设置背景色
        sectionsColor: [''],
        scrollingSpeed: 800,
        onLeave:(index, nextIndex, direction)=>{
          // console.log("index"+JSON.stringify(index))
          // console.log("nextIndex"+JSON.stringify(nextIndex))
          // console.log("direction"+direction)
          this.currentIndex = nextIndex.index
        },
        onSlideLeave:(section, origin, destination, direction, trigger)=>{
          // console.log("section",section)
          // console.log("origin",origin)
          console.log("destination",destination)
          // console.log("direction",direction)
          // console.log("trigger",trigger)
          this.destination = destination.index
        }
      },
      destination: 0,
      timer:null,
    }
  },
  watch: {
    currentIndex: {
      handler(n,o){
        if(n === 0){
          var myVideo=document.getElementById("video1");
          if (myVideo.paused) 
            myVideo.play(); 
        }
      }
    },
    destination: {
      handler(n,o) {
        if(n === 0){
          var myVideo=document.getElementById("video1");
          if (myVideo.paused) 
            myVideo.play(); 
        }
      }
    }
  },
  mounted() {
    this.timer = setInterval(() => {
      this.$refs.fullpage.api.moveSlideRight() // 向右滚动
    }, 10000)
  },
  beforeDestroy(){
    clearInterval(this.timer);        
    this.timer = null;
  }
}
</script>

<style lang="less" scoped>
.homePage {
  .first {
    position: relative;
  }
  .slide {
    .info {
      z-index: 1;
      position: absolute;
      left:50%;
      top:50%;
      margin-left:-270px;
      margin-top:-309px;
      a {
        display: block;
        &>img {
          width: 541px;
          height: 618px;
        }
      }
      
    }
    img {
      width: 100%;
      // width: 1280px;
      // height: 720px;
      // margin: 0 auto;
      // display: block;
      // box-shadow: 22px 27px 11px rgb(0 0 0 / 50%);
    }
  }
  .about_us {
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
          .ab_btn {
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
  .service_scope {
    .sc_box {
      overflow: hidden;
      height: 100%;
      width: 80%;
      margin: 0 auto;
      .sc_1 {
        margin-top: 15vh;
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
      .sc_3 {
        margin-top: 5vh;
        .sc_3_btn {
          cursor: pointer;
          margin: 0 auto;
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
  .pro_exam {
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
      .proex_3 {
        margin-top: 5vh;
        .proex_3_btn {
          cursor: pointer;
          margin: 0 auto;
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
  .use_company {
    .uc_box {
      overflow: hidden;
      height: 100%;
      width: 80%;
      margin: 0 auto;
      .uc_box_1 {
        margin-top: 10vh;
        margin-bottom: 5vh;
        .uc_box_1_1 {
          .pageTitle()
        }
        .uc_box_1_2 {
          .pageSubTitle()
        }
        .uc_box_1_3 {
          .pageWordDes()
        }
      }
      .uc_box_2 {
        height:30%;
        margin-top:0vh;
        img {
          width: 100%;
        }
      }
    }
  }
}
</style>
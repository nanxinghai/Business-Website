<template>
  <div class="homePage">
    <full-page :options="options" ref="fullpage">
      <!-- 第一屏 -->
      <div class="section">
        <!-- 菜单导航 -->
        <Header></Header>
        <!-- 轮播图 -->
        <div class="slide">
          <img src="/static/homepage/1.png" />
        </div>
        <div class="slide">
          <img src="/static/homepage/2.png" />
        </div>
        <div class="slide">
          <img src="/static/homepage/3.png" />
        </div>
      </div>
      <!-- 第二屏 -->
      <div class="section bg_down about_us">
        <el-row style="height:100%;width: 80%;margin: 0 auto;" 
        type="flex" justify="space-around" align="middle">
          <el-col :sm="{span:24}" :lg="{span:10}" class="left">
            <transition enter-active-class="animated fadeInLeft">
              <div v-if="currentIndex == 1"></div>
            </transition>
          </el-col>
          <el-col :sm="{span:24}" :lg="{span:10}" class="right">
            <transition enter-active-class="animated fadeInRight">
              <div v-if="currentIndex == 1"></div>
            </transition>
          </el-col>
        </el-row>
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
export default {
  name: 'homePage',
  components: { Header, Foot },
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
        sectionsColor: ['#133367'],
        onLeave:(index, nextIndex, direction)=>{
          console.log("index"+JSON.stringify(index))
          console.log("nextIndex"+JSON.stringify(nextIndex))
          console.log("direction"+direction)
          this.addAnimate()
          this.currentIndex = nextIndex.index
        }
      },
      time:'',
      currentIndex:0
    }
  },
  mounted() {
    this.time = setInterval(() => {
      this.$refs.fullpage.api.moveSlideRight() // 向右滚动
    }, 5000)
  },
  methods: {
    addAnimate(){
      console.log("hhhhh")
    }
  }
}
</script>

<style lang="less" scoped>
.homePage {
  .slide {
    img {
      width: 1280px;
      height: 720px;
      margin: 0 auto;
      display: block;
      box-shadow: 22px 27px 11px rgb(0 0 0 / 50%);
    }
  }
  .about_us {
    .left {
      height: 50%;
      div{
        width: 100%;
        height: 100%;
        background: #000;
      }
    }
    .right {
      height: 50%;
      div{
        width: 100%;
        height: 100%;
        background: #007acc;
      }
    }
  }
}
#particles-js {
  width: 100%;
  height: calc(100%);
  position: absolute; //设置absolute,其他DIV设置为relative，这样这个例子效果就作为背景
}
</style>
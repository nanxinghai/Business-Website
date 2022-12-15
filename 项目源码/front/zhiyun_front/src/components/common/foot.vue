<template>
  <div class="footer">
    <el-row type="flex" justify="center">
      <!-- top中间盒子 -->
      <el-col :lg="{span:15}" :xl="{span:15}" class="top_box">
          <el-row>
            <!-- 下属三个盒子 -->
            <!-- 联系方式 -->
            <el-col :sm="{span:9}" style="background:#2E3033;min-height:140px;" class="contactPhone">
              <div class="contactPhone_top">
                <i class="iconfont icon-24gl-phoneLoudspeaker"></i>
                <span>全国免费服务热线：</span>
              </div>
              <div class="contactPhone_phoneNum">
                <span>13438835715</span>
                <span>13550291397</span>
                <span>18180639606</span>
              </div>
            </el-col>
            <!-- 公司地址 -->
            <el-col :sm="{span:9}" style="background:#2E3033;min-height:140px;" class="contactPhone">
              <div class="contactPhone_top">
                <i class="iconfont icon-shouye"></i>
                <span>办公地址：</span>
              </div>
              <div class="contactPhone_phoneNum">
                <span>黑龙江省鹤岗市工农区新鹤路金广大厦1808</span>
              </div>
            </el-col>
            <!-- 公司二维码 -->
            <el-col :sm="{span:6}" style="background:#2E3033;height:140px;">
              <div class="qr">
                <img src="/static/foot/qrcode.png"/>
              </div>
            </el-col>
          </el-row>
      </el-col>
    </el-row>
    <!-- class="hidden-xs-only" -->
    <el-row type="flex" justify="center" >
      <el-col :lg="{span:15}" :xl="{span:15}">
        <el-divider></el-divider>
      </el-col>
    </el-row>
    <el-row type="flex" justify="center">
      <!-- bottom中间盒子 -->
      <el-col :lg="{span:15}" :xl="{span:15}" class="bottom_box">
        <div>版权所有：鹤岗智云科技有限责任公司  备案编号：黑ICP备19005092号</div>
        <div>始于2012，十年专注，值得信赖</div>
        <div>
          <i class="iconfont icon-qq"></i>
          <a href="http://wpa.qq.com/msgrd?v=3&uin=2830224482&site=qq&menu=yes" target="_blank">QQ交流</a>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name:'Foot'
}
</script>

<style lang="less" scoped>
.footer {
  width: 100%;
  background: #2E3033;
  font-size: @font_size_small;
  color: @font_grey_color;
  .contactPhone {
    z-index: 999;
    padding: 33px 0;
    .contactPhone_top {
      color: @font_grey_color;
    }
    .contactPhone_phoneNum {
      display: flex;
      // color: white;
      justify-content:center;
      margin-top: 20px;
      margin-left: 25px;
      span {
        flex: 1;
      }
    }
  }
  .qr {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    img {
      display: block;
      width: 108px;
      height: 107px;
    }
  }
}
// 底部上面中间盒子
.top_box {
  
}
// 底部下面中间盒子
.bottom_box {
  height: 139px;
  padding: 30px;
  background: #2E3033;
  div {
    text-align: center;
    margin-bottom: 12px;
  }
}
// 分割线
.el-divider--horizontal {
  margin: 0;
  background: #575555;
}
i {
  vertical-align: middle;
}
/*去除a标签下划线*/
a {
  color: #768190;
  text-decoration: none;
}
/*去除未被访问的a标签的下划线*/
a:link {
  color: #768190;
  text-decoration: none;
}
/*去除已经被访问过的a标签的下划线*/
a:visited {
  color: #768190;
  text-decoration: none;
}
/*去除鼠标悬停时的a标签的下划线*/
a:hover {
  color: #768190;
  text-decoration: none;
}
/*去除正在点击的a标签的下划线（鼠标按下，尚未松开）*/
a:active {
  color: #768190;
  text-decoration: none;
}
/*去除获得焦点的a标签的下划线（被鼠标点击过）*/
a:focus {
  color: #768190;
  text-decoration: none;
}
</style>
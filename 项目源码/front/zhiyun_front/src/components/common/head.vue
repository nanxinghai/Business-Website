<template>
  <div class="head">
    <el-row style="height:60px;max-width:1400px;margin:0 auto" type="flex" align="middle">
      <el-col :xs="{span:24}" :sm="{span:12}">
        <router-link to="/homePage">
        <svg-icon icon-class="common_logo"></svg-icon>
        </router-link>
      </el-col>
      <el-col :xs="{span:24}" :sm="{span:12}" class="menu">
        <ul>
          <li><router-link to="/homePage">首页</router-link></li>
          <li><router-link to="/serviceScope">服务范围</router-link></li>
          <li><router-link to="/processExample">流程示例</router-link></li>
          <li><router-link to="/aboutUs">关于我们</router-link></li>
        </ul>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name:'Head'
}
</script>

<style lang="less" scoped>
.head {
  color: @font_grey_color;
  position: absolute;
  width: 100%;
  z-index: 999;
  .svg-icon {
    font-size: 75px;
  }
}
.menu {
  ul {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: flex-end;
    width: 100%;
    li {
      color: @font_grey_color;
      font-size: @font_size_middle;
      list-style: none;
      flex: 1;
      text-align: right;
      &>a {
        color: @font_grey_color;
        text-decoration: none;
        cursor: pointer;
        &:hover {
          color: @font_blue_color;
        }
      }
    }
  }
}
// 当前活跃路由颜色区分
.router-link-active {
  color: @font_blue_color !important;
}
</style>
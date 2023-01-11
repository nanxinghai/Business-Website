<template>
  <div class="head">
    <el-row style="height:60px;max-width:1400px;margin:0 auto" type="flex" align="middle">
      <el-col :xs="{span:24}" :sm="{span:12}">
        <img src="static/head/logo.png"/>
      </el-col>
      <el-col :xs="{span:24}" :sm="{span:12}" class="menu">
        <ul>
          <li><a>首页</a></li>
          <li><a>服务范围</a></li>
          <li><a>流程示例</a></li>
          <li><a>关于我们</a></li>
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
      cursor: pointer;
      &:hover {
        color: @font_blue_color;
      }
    }
  }
}
</style>
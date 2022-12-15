<template>
  <div class="head">
    <el-row style="height:60px;max-width:1400px;margin:0 auto" type="flex" align="middle">
      <el-col :xs="{span:24}" :sm="{span:12}">
        <img src="static/head/logo.png"/>
      </el-col>
      <el-col :xs="{span:24}" :sm="{span:12}" class="hidden-xs-only menu">
        <ul>
          <li><a>首页</a></li>
          <li><a>服务范围</a></li>
          <li><a>流程示例</a></li>
          <li><a>关于我们</a></li>
        </ul>
      </el-col>
      <!-- 只在移动端显示 -->
      <el-col class="hidden-sm-and-up mobile">
        <span>首页</span>
        <i class="el-icon-s-fold" @click="expandMenu"></i>
      </el-col>
    </el-row>
    <!-- 抽屉弹框 -->
    <el-drawer
      title="当前位置：首页"
      :visible.sync="drawer"
      :size="'50%'"
    >
      <ul class="expandmenu">
        <li><a>首页</a></li>
        <li><a>服务范围</a></li>
        <li><a>流程示例</a></li>
        <li><a>关于我们</a></li>
      </ul>
    </el-drawer>
  </div>
</template>

<script>
export default {
  name:'Head',
  data(){
    return {
      // 抽屉可见性
      drawer: false,
    }
  },
  methods:{
    expandMenu(){
      this.drawer = true
    }
  }
}
</script>

<style lang="less" scoped>
.head {
  color: @font_grey_color;
  position: absolute;
  width: 100%;
  z-index: 999;
}
.expandmenu {
  li {
    list-style: none;
    margin-bottom: 10px;
    cursor: pointer;
    &:hover {
      color: @font_blue_color;
    }
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
      cursor: pointer;
      &:hover {
        color: @font_blue_color;
      }
    }
  }
}
.mobile {
  display: flex;
  justify-content: flex-end;
  align-content: center;
  span {
    line-height: 28px;
    margin-right: 15px;
  }
  i {
    font-size: 28px;
    vertical-align: middle;
  }
}
</style>
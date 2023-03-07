<template>
  <div class="body_box">
    <el-tag
      v-for="tag in tags"
      :key="tag.id+''"
      :effect="$route.name == tag.path ? 'dark' : 'light'"
      closable
      @close="handleClose(tag)"
      @click="changeTag(tag)"
      >
      {{tag.menuName}}
    </el-tag>
    <router-view></router-view>
  </div>
</template>

<script>
import {mapState} from 'vuex'
export default {
  name:'Body',
  computed:{
    ...mapState('tagOptions',['tags'])
  },
  data(){
    return {
      
    }
  },
  methods: {
    //关闭
    handleClose(tag){
      if(tag.menuName === '首页'){
        this.$message({
          showClose: true,
          message: '首页不能关闭！！！',
          type: 'warning'
        });
        return
      }
      this.$store.dispatch('tagOptions/deleteTag',tag)
      // 方式一
      let tags = this.$store.state.tagOptions.tags
      let highlight = tags[tags.length - 1]
      // 切换路由
      this.$router.push({
          name: highlight.path
      })
    },
    // 点击
    changeTag(tag){
      // 切换路由
      this.$router.push({
          name: tag.path
      })
    }
  }
}
</script>

<style lang="less" scoped>
.body_box{
  .el-tag {
    text-align: center;
    width: 90px;
    margin-right: 5px;
    cursor: pointer;
    background-color: #ffffff;
    border-color: #ffffff;
    border-top-right-radius: 5px;
    border-top-left-radius: 5px;
    border-bottom-right-radius: 0px;
    border-bottom-left-radius: 0px;
    color: @font_color_grey;
    /deep/ .el-tag__close {
      color: @font_color_grey !important;
    }
  }
  .el-tag--light{
    border-color: #f0f3f7;
    background-color: #f0f3f7;
    /deep/ .el-tag__close:hover {
      background-color: white;
    }
  }
  .el-tag--dark{
    color: #79BBFF;
    /deep/ .el-tag__close {
      color: #79BBFF !important;
    }
    /deep/ .el-tag__close:hover {
      color: #79BBFF;
    }
  }
}
</style>
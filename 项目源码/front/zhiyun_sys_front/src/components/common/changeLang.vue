<template>
  <div class="change_box">
    <svg-icon icon-class="changeLanguage"></svg-icon>
    <div class="font">
      <el-dropdown trigger="click" @command="changeLanguage">
        <span class="el-dropdown-link">
          {{$t('language.name')}}<i class="el-icon-arrow-down el-icon--right"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item command='zh'>中文</el-dropdown-item>
          <el-dropdown-item command='en'>English</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
export default {
  name:'ChangeLang',
  methods:{
    changeLanguage(val){
      localStorage.setItem('languageSet',val)
      this.$i18n.locale = val
    }
  }
}
</script>

<style lang="less" scoped>
.change_box {
  width: 150px;
  height: 30px;
  display: flex;
  justify-items: center;
  .svg-icon {
    height: 100%;
    vertical-align: middle;
  }
  .font {
    font-size: @font_size_small;
    color: @font_color_dark;
    height: 100%;
    line-height: 30px;
    margin-left: 10%;
  }
}
</style>
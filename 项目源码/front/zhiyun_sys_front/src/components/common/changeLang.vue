<template>
  <div class="change_box">
    <svg-icon icon-class="changeLanguage"></svg-icon>
    <div class="font">
      <span>中文</span>

    </div>
  </div>
</template>

<script>
export default {
  name:'ChangeLang',

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
    height: 80%;
    line-height: 30px;
  }
}
</style>
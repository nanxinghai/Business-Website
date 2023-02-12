<template>
  <div class="containers">
    <div class="head">
      <div class="left_logo">
        <svg-icon icon-class="common_logo"></svg-icon>
      </div>
      <div class="right_changelang">
        <div class="in_box">
          <ChangeLang></ChangeLang>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ChangeLang from '@/components/common/changeLang.vue'
export default {
    name:'Login',
    components:{ChangeLang}
}
</script>

<style lang="less" scoped>
.containers {
  height: 100vh;
  position: relative;
  .head {
    position: absolute;
    width: 100%;
    height: 10%;
    display: flex;
    align-items: center;
    &>div {
      width: 50%;
      height: 80%;
    }
    .left_logo {
      font-size: 75px;
      padding-left: 3%;
    }
    .right_changelang {
      display: flex;
      align-items: center;
      flex-direction: row-reverse;
      .in_box {
        width: 20%;
        height: 40%;
        margin-right: 20%;
      }
    }
  }
}
</style>
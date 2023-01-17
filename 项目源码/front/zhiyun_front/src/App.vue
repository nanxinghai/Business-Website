<template>
  <div id="app">
    <!-- keep-alive缓存路由组件 -->
    <router-view></router-view>
  </div>
</template>

<script>
import mixin from '@/mixin/index.js'
export default {
  name: 'App',
  components: {},
  mixins:[mixin],
  data(){
    return {
      value: true
    }
  }
}
</script>

<style lang="less">
#app {
  
}
</style>

<template>
  <div id="app">
    <!-- keep-alive缓存路由组件 -->
    <keep-alive>
      <router-view></router-view>
    </keep-alive>
    <Foot></Foot>
  </div>
</template>

<script>
import Foot from '@/components/common/foot.vue'
export default {
  name: 'App',
  components: {
    Foot
  }
}
</script>

<style>
#app {
  
}
</style>

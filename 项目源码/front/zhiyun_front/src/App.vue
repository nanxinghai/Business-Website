<template>
  <div id="app">
    <!-- keep-alive缓存路由组件 -->
    <keep-alive>
      <router-view></router-view>
    </keep-alive>
  </div>
</template>

<script>
export default {
  name: 'App',
  components: {}
}
</script>

<style>
#app {
  
}
</style>

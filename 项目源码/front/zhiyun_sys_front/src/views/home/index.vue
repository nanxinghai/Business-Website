<template>
    <div class="container">home</div>
</template>

<script>
export default {
    name:'Home',
    created(){
      let href = window.location.href
      let index = href.indexOf("?");
      let start = href.substring(0,index)
      let lastindex = href.indexOf("#");
      let end = href.substring(lastindex,href.length)
      window.location.href = start + end
    },
}
</script>

<style lang="less" scoped>

</style>
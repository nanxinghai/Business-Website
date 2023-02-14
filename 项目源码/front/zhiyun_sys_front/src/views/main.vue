<template>
    <div class="main_container">
        <el-container class="con_all">
            <el-aside width="200px">
                <Aside></Aside>
            </el-aside>
            <el-container>
                <el-header>Header</el-header>
                <el-main>Main</el-main>
            </el-container>
        </el-container>
    </div>
</template>

<script>
import Header from '@/components/layout/header.vue'
import Aside from '@/components/layout/aside.vue'
export default {
    name:'Main',
    components:{Header,Aside}
}
</script>

<style lang="less" scoped>
.main_container {
    width: 100%;
    height: 100vh;
    background-color: #F0F3F7;
    .con_all {
        height: 100%;
        width: 100%;
    }
}
</style>
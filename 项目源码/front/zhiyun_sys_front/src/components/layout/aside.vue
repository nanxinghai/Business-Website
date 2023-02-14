<template>
    <div class="aside_container">
        <div class="logo_box">
            <svg-icon icon-class="common_logo"></svg-icon>
        </div>
        <el-menu default-active="1-4-1" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" :collapse="isCollapse">
            <!-- <el-menu-item index="5">
                <svg-icon icon-class="common_logo"></svg-icon>
            </el-menu-item> -->
            <el-submenu index="1">
                <template slot="title">
                <i class="el-icon-location"></i>
                <span slot="title">导航一</span>
                </template>
                <el-menu-item-group>
                <span slot="title">分组一</span>
                <el-menu-item index="1-1">选项1</el-menu-item>
                <el-menu-item index="1-2">选项2</el-menu-item>
                </el-menu-item-group>
                <el-menu-item-group title="分组2">
                <el-menu-item index="1-3">选项3</el-menu-item>
                </el-menu-item-group>
                <el-submenu index="1-4">
                <span slot="title">选项4</span>
                <el-menu-item index="1-4-1">选项1</el-menu-item>
                </el-submenu>
            </el-submenu>
            <el-menu-item index="2">
                <i class="el-icon-menu"></i>
                <span slot="title">导航二</span>
            </el-menu-item>
            <el-menu-item index="3" disabled>
                <i class="el-icon-document"></i>
                <span slot="title">导航三</span>
            </el-menu-item>
            <el-menu-item index="4">
                <i class="el-icon-setting"></i>
                <span slot="title">导航四</span>
            </el-menu-item>
        </el-menu>
    </div>
</template>

<script>
export default {
    name: 'Aside'
}
</script>

<style lang="less" scoped>
.aside_container {
    height: 100%;
    width: 100%;
    background-color: white;
    .logo_box {
        width: 80%;
        height: 56px;
        margin:0 auto;
        text-align: center;
        font-size: 70px;
        line-height: 56px;
        border-bottom: 1px #F0F2F5 solid;
        overflow: hidden;
    }
    .el-menu-vertical-demo {

    }
}
</style>
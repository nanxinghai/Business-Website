<template>
    <div class="aside_container">
        <div class="logo_box">
            <svg-icon icon-class="common_logo"></svg-icon>
        </div>
        <el-menu default-active="5" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" :collapse="isCollapse">
            <el-menu-item index="5">
                <i class="iconfont icon-home"></i>
                <!-- <span class="iconfont icon-home"></span> -->
                <span slot="title">首页</span>
            </el-menu-item>
            <el-submenu index="1">
                <template slot="title">
                    <i class="iconfont icon-front"></i>
                    <span slot="title">前台设置</span>
                </template>
                <el-menu-item index="1-1">轮播切换</el-menu-item>
            </el-submenu>
            <el-submenu index="2">
                <template slot="title">
                    <i class="iconfont icon-demand"></i>
                    <span slot="title">需求设置</span>
                </template>
                <el-menu-item index="2-1">轮播切换</el-menu-item>
            </el-submenu>
            <el-submenu index="3">
                <template slot="title">
                    <i class="iconfont icon-user"></i>
                    <span slot="title">个人中心</span>
                </template>
                <el-menu-item index="3-1">轮播切换</el-menu-item>
            </el-submenu>
            <el-submenu index="4">
                <template slot="title">
                    <i class="iconfont icon-setting"></i>
                    <span slot="title">系统设置</span>
                </template>
                <el-menu-item index="4-1">轮播切换</el-menu-item>
            </el-submenu>
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
        height: 60px;
        margin:0 auto;
        text-align: center;
        font-size: 70px;
        line-height: 60px;
        border-bottom: 1px #F0F2F5 solid;
        overflow: hidden;
    }
    .el-menu-vertical-demo {
        border: 0;
        color: @font_color_aside_grey;
        font-weight: 400;
        letter-spacing: 0px;
        .el-menu-item {
            font-size: @font_size_aside;
            .iconfont {
                margin-right: 5px;
                width: 24px;
                text-align: center;
                font-size: 18px;
                vertical-align: middle;
            }
        }
        .el-submenu {
            .iconfont {
                margin-right: 5px;
                width: 24px;
                text-align: center;
                font-size: 18px;
                vertical-align: middle;
            }
            ::v-deep .el-submenu__title {
                font-size: @font_size_aside;
            }
        }
    }
}
</style>
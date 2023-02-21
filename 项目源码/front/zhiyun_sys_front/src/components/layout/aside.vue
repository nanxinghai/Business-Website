<template>
    <div class="aside_container">
        <div class="logo_box">
            <svg-icon icon-class="common_logo"></svg-icon>
        </div>
        <el-menu class="el-menu-vertical-demo"
            :default-active="menuList[0].id" 
            @open="handleOpen" 
            @close="handleClose" 
            :collapse="isCollapse"
            >
            <template v-for="(item) in menuList">
                <el-menu-item v-if="item.children === undefined" :key="item.id" :index="item.id" @click="changeMenu(item)">
                    <i :class="`iconfont icon-${item.name}`"></i>
                    <span slot="title">{{item.label}}</span>
                </el-menu-item>
                <el-submenu v-if="item.children !== undefined" :key="item.id" :index="item.id">
                    <template slot="title">
                        <i :class="`iconfont icon-${item.name}`"></i>
                        <span slot="title">{{item.label}}</span>
                    </template>
                    <el-menu-item v-for="e in item.children" :index="e.id" :key="e.id" @click="changeMenu(e)">
                        {{e.label}}
                    </el-menu-item>
                </el-submenu>
            </template>
        </el-menu>
        <!-- <el-menu default-active="5" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" :collapse="isCollapse">
            <el-menu-item index="5">
                <i class="iconfont icon-home"></i>
                <span slot="title">首页</span>
            </el-menu-item>
            <el-submenu index="1">
                <template slot="title">
                    <i class="iconfont icon-front"></i>
                    <span slot="title">前台设置</span>
                </template>
                <el-menu-item index="1-1">菜单开放</el-menu-item>
                <el-menu-item index="1-2">底部设置</el-menu-item>
                <el-menu-item index="1-3">联系我们</el-menu-item>
            </el-submenu>
            <el-submenu index="2">
                <template slot="title">
                    <i class="iconfont icon-demand"></i>
                    <span slot="title">需求设置</span>
                </template>
                <el-menu-item index="2-1">需求列表</el-menu-item>
            </el-submenu>
            <el-submenu index="3">
                <template slot="title">
                    <i class="iconfont icon-user"></i>
                    <span slot="title">个人中心</span>
                </template>
                <el-menu-item index="3-1">个人信息</el-menu-item>
                <el-menu-item index="3-2">消息列表</el-menu-item>
                <el-menu-item index="3-3">登录日志</el-menu-item>
            </el-submenu>
            <el-submenu index="4">
                <template slot="title">
                    <i class="iconfont icon-settings"></i>
                    <span slot="title">系统设置</span>
                </template>
                <el-menu-item index="4-1">用户设置</el-menu-item>
                <el-menu-item index="4-2">角色设置</el-menu-item>
                <el-menu-item index="4-3">权限设置</el-menu-item>
                <el-menu-item index="4-4">资源设置</el-menu-item>
            </el-submenu>
        </el-menu> -->
        <div class="copyright">
            <div class="first">ZhiYun BackGround System</div>
            <div class="two">© 2023 All Rights Reserved</div>
            <div class="three">Made with qq2830224482</div>
        </div>
    </div>
</template>

<script>
import {mapState} from 'vuex'
export default {
    name: 'Aside',
    computed:{
        ...mapState('menuOptions',['isCollapse']),
        ...mapState('menuOptions',{menuList:'menu'})
    },
    data(){
        return {

        }
    },
    methods:{
        handleOpen(key, keyPath){
            // console.log(key, keyPath);
        },
        handleClose(key, keyPath){
            // console.log(key, keyPath);
        },
        changeMenu(item){

            // 切换路由
            this.$router.push({
                name: item.name
            })
        }
    }
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
        .svg-icon {
            width: 1.2em;
        }
    }
    .el-menu-vertical-demo {
        padding: 0 10%;
        box-sizing: border-box;
        margin: 10px auto 0;
        width: 100%;
        border: 0;
        color: @font_color_aside_grey;
        font-weight: 400;
        letter-spacing: 0px;
        max-height: 75%;
        height: 75%;
        overflow: auto;
        .is-active {
            background-color: #409eff;
            border-radius: 10px;
            color: @font_color_white;
        }
        .el-menu-item {
            border-radius: 10px;
            height: auto;
            line-height: 40px;
            font-size: @font_size_small;
            margin-bottom: 10px;
            margin-top: 10px;
            .iconfont {
                margin-right: 15px;
                width: 24px;
                text-align: center;
                font-size: 18px;
                vertical-align: middle;
            }
        }
        .el-submenu {
            margin-bottom: 10px;
            .iconfont {
                margin-right: 15px;
                width: 24px;
                text-align: center;
                font-size: 18px;
                vertical-align: middle;
            }
            ::v-deep .el-submenu__title {
                background-color: @font_color_white;
                font-size: @font_size_small;
                height: auto;
                line-height: 40px;  
            }
            &>.el-menu {
                &>.el-menu-item {
                    width: 100%;
                    min-width: 0;
                    // padding-left: 100px !important;
                    text-align: center;
                }
            }
        }
    }
    // .el-menu-vertical-demo::-webkit-scrollbar {
    //     width: 2px;
    //     border-radius: 8px;
    // }
    // .el-menu-vertical-demo::-webkit-scrollbar-thumb {
    //     border-radius: 10px;
    //     -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
    //     opacity: 0.2;
    //     background: fade(#96999f, 30%);
    // }
    // .el-menu-vertical-demo::-webkit-scrollbar-track {
    //     -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
    //     border-radius: 0;
    //     background: fade(#96999f, 10%);
    // }
    .el-menu-vertical-demo::-webkit-scrollbar {
        width: 2px !important;
        background: transparent !important;
        border-radius: 3px !important;
    }

    .el-menu-vertical-demo::-webkit-scrollbar-thumb {
        width: 6px !important;
        background-color: #cfcfcf !important;
        border-radius: 3px !important;
    }

    .el-menu-vertical-demo::-webkit-scrollbar-track {
        // 滚动条里面轨道
        background: rgba(0, 0, 0, 0.05) !important;
        background: none !important;
    }

    // 滚动条的交叉处正方形
    .el-menu-vertical-demo::-webkit-scrollbar-corner {
        background-color: transparent !important;
    }
    .copyright {
        width: 80%;
        margin: 10% auto 0;
        font-size: @font_size_ssmall;
        white-space: nowrap;
        text-align: center;
        overflow: hidden;
        .first {

        }
        .two {
            margin-top: 5%;
            color: #717579;
        }
        .three {
            margin-top: 15%;
            color: #717579;
        }
    }

}
</style>
<template>
    <div class="header_con">
        <div class="left">
            <i class="iconfont icon-fileon"></i>
            <!-- <span class="one_level">首页</span>
            <span class="two_level"> / 数据中心</span> -->
            <el-breadcrumb separator="/">
                <el-breadcrumb-item
                    v-for="(item,index) in breadList"
                    :key="index"
                    :to="{ path: item.path }"
                >{{item.meta.menuName}}</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="right">
            <i class="iconfont icon-sousuo"></i>
            <i class="iconfont icon-settings"></i>
            <i class="iconfont icon-yingyongzhongxin"></i>
            <span class="img_box">
                <img :src="userInfo.avatar" alt="">
            </span>
            <span class="nickname">{{userInfo.nickName}}</span>
            <span class="change">
                <ChangeLang></ChangeLang>
            </span>
        </div>
    </div>
</template>

<script>
import ChangeLang from '@/components/common/changeLang.vue'
export default {
    name:'Header',
    components: {ChangeLang},
    data(){
        return {
            breadList:[], // 路由集合
            userInfo:{}
        }
    },
    watch:{ //路由改变的时候监听
          $route() {
            this.getBreadcrumb();
        }
    },
    created(){
        this.getBreadcrumb();
        this.getUserInfo()
    },
    methods:{
        changeCollapse(){
            this.$store.dispatch('menuOptions/changeCollapse')
        },
        isHome(route) { //拿到首页
            return route.meta.menuName === "首页";
        },
        getBreadcrumb() {
            let matched = this.$route.matched; //拿到显示的路由路径
            // 目的：去除路径的根元素（root）start
            // 真离谱bug（必须先在数组首位添加一个元素，最后删除才不影响二级路由）
            // 直接删除就会影响二级路由
            matched = [{ path: "/home", meta: { menuName: "智云后台" } }].concat(matched);
            if(!this.isHome(matched[2])){//当前路由等于首页
                matched.splice(1,0,{path: "/home", meta: { menuName: "首页" }})
                matched.splice(2,1)
            }else{
                matched.splice(1,1)
            }
            matched.splice(0,1)
            // 目的：去除路径的根元素（root）end
            this.breadList = matched;   
        },
        getUserInfo(){
            this.userInfo = JSON.parse(localStorage.getItem('userInfo'))
        }
    }
}
</script>

<style lang="less" scoped>
.header_con {
    height: 100%;
    width: 100%;
    background-color: white;
    position: relative;
    &>div {
        position: absolute;
    }
    .left {
        height: 100%;
        width: 20%;
        left: 1%;
        line-height: 60px;
        vertical-align: middle;
        .el-breadcrumb{
            display: inline-block;
            margin-left: 20px;
        }
        .iconfont {
            font-size: 12px;
            color: @font_color_aside_grey;
            vertical-align: top;
        }
        &>span {
            font-size: @font_size_small;
        }
        .one_level {
            margin-left: 5%;
        }
        .two_level {
            color: @font_color_grey;
        }
    }
    .right {
        margin-top: 0;
        height: 100%;
        width: 450px;
        right: 2%;
        line-height: 60px;
        vertical-align: middle;
        color: @font_color_header_grey;
        overflow: hidden;
        i {
            margin-left: 25px;
            font-size: @font_size_middle;
        }
        .nickname {
            margin-left: 15px;
            font-size: @font_size_small;
        }
        .img_box {
            top: 10px;
            position: relative;
            display: inline-block;
            width: 40px;
            margin-left: 25px;
            height: 40px;
            &>img {
                width: 100%;
                height: 100%;
                border-radius: 5px;
            }
        }
        .change {
            display: inline-block;
            margin-left: 35px;
            position: relative;
            top: 8px;
        }
    }
}
</style>
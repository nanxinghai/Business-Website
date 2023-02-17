<template>
    <div class="header_con">
        <div class="left">
            <i class="iconfont icon-fileon"></i>
            <span class="one_level">首页</span>
            <span class="two_level"> / 数据中心</span>
        </div>
        <div class="right">
            <i class="iconfont icon-sousuo"></i>
            <i class="iconfont icon-settings"></i>
            <i class="iconfont icon-yingyongzhongxin"></i>
            <span class="img_box">
                <img :src="require('@/assets/img/ahover.jpg')" alt="">
            </span>
            <span class="nickname">高启强</span>
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
    components: {ChangeLang}
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
        .iconfont {
            font-size: 12px;
            color: @font_color_aside_grey;
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
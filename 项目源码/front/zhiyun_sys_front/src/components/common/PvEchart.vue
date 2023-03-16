<template>
    <v-chart :option="options" :autoresize="true" ></v-chart>
</template>

<script>
export default {
    // 首页pv组件
    name:'PvEchart',
    data(){
        return {
            options:{
                color:['#95d475','#409eff'],
                tooltip: {
                    trigger: 'item'
                },
                legend: {
                    top: '5%',
                    left: 'center'
                },
                series: [
                {
                    name: 'Access From',
                    type: 'pie',
                    radius: ['40%', '55%'],
                    avoidLabelOverlap: false,
                    label: {
                    show: false,
                    position: 'center'
                    },
                    emphasis: {
                    label: {
                        show: true,
                        fontSize: 40,
                        fontWeight: 'bold'
                    }
                    },
                    labelLine: {
                        show: false
                    },
                    data: [
                        { value: 1048, name: 'Search Engine' },
                        { value: 735, name: 'Direct' }
                    ]
                }
                ]
            }
        }
    },
    mounted(){

    },
    methods:{

    }
}
</script>

<style lang="less" scoped>
.echarts {
    height: 100%;
    width: 100%;
}
</style>
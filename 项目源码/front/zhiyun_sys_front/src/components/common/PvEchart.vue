<template>
    <v-chart :option="options" :autoresize="true" ref="charts"></v-chart>
</template>

<script>
export default {
    // 首页pv组件
    name:'PvEchart',
    props:{
        seriesData:{
            type:Array
        }
    },
    watch:{
        seriesData:{
            handler(nv,ov){
                this.sData = nv
            },
            immediate:true,
            deep:true
        },
        sData:{
            handler(nv,ov){
                this.options.series[0].data = nv
            },
            immediate:true,
            deep:true
        }
    },
    data(){
        return {
            sData:[
                {
                    name: this.seriesData[0].name
                },
                {
                    name: this.seriesData[1].name
                }
            ],
            options:{
                color:['#95d475','#409eff'],
                tooltip: {
                    trigger: 'item'
                },
                
                series: [
                {
                    name: '服务访问',
                    type: 'pie',
                    radius: ['40%', '55%'],
                    avoidLabelOverlap: false,
                    label: {
                        show: true,
                        position: 'center',
                        formatter:(name)=>{
                            // let items = this.seriesData[0]
                            let items = this.sData[0]
                            let arr = [
                                '{a|'+items.name+'}',
                                '{b|'+items.scale+'}'
                            ]
                            return arr.join('\n')
                        },
                        rich:{
                            a:{
                                fontSize: 16,
                                color:'#3f3f3f',
                                fontWeight:'bold'
                            },
                            b:{
                                fontSize: 18,
                                color:'#3f3f3f',
                                fontWeight:'bold',
                                padding:[10,0,0,0],
                            }
                        }
                    },
                    // data: [
                    //     { value: 777, name: '今日PV' ,color:'#95d475'},
                    //     { value: 1048, name: '总共PV',color:'#409eff' }
                    // ],
                    data: this.sData ,
                    itemStyle:{
                        // 饼图间隙
                        borderWidth: 5,
                        borderColor: '#fff'
                    }
                }
                ],
                legend: {
                    // 设置图例不是圆角
                    icon:'rect',
                    top: '5%',
                    left: 'center',
                    itemWidth: 16,
                    itemHeight: 16,
                    // 每个图例项之间的间隔
                    itemGap: 40,
                    textStyle:{
                        color:'#96989b',
                        fontSize: 14,
                        rich:{
                            a:{
                                fontSize:14,
                                verticalAlign:'middle',
                                    align:'left',
                                    padding:[0,0,0,0]
                            },
                            b:{
                                color:'black',
                                fontSize:14,
                                fontWeight:'bold',
                                align:'left',
                                padding:[40,0,0,0],
                                lineHeight:0
                            }
                        }
                    },
                    formatter:(name)=>{
                        // var icon = '<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:' + this.getColor(name) + ';"></span>';
                        // var text = '<span style="font-size:14px;">' + name + '</span>';
                        // return [icon + text];
                        // console.log(name)
                        let items = this.sData.find(function(item){return item.name === name;})
                        // if(items == undefined){
                        //     return
                        // }

                        let arr = [
                            '{a|'+name+'}',
                            '{b|'+items.value+'}'
                        ]
                        return arr.join('\n')
                    }
                },
            }
        }
    },
    mounted(){

    },
    methods:{
        getColor(seriesName){
            // 通过 seriesName 获取对应的 seriesIndex
            var seriesIndex = -1;
            var series = this.options.series[0].data; 
            for (var i = 0; i < series.length; i++) {
                if (series[i].name === seriesName) {
                    seriesIndex = i;
                break;
                }
            }

            // 获取对应 seriesIndex 的颜色
            var color = this.options.color[seriesIndex];

            return color;
        },
        encodeHTML(str){
            return str.replace(/[&<>'"]/g, function(match) {
                switch(match) {
                case '&': return '&amp;';
                case '<': return '&lt;';
                case '>': return '&gt;';
                case '\'': return '&#x27;';
                case '"': return '&quot;';
                }
            });
        }
    }
}
</script>

<style lang="less" scoped>
.echarts {
    height: 100%;
    width: 100%;
}
</style>
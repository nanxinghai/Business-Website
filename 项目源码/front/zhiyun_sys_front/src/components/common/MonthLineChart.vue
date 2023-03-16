<template>
  <v-chart :option="options" :autoresize="true" ></v-chart>
</template>

<script>
export default {
  name:'MonthLineChart',
  data(){
    return {
      options:{
        color:['#405df9','#ee62a3','#3aacff'].reverse(),
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
          // x轴刻度点
          axisTick: {
            show: false,
          },
        },
        yAxis: {
          type: 'value',
          splitLine:{
            show:true,
            lineStyle:{
              color:'#cccccc',
              type:'dashed'
            }
          }
        },
        series: [
          {
            name: 'Email',
            type: 'line',
            stack: 'Total',
            data: [120, 132, 101, 134, 90, 230, 210]
          },
          {
            name: 'Union Ads',
            type: 'line',
            stack: 'Total',
            data: [220, 182, 191, 234, 290, 330, 310]
          },
          {
            name: 'Video Ads',
            type: 'line',
            stack: 'Total',
            data: [150, 232, 201, 154, 190, 330, 410]
          },
        ]        
      }
    }
  },
  mounted(){

  }
}
</script>

<style lang="less" scoped>

</style>
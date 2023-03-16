<template>
  <div class="map_chart" ref="map_chart"></div>
</template>

<script>
import axios from "axios"
export default {
  name:'MapChart',
  data(){
    return {

    }
  },
  mounted(){
    this.init()
  },
  methods:{
    async init(){
      
      await axios.get('./china.json').then(res => {
        let {data:resData} = res
        let myCharts = this.$echarts.init(this.$refs.map_chart)
        this.$echarts.registerMap('chinaMap',resData)
        var option = {
          series: [
            {
              name: '中国地图',
              type: 'map',
              map: 'chinaMap',// 这个是上面注册时的名字哦，registerMap（'这个名字保持一致'）
              label: {
                show: false
              }
            }
          ]
        }
        myCharts.setOption(option)
      })
    }
  }
}
</script>

<style lang="less" scoped>
.map_chart {
  width: 100%;
  height: 100%;
}
</style>
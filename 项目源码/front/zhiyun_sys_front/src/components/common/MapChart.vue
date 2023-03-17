<template>
  <div class="map_chart" ref="map_chart"></div>
</template>

<script>
import axios from "axios"
export default {
  name:'MapChart',
  data(){
    return {
      myCharts:null
    }
  },
  mounted(){
    this.init()
    window.addEventListener('resize',() => {
      this.myCharts.resize()
    })
  },
  beforeDestroy(){
    window.removeEventListener('resize',() => {
      this.myCharts.resize()
    })
  },
  methods:{
    async init(){
      var airData = [
        { name: '北京市', value: 167.92 },
        { name: '天津市', value: 189.13 },
        { name: '上海市', value: 131.22 },
        { name: '重庆市', value: 66 },
        { name: '河北省', value: 147 },
        { name: '河南省', value: 113 },
        { name: '云南省', value: 25.04 },
        { name: '辽宁省', value: 50 },
        { name: '黑龙江省', value: 114 },
        { name: '湖南省', value: 175 },
        { name: '安徽省', value: 117 },
        { name: '山东省', value: 92 },
        { name: '新疆省', value: 84 },
        { name: '江苏省', value: 67 },
        { name: '浙江省', value: 84 },
        { name: '江西省', value: 96 },
        { name: '湖北省', value: 273 },
        { name: '广西省', value: 59 },
        { name: '甘肃省', value: 99 },
        { name: '山西省', value: 39 },
        { name: '内蒙古省', value: 58 },
        { name: '陕西市省', value: 61 },
        { name: '吉林省', value: 51 },
        { name: '福建省', value: 29 },
        { name: '贵州省', value: 71 },
        { name: '广东省', value: 38 },
        { name: '青海省', value: 57 },
        { name: '西藏省', value: 24 },
        { name: '四川省', value: 58 },
        { name: '宁夏省', value: 52 },
        { name: '海南省', value: 54 },
        { name: '台湾省', value: 88 },
        { name: '香港省', value: 66 },
        { name: '澳门省', value: 77 },
        { name: '西藏自治区', value: 55 },
        { name: '新疆维吾尔自治区', value: 45 },
        { name: '内蒙古自治区', value: 45 },
        { name: '陕西省', value: 45 },
        { name: '宁夏回族自治区', value: 45 },
        { name: '广西壮族自治区', value: 45 },
    ]
      await axios.get('./china.json').then(res => {
        let {data:resData} = res
        // console.log(resData)
        this.myCharts = this.$echarts.init(this.$refs.map_chart)
        this.$echarts.registerMap('chinaMap',resData)
        var option = {
          geo:{
              name: '中国地图',
              type: 'map',
              map: 'chinaMap',// 这个是上面注册时的名字哦，registerMap（'这个名字保持一致'）
              label: {
                show: false
              },
              roam: true, // 允许缩放和拖拽效果
              zoom: 1.5, // 页面初始化的缩放比例
              center:[104.065735, 32.659462], // 地图默认中心点
              emphasis: {
                //是图形在高亮状态下的样式,比如在鼠标悬浮或者图例联动高亮时
                label: {show: true}
              },
              itemStyle: {
                  // 设置外层边框
                  borderWidth: 1,
                  borderColor: '#8e9093',
                  
              }
          },
          tooltip: {
            trigger: 'item'
          },
          series: [
            {
              name:'空气质量',
              data:airData, // 空气质量数据
              geoIndex:0,  // 绑定给第一个geo配置
              type:'map' // 类型为map
            }
          ],
          visualMap:{
            min:0, // 左下角区域最小值
            max:300,  // 左下角区域最大值
            inRange:{
              color:['#c4ebff','#409eff']  // 颜色范围
            },
            calculable:true   // 是否开启滑块筛选
          }
        }
        this.myCharts.setOption(option)
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
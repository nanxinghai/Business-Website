<template>
    <div class="container">
      <el-row :gutter="20" class="top">
        <el-col :span="10" class="pv_pie">
          <ul>
            <li>
              <PvEchart></PvEchart>
            </li>
            <li>
              <PvEchart></PvEchart>
            </li>
          </ul>
        </el-col>
        <el-col :span="7">
          <LineChart></LineChart>
        </el-col>
        <el-col :span="7"></el-col>
      </el-row>
      <el-row :gutter="20" class="bottom">
        <el-col :span="11">
          <MapChart></MapChart>
        </el-col>
        <el-col :span="13"></el-col>
      </el-row>
    </div>
</template>

<script>
import PvEchart from '@/components/common/PvEchart.vue'
import LineChart from '@/components/common/MonthLineChart.vue'
import MapChart from '@/components/common/MapChart.vue'
export default {
    name:'Home',
    components:{PvEchart,LineChart,MapChart},
    data(){
      return {
        
      }
    },
    created(){
      // 微信扫码登录后清楚回调携带的参数
      this.clearAddress()

    },
    methods:{
      clearAddress(){
        let href = window.location.href
        let index = href.indexOf("?");
        let start = href.substring(0,index)
        let lastindex = href.indexOf("#");
        let end = href.substring(lastindex,href.length)
        window.location.href = start + end
      }
    }
}
</script>

<style lang="less" scoped>
li {
  list-style: none;
}
.container {
  height: 84vh;
  .top {
    height: 40%;
    .el-col {
      height: 100%; 
    }
    .pv_pie {
      &>ul {
        height: 100%;
        padding: 0;
        margin: 0;
        &>li {
          height: 100%;
          width:50%;
          display: inline-block;
          position: relative;
        }
        &>li:nth-child(1)::after {
          content: "";
          width: 2px;
          height: 80%;
          background-color: #f7f9fb;
          position: absolute;
          top: 50%;
          right: 0;
          transform: translateY(-50%);
        }
      }
    }
  }
  .bottom {
    height: 60%;
    .el-col {
      height: 100%;
    }
  }
}
</style>
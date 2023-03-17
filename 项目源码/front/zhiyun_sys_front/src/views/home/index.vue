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
        <el-col :span="7" class="user">
          <div class="ava">
            <img  :src="userInfo.avatar" />
          </div>
          <div class="login_info">
            <div>下午好,{{userInfo.nickName}}</div>
            <div>当前角色：管理员</div>
            <div>上次登录：2023-03-17 18:04:32</div>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="bottom">
        <el-col :span="11">
          <MapChart></MapChart>
        </el-col>
        <el-col :span="13">
          <el-table
            :data="tableData"
            style="width: 100%">
            <el-table-column
              prop=""
              label="IP"
              >
            </el-table-column>
          </el-table>
        </el-col>
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
        userInfo:null,
        tableData:[]
      }
    },
    created(){
      // 微信扫码登录后清楚回调携带的参数
      this.clearAddress()
      this.getAvaImg()
    },
    methods:{
      clearAddress(){
        let href = window.location.href
        let index = href.indexOf("?");
        let start = href.substring(0,index)
        let lastindex = href.indexOf("#");
        let end = href.substring(lastindex,href.length)
        window.location.href = start + end
      },
      getAvaImg(){
        let userInfo = JSON.parse(localStorage.getItem('userInfo'))
        this.userInfo = userInfo
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
    .user {
      .ava {
        position: relative;
        width: 100%;
        height: 50%;
        img {
          width: 25%;
          height: 65%;
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%,-50%);
          border-radius: 50%;
        }
      }
      .login_info {
        overflow: hidden;
        width: 100%;
        height: 50%;
        text-align: center;
        div {
          margin-top: 7%;
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
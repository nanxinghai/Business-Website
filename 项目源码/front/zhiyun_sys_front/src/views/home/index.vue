<template>
    <div class="container">
      <el-row :gutter="20" class="top">
        <el-col :span="10" class="pv_pie">
          <ul>
            <li>
              <PvEchart :seriesData="PVData"></PvEchart>
            </li>
            <li>
              <PvEchart :seriesData="UVData"></PvEchart>
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
        <el-col :span="13" class="table_box">
          <el-table
            :data="tableData"
            style="width: 100%">
            <el-table-column
              prop="ip"
              label="IP"
              >
            </el-table-column>
            <el-table-column
              prop="addr"
              label="地址"
              >
            </el-table-column>
            <el-table-column
              prop="content"
              label="操作内容"
              >
            </el-table-column>
            <el-table-column
              prop="osName"
              label="浏览器类别"
              >
            </el-table-column>
            <el-table-column
              prop="reqTime"
              label="操作时间"
              >
            </el-table-column>
          </el-table>
          <div class="page_box">
            <el-pagination
              v-if="condition.total !== 0"
              @current-change="handleCurrentChange"
              :current-page.sync="condition.currentPage"
              :page-size="condition.pageSize"
              layout="total, prev, pager, next, jumper"
              :total="condition.total">
            </el-pagination>
          </div>
        </el-col>
      </el-row>
    </div>
</template>

<script>
import PvEchart from '@/components/common/PvEchart.vue'
import LineChart from '@/components/common/MonthLineChart.vue'
import MapChart from '@/components/common/MapChart.vue'
import {getLogData,getPUvData} from '@/api/home/index.js'
export default {
    name:'Home',
    components:{PvEchart,LineChart,MapChart},
    data(){
      return {
        userInfo:null,
        tableData:[],
        condition:{
          currentPage: 1,
          pageNum: 1,
          pageSize: 8,
          total:0
        },
        PVData:[
                { value: 797, name: '今日PV', scale:'66.6%',color:'#95d475'},
                { value: 1048, name: '总共PV', scale:'100%',color:'#409eff'}
            ],
        UVData:[
                { value: 797, name: '今日PV', scale:'66.6%',color:'#95d475'},
                { value: 1048, name: '总共PV', scale:'100%',color:'#409eff'}
        ]
      }
    },
    created(){
      // 微信扫码登录后清楚回调携带的参数
      this.clearAddress()
      this.getAvaImg()
      this.getTableData()
      this.getPieData()
    },
    methods:{
      // 获取表格数据
      getTableData(){
        getLogData(this.condition).then(res => {
          if(res.code === 0){
            this.tableData = res.data.data
            this.condition.total = res.data.total
          }
        })
      },
      // 获取首页饼形图数据
      getPieData(){
        getPUvData().then(res => {
          let pv = [
            {value: res.data.todayPV,name: '今日PV', scale:res.data.pvscale,color:'#95d475'},
            {value: res.data.totalPV, name: '总共PV', scale:'100%',color:'#409eff'}
          ]
          this.PVData = pv
          let uv = [
            {value: res.data.todayUV,name: '今日UV', scale:res.data.uvscale,color:'#95d475'},
            {value: res.data.totalUV,name: '总共UV', scale:'100%',color:'#409eff'},
          ]
          this.UVData = uv
        })
      },
      // 切换页码时
      handleCurrentChange(val){
        this.condition.pageNum = val
        this.getTableData()
      },
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
    .table_box {
      padding-top: 10px;
    }
    .page_box {
      position: relative;
      margin-top: 10px;
      .el-pagination {
        position: absolute;
        right: 0;
      }
    }
  }
}
</style>
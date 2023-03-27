<template>
  <div class="container">
    <div class="search_box">
      <el-form :inline="true" :model="queryCondition" class="demo-form-inline">
        <el-form-item label="昵称">
          <el-input v-model="queryCondition.nickName" placeholder="请输入昵称" size="mini" clearable></el-input>
        </el-form-item>
        <el-form-item label="电话">
          <el-input v-model="queryCondition.phonenumber" placeholder="请输入号码" size="mini" clearable></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-select v-model="queryCondition.sex" placeholder="请选择性别" size="mini" clearable>
            <el-option label="男" value="0"></el-option>
            <el-option label="女" value="1"></el-option>
            <el-option label="未知" value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSubmit" size="mini">查询</el-button>
        </el-form-item>
      </el-form>
    </div>
    <!-- <el-divider></el-divider> -->
    <div class="table_box">
      <el-table
        :data="tableData"
        stripe
        style="width: 100%">
        <el-table-column
          prop="id"
          label="ID"
          width="180">
        </el-table-column>
        <el-table-column
          prop="nickName"
          label="昵称"
          width="180">
        </el-table-column>
        <el-table-column
          prop="phonenumber"
          label="号码">
        </el-table-column>
        <el-table-column
          prop="email"
          label="邮箱">
        </el-table-column>
        <el-table-column
          label="性别">
          <template slot-scope="scope">
            <span v-if="scope.row.sex === '0'">男</span>
            <span v-else-if="scope.row.sex === '1'">女</span>
            <span v-else>未知</span>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="page_box">
      <el-pagination
        v-if="queryCondition.total !== 0"
        @current-change="handleCurrentChange"
        :page-size="queryCondition.pageSize"
        layout="prev, pager, next, jumper"
        :total="queryCondition.total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
import {pageListUser} from '@/api/settings/UserSettings.js'
export default {
  name:'userSettings',
  data(){
    return {
      tableData:[],
      queryCondition:{
        pageNum:1,
        pageSize:10,
        total:0,
        nickName:'',
        phonenumber:'',
        sex:''
      }
    }
  },
  created(){
    this.getUserPage()
  },
  methods:{
    // 获取用户数据
    getUserPage(){
      let data = {
        ...this.queryCondition
      }
      pageListUser(data).then(res=>{
        this.tableData = res.data.data
        this.queryCondition.total = res.data.total
      })
    },
    handleCurrentChange(val){
      this.queryCondition.pageNum = val
      this.getUserPage()
    },
    onSubmit(){
      this.queryCondition.pageNum = 1
      this.getUserPage()
    }
  }
}
</script>

<style lang="less" scoped>
.container {
  .search_box {

  }
  .table_box {

  }
  .page_box {
    height: 32px;
    margin-top: 10px;
    position: relative;
    .el-pagination {
      position: absolute;
      right: 0;
    }
  }
}
</style>
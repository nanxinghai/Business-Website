<template>
  <div class="container">
    <div class="search_box">
      <el-form :inline="true" :model="queryCondition" class="demo-form-inline">
        <el-form-item label="名称">
          <el-input v-model="queryCondition.name" placeholder="请输入名称" size="mini" clearable></el-input>
        </el-form-item>
        <el-form-item label="角色字符串">
          <el-input v-model="queryCondition.roleKey" placeholder="请输入角色字符串" size="mini" clearable></el-input>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="queryCondition.status" placeholder="请选择状态" size="mini" clearable>
            <el-option label="正常" value="0"></el-option>
            <el-option label="停用" value="1"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSubmit" size="mini">查询</el-button>
        </el-form-item>
      </el-form>
    </div>
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
          prop="name"
          label="名称"
          width="180">
        </el-table-column>
        <el-table-column
          prop="roleKey"
          label="角色字符串">
        </el-table-column>
        <el-table-column
          label="状态">
          <template slot-scope="scope">
            <span v-if="scope.row.status === '0'" style="color:green;">正常</span>
            <span v-else-if="scope.row.status === '1'" style="color:red;">停用</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="remark"
          label="备注">
        </el-table-column>
        <el-table-column
          label="操作">
          <template slot-scope="scope">
            <el-button type="primary" @click="authorize(scope.row.id)" size="mini">授权</el-button>
            <el-button type="warning" @click="forbidden(scope.row.id)" size="mini">禁用</el-button>
            <el-button type="danger" @click="delete(scope.row.id)" size="mini">删除</el-button>
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
import {pageListRole} from "@/api/settings/RoleSettings.js"
export default {
  name:'roleSettings',
  data(){
    return {
      tableData:[],
      queryCondition:{
        pageNum:1,
        pageSize:10,
        total:0,
        name:'',
        roleKey:'',
        status:''
      }
    }
  },
  created(){
    this.getData()
  },
  methods:{
    getData(){
      let data = {
        ...this.queryCondition
      }
      pageListRole(data).then(res => {
        this.tableData = res.data.data
        this.queryCondition.total = res.data.total
      })
    },
    handleCurrentChange(val){
      this.queryCondition.pageNum = val
      this.getData()
    },
    onSubmit(){
      this.queryCondition.pageNum = 1
      this.getData()
    },
    // 授权按钮
    authorize(val){

    },
    // 禁用按钮
    forbidden(val){

    },
    // 删除按钮
    delete(val){

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
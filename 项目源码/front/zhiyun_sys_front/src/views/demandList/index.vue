<template>
  <div class="container">
    <div class="search_box">
      <el-form :inline="true" :model="queryCondition" class="demo-form-inline">
        <el-form-item label="名称">
          <el-input v-model="queryCondition.name" placeholder="请输入名称" size="mini" clearable></el-input>
        </el-form-item>
        <el-form-item label="号码">
          <el-input v-model="queryCondition.phone" placeholder="请输入号码" size="mini" clearable></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="queryCondition.email" placeholder="请输入邮箱" size="mini" clearable></el-input>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="queryCondition.isRelation" placeholder="请选择状态" size="mini" clearable>
            <el-option label="未联系" value="0"></el-option>
            <el-option label="已联系" value="1"></el-option>
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
          >
        </el-table-column>
        <el-table-column
          prop="name"
          label="名称"
          >
        </el-table-column>
        <el-table-column
          prop="phone"
          label="号码">
        </el-table-column>
        <el-table-column
          prop="email"
          label="邮箱">
        </el-table-column>
        <el-table-column
          prop="demand"
          label="需求">
        </el-table-column>
        <el-table-column
          prop="addr"
          label="地址">
        </el-table-column>
        <el-table-column
          prop="createtime"
          label="时间">
        </el-table-column>
        <el-table-column
          label="联系状态">
          <template slot-scope="scope">
            <span v-if="scope.row.isRelation === '0'" style="color:red;">未联系</span>
            <span v-else-if="scope.row.isRelation === '1'" style="color:green;">已联系</span>
            <span v-else>未知</span>
          </template>
        </el-table-column>
        <el-table-column
          label="操作">
          <template slot-scope="scope">
            <el-button type="primary" @click="edit(scope.row.id)" size="mini" :disabled="scope.row.isRelation === '1'">更改联系状态</el-button>
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
import {pageList,updateIsRelation} from '@/api/demand'
export default {
  name:'demandList',
  data(){
    return {
      tableData:[],
      queryCondition:{
        pageNum:1,
        pageSize:10,
        total:0,
        name:'',
        phone:'',
        email:''
      },
    }
  },
  mounted(){
    this.getTableData()
  },
  methods:{
    getTableData(){
      let data = {
        ...this.queryCondition
      }
      pageList(data).then(res=> {
        this.tableData = res.data.data
        this.queryCondition.total = res.data.total
      })
    },
    onSubmit(){
      this.queryCondition.pageNum = 1
      this.getTableData()
    },
    handleCurrentChange(val){
      this.queryCondition.pageNum = val
      this.getTableData()
    },
    edit(id){
      this.$confirm('此操作将更改需求状态, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        updateIsRelation({id}).then(() => {
          // 刷新列表
          this.getTableData()
          this.$message({
            type: 'success',
            message: '操作成功'
          });
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消操作'
        });
      })
    },
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
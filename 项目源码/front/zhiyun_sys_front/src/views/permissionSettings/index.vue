<template>
  <div class="container">
    <div class="search_box">
      <el-form :inline="true" :model="queryCondition" class="demo-form-inline">
        <el-form-item label="名称">
          <el-input v-model="queryCondition.menuName" placeholder="请输入名称" size="mini" clearable></el-input>
        </el-form-item>
        <el-form-item label="路径">
          <el-input v-model="queryCondition.path" placeholder="请输入路径" size="mini" clearable></el-input>
        </el-form-item>
        <el-form-item label="类型">
          <el-select v-model="queryCondition.type" placeholder="请选择类型" size="mini" clearable>
            <el-option label="菜单" value="0"></el-option>
            <el-option label="接口" value="1"></el-option>
          </el-select>
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
        <el-form-item>
          <el-button type="primary" @click="addDailog" size="mini">新增</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="table_box">
      <el-table
        :data="tableData"
        stripe
        style="width: 100%"
        row-key="id"
        :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
        <!-- <el-table-column
          prop="id"
          label="ID"
          width="180">
        </el-table-column> -->
        <el-table-column
          prop="menuName"
          label="名称"
          >
        </el-table-column>
        <el-table-column
          prop="path"
          label="路径">
        </el-table-column>
        <el-table-column
          label="类型">
          <template slot-scope="scope">
            <span v-if="scope.row.type === '0'" >菜单</span>
            <span v-else-if="scope.row.type === '1'">接口</span>
          </template>
        </el-table-column>
        <el-table-column
          label="状态">
          <template slot-scope="scope">
            <span v-if="scope.row.status === '0'" style="color:green;">正常</span>
            <span v-else-if="scope.row.status === '1'" style="color:red;">停用</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="perms"
          label="权限字符串">
        </el-table-column>
        <el-table-column
          label="操作">
          <template slot-scope="scope">
            <el-button type="primary" @click="edit(scope.row)" size="mini">编辑</el-button>
            <el-button v-if="scope.row.status === '0'" type="danger" @click="stop(scope.row)" size="mini">停用</el-button>
            <el-button v-if="scope.row.status === '1'" type="success" @click="returnPer(scope.row)" size="mini">恢复</el-button>
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
import {pageListPer,stopStatus,returnStatus} from '@/api/settings/PermissionSettings.js' 
export default {
  name:'permissionSettings',
  data(){
    return {
      tableData:[],
      queryCondition:{
        pageNum:1,
        pageSize:10,
        total:0,
        menuName:'',
        path:'',
        type:'',
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
      pageListPer(data).then(res => {
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
    // 弹出新增
    addDailog(){

    },
    // 停用按钮
    stop(obj){
      this.$confirm('此操作将停用此菜单及下级菜单, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        stopStatus(obj).then((res) => {
          // 刷新页面
          this.getData()
          this.$message({
            type: 'success',
            message: '操作成功!'
          });
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消操作'
        });
      })
    },
    returnPer(obj){
      this.$confirm('此操作将恢复此菜单及下级菜单, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        returnStatus(obj).then((res) => {
          // 刷新页面
          this.getData()
          this.$message({
            type: 'success',
            message: '操作成功!'
          });
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消操作'
        });
      })
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
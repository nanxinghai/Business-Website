<template>
    <div class="container">
        <div class="search_box">
          <el-form :inline="true" :model="queryCondition" class="demo-form-inline">
            <el-form-item label="菜单名称">
              <el-input v-model="queryCondition.menuname" placeholder="请输入菜单名称" size="mini" clearable></el-input>
            </el-form-item>
            <el-form-item label="菜单code">
              <el-input v-model="queryCondition.menucode" placeholder="请输入菜单code" size="mini" clearable></el-input>
            </el-form-item>
            <el-form-item label="展示状态">
              <el-select v-model="queryCondition.isshow" placeholder="请选择展示状态" size="mini" clearable>
                <el-option label="已展示" :value="0"></el-option>
                <el-option label="未展示" :value="1"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="onSubmit" size="mini">查询</el-button>
              <el-button type="primary" @click="addDailog" size="mini">新增</el-button>
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
                prop="menuname"
                label="菜单名称"
                >
                </el-table-column>
                <el-table-column
                prop="menucode"
                label="菜单code">
                </el-table-column>
                <el-table-column
                prop="path"
                label="菜单路径">
                </el-table-column>
                <el-table-column
                prop="ordernum"
                label="排序">
                </el-table-column>
                <el-table-column
                prop="createtime"
                label="创建时间">
                </el-table-column>
                <el-table-column
                label="展示状态">
                <template slot-scope="scope">
                  <!-- <span v-if="scope.row.isshow === 0" style="color:green;">正常</span>
                  <span v-else-if="scope.row.isshow === 1" style="color:red;">停用</span> -->
                    <el-switch
                      v-model="scope.row.isshow"
                      active-text="已展示"
                      inactive-text="未展示"
                      :active-value="0"
                      :inactive-value="1">
                    </el-switch>
                </template>
                </el-table-column>
                <el-table-column
                label="操作">
                <template slot-scope="scope">
                    <el-button type="primary" @click="edit(scope.row.id)" size="mini">编辑</el-button>
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
import {pageList} from '@/api/front/menu.js'
export default {
    name:'Menu',
    data(){
        return {
            tableData:[],
            queryCondition:{
                pageNum:1,
                pageSize:10,
                total:0,
                menuname:'',
                menucode:'',
                isshow:''
            },
        }
    },
    mounted(){
        this.getData()
    },
    methods:{
      getData(){
          let data = {
              ...this.queryCondition
          }
          pageList(data).then(res => {
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
      // 新增弹框
      addDailog(){

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
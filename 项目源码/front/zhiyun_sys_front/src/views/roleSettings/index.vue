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
            <el-button type="success" @click="authorize(scope.row)" size="mini">授权</el-button>
            <el-button type="danger" @click="forbidden(scope.row)" size="mini" v-if="scope.row.status === '0'">禁用</el-button>
            <el-button type="success" @click="returnRole(scope.row)" size="mini" v-if="scope.row.status === '1'">恢复</el-button>
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
    <!-- 对话框 -->
    <div class="add_dialog_box">
      <el-dialog
        title="新增"
        :visible.sync="addDialogVisible"
        width="30%"
        :before-close="handleClose"
        :close-on-press-escape="false"
        :close-on-click-modal="false">
        <el-form 
          ref="form" 
          :model="form" 
          :rules="rules"
          label-width="80px">
          <el-form-item label="角色名称" prop="name">
            <el-input v-model="form.name" placeholder="请输入角色名称" size="mini" clearable></el-input>
          </el-form-item>
          <el-form-item label="角色字符" prop="roleKey">
            <el-input v-model="form.roleKey" placeholder="请输入角色字符串" size="mini" clearable></el-input>
          </el-form-item>
          <el-form-item label="状态" prop="status">
            <el-select v-model="form.status" placeholder="请选择状态" size="mini" clearable>
              <el-option label="正常" value="0"></el-option>
              <el-option label="停用" value="1"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="备注" prop="remark">
            <el-input type="textarea" v-model="form.remark" placeholder="请输入备注" size="mini" rows="8"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submit" size="mini">确 定</el-button>
        </span>
      </el-dialog>
    </div>
    <div class="edit_dialog_box">
      <el-dialog
        title="授权"
        :visible.sync="editDialogVisible"
        width="60%"
        :close-on-press-escape="false"
        :close-on-click-modal="false">
        <el-tree
          :data="roleMenus"
          show-checkbox
          node-key="id"
          default-expand-all
          :check-strictly="true"
          :default-checked-keys="checkedIds"
          @check="handleNodeClick"
          :props="{
            label:'menuName',
            children:'children',
            disabled(data,node){
              return data.status === '0' ? false : true
            }
          }"
          ref="tree"
          >
        </el-tree>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import {pageListRole,addOneRole,queryRolePer,changeRolePer,forbbinStatus,returnStatus} from "@/api/settings/RoleSettings.js"
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
      },
      // 新增弹框
      addDialogVisible:false,
      form:{
        name:'',
        roleKey:'',
        status:'0',
        remark:''
      },
      rules:{
        name:[
          { required: true, message: '请输入名称', trigger: 'blur' },
        ],
        roleKey:[
          { required: true, message: '请输入路径', trigger: 'blur' },
        ],
        status:[
          { required: true, message: '请输入类型', trigger: 'change' },
        ]
      },
      // 当前选中对象
      currentObj:{},
      // 授权弹框
      editDialogVisible:false,
      roleMenus:[],
      // 默认选中
      checkedIds:[]
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
    // 新增弹框
    addDailog(){
      this.addDialogVisible = true
    },
    handleNodeClick(item, node){
      //判断当前状态是选中还是取消选中
      const isCheck = this.$refs.tree.getCheckedNodes().indexOf(item) > -1
      let data = {
        id:item.id,
        roleId:this.currentObj.id,
        isChecked:isCheck
      }
      changeRolePer(data).then(res => {
        this.$message({
          type: 'success',
          message: '操作成功!'
        });
      })
    },
    // 提交新增
    submit(){
      this.$refs.form.validate((valid) => {
        // 校验通过
        if(valid){
          addOneRole(this.form).then((res) => {
            // 刷新页面
            this.getData()
            // 关闭dailog
            this.addDialogVisible = false
            // 重置表单数据
            this.$refs.form.resetFields();
            this.$message({
              type: 'success',
              message: '操作成功!'
            });
          })
        }else{
          return false
        }
      })
    },
    // 弹框关闭回调
    handleClose(done){
      // 重置表单数据
      this.$refs.form.resetFields();
      done()
    },
    // 授权按钮
    authorize(val){
      // 赋值当前对象
      this.currentObj = val
      queryRolePer(val).then(res=>{
        this.roleMenus = res.data.sysMenus
        this.checkedIds = res.data.ids
        // 打开窗口
        this.editDialogVisible = true
      })
      
    },
    // 禁用按钮
    forbidden(obj){
      this.$confirm('此操作将停用此角色, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        forbbinStatus(obj).then((res) => {
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
    // 恢复按钮
    returnRole(obj){
      this.$confirm('此操作将恢复此角色, 是否继续?', '提示', {
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
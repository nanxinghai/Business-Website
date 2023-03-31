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
          <el-button type="primary" @click="addVisible" size="mini">新增</el-button>
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
        <el-table-column
          label="操作">
          <template slot-scope="scope">
            <el-button type="success" @click="editDialogVisible(scope.row)" size="mini">设置角色</el-button>
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
    <div class="adddialog">
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
          <el-form-item label="用户名" prop="userName">
            <el-input v-model="form.userName" placeholder="请输入用户名" size="mini" clearable></el-input>
          </el-form-item>
          <el-form-item label="昵称" prop="nickName">
            <el-input v-model="form.nickName" placeholder="请输入昵称" size="mini" clearable></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input v-model="form.password" placeholder="请输入密码" size="mini" clearable type="password"></el-input>
          </el-form-item>
          <el-form-item label="状态" prop="status">
            <el-select v-model="form.status" placeholder="请选择状态" size="mini" clearable>
              <el-option label="正常" value="0"></el-option>
              <el-option label="停用" value="1"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="form.email" placeholder="请输入邮箱" size="mini" clearable></el-input>
          </el-form-item>
          <el-form-item label="号码" prop="phonenumber">
            <el-input v-model="form.phonenumber" placeholder="请输入号码" size="mini" clearable></el-input>
          </el-form-item>
          <el-form-item label="性别" prop="sex">
            <el-select v-model="form.sex" placeholder="请选择性别" size="mini" clearable>
              <el-option label="男" value="0"></el-option>
              <el-option label="女" value="1"></el-option>
              <el-option label="未知" value="2"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submit" size="mini">确 定</el-button>
        </span>
      </el-dialog>
    </div>
    <div class="editdialog">
      <el-dialog
        title="设置角色"
        :visible.sync="editVisible"
        width="30%"
        :close-on-press-escape="false"
        :close-on-click-modal="false">
        <el-tree
          :data="roleList"
          show-checkbox
          node-key="id"
          default-expand-all
          :check-strictly="true"
          :default-checked-keys="checkedIds"
          @check="handleNodeClick"
          :props="{
            label:'name',
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
import { pageListUser, addOneUser,queryUserRole,changeUserRole } from '@/api/settings/UserSettings.js'
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
      },
      // 新增弹框
      addDialogVisible:false,
      form:{
        userName:'',
        nickName:'',
        password:'',
        status:'0',
        email:'',
        phonenumber:'',
        sex:'0'
      },
      rules:{
        userName:[
          { required: true, message: '请输入名称', trigger: 'blur' },
        ],
        nickName:[
          { required: true, message: '请输入路径', trigger: 'blur' },
        ],
        password:[
          { required: true, message: '请输入路径', trigger: 'blur' },
        ],
        status:[
          { required: true, message: '请输入类型', trigger: 'change' },
        ]
      },
      // 授权角色弹框
      currentObj:{},
      editVisible:false,
      roleList:[],
      checkedIds:[],
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
    // 弹框
    addVisible(){
      this.addDialogVisible = true
    },
    // 提交新增
    submit(){
      this.$refs.form.validate((valid) => {
        if(valid){
          addOneUser(this.form).then(()=> {
            // 刷新页面
            this.getUserPage()
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
    // 关闭弹框
    handleClose(done){
      // 重置表单数据
      this.$refs.form.resetFields();
      done()
    },
    // 设置角色弹框
    editDialogVisible(obj){
      this.currentObj = obj
      queryUserRole(this.currentObj).then(res => {
        this.roleList = res.data.list
        this.checkedIds = res.data.isCheckIds
        // 打开弹框
        this.editVisible = true
      })
    },
    // 勾选框勾选的时候取消的时候
    handleNodeClick(item,node){
      this.checkChange(item,node)
    },
    checkChange(item,node){
      //判断当前状态是选中还是取消选中
      const isCheck = this.$refs.tree.getCheckedNodes().indexOf(item) > -1
      let data = {
        userId:this.currentObj.id,
        roleId:item.id,
        isChecked:isCheck
      }
      changeUserRole(data).then(res => {
        this.$message({
          type: 'success',
          message: '操作成功!'
        });
      })
    },
    handleCurrentChange(val){
      this.queryCondition.pageNum = val
      this.getUserPage()
    },
    onSubmit(){
      this.queryCondition.pageNum = 1
      this.getUserPage()
    },
    // 节流
    throttle(func, wait) {
      let timeout;
      return function() {
        let context = this;
        let args = arguments;
        if (!timeout) {
          timeout = setTimeout(() => {
            timeout = null;
            func.apply(context, args);
          }, wait);
        }else{
          this.$message({
            type: 'warning',
            message: '请勿频繁操作!'
          });
        }
      }
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
<template>
    <div class="container">
        <el-row :gutter="30">
          <el-col :span="8" >
            <el-card class="avtor_box">
              <h4>前台二维码</h4>
              <div class="avtor">
                <img :src="pngData.path" />
              </div>
              <div class="btn">

              </div>
            </el-card>
          </el-col>
          <el-col :span="16">
            <el-card>
              <div class="search_box">
                <el-form :inline="true" :model="queryCondition" class="demo-form-inline">
                  <el-form-item label="联系人">
                    <el-input v-model="queryCondition.phonename" placeholder="请输入联系人" size="mini" clearable></el-input>
                  </el-form-item>
                  <el-form-item label="号码">
                    <el-input v-model="queryCondition.phonenum" placeholder="请输入号码" size="mini" clearable></el-input>
                  </el-form-item>
                  <el-form-item label="展示状态">
                    <el-select v-model="queryCondition.isshow" placeholder="请选择展示状态" size="mini" clearable>
                      <el-option label="已展示" value="0"></el-option>
                      <el-option label="未展示" value="1"></el-option>
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
                    prop="phonename"
                    label="联系人"
                    width="180">
                  </el-table-column>
                  <el-table-column
                    prop="phonenum"
                    label="号码">
                  </el-table-column>
                  <el-table-column
                    label="展示状态">
                    <template slot-scope="scope">
                        <el-switch
                          v-model="scope.row.isshow"
                          active-text="已展示"
                          inactive-text="未展示"
                          active-value="0"
                          inactive-value="1"
                          @change="switchIsShow(scope.row)">
                        </el-switch>
                    </template>
                  </el-table-column>
                  <el-table-column
                    label="操作">
                    <template slot-scope="scope">
                      <el-button type="success" @click="edit(scope.row)" size="mini">编辑</el-button>
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
            </el-card>
          </el-col>
        </el-row>
        <div class="add_dialog_box">
          <el-dialog
            :title="dialogTitle"
            :visible.sync="DialogVisible"
            width="30%"
            :before-close="handleClose"
            :close-on-press-escape="false"
            :close-on-click-modal="false">
            <el-form 
              ref="form" 
              :model="form" 
              :rules="rules"
              label-width="80px">
              <el-form-item label="联系人" prop="phonename">
                <el-input v-model="form.phonename" placeholder="请输入联系人" size="mini" clearable></el-input>
              </el-form-item>
              <el-form-item label="号码" prop="phonenum">
                <el-input v-model="form.phonenum" placeholder="请输入号码" size="mini" clearable></el-input>
              </el-form-item>
              <el-form-item label="展示状态" prop="isshow">
                <el-select v-model="form.isshow" placeholder="请选择展示状态" size="mini" clearable>
                  <el-option label="已展示" value="0"></el-option>
                  <el-option label="未展示" value="1"></el-option>
                </el-select>
              </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
              <el-button type="primary" @click="submit" size="mini">确 定</el-button>
            </span>
          </el-dialog>
        </div>
    </div>
</template>

<script>
import {pageList,editSysPhone,addOne,getOne} from '@/api/front/foot.js'
export default {
    name:'Foot',
    data(){
      return {
        tableData:[],
        pngData:{},
        queryCondition:{
          pageNum:1,
          pageSize:10,
          total:0,
          phonename:'',
          phonenum:'',
          isshow:''
        },
        dialogTitle:'新增',
        DialogVisible: false,
        form:{
          phonename:'',
          phonenum:'',
          isshow:'0'
        },
        rules:{
          phonename:[
            { required: true, message: '请输入名称', trigger: 'blur' },
          ],
          phonenum:[
            { required: true, message: '请输入路径', trigger: 'blur' },
          ],
          isshow:[
            { required: true, message: '请输入类型', trigger: 'change' },
          ]
        }
      }
    },
    mounted(){
      this.getTableData()
      this.getPng()
    },
    methods:{
      getTableData(){
        pageList(this.queryCondition).then((res) => {
          this.tableData = res.data.data
          this.queryCondition.total = res.data.total
        })
      },
      getPng(){
        getOne().then((res) => {
          this.pngData = res.data
        })
      },
      // 查询按钮
      onSubmit(){
        this.queryCondition.pageNum = 1
        this.getTableData()
      },
      handleCurrentChange(val){
        this.queryCondition.pageNum = val
        this.getTableData()
      },
      switchIsShow(obj){
        editSysPhone(obj).then(()=> {
          this.$message({
            type: 'success',
            message: '操作成功!'
          });
        })
      },
      addDailog(){
        this.DialogVisible = true
        this.dialogTitle = '新增'
        
      },
      handleClose(done){
        // 重置表单数据
        this.form = {
          phonename:'',
          phonenum:'',
          isshow:'0'
        }
        done()
      },
      edit(obj){
        this.DialogVisible = true
        this.dialogTitle = '编辑'
        this.form = JSON.parse(JSON.stringify(obj))
      },
      // 提交
      submit(){
        if(this.dialogTitle === '新增'){
          addOne(this.form).then(() => {
            this.getTableData()
            this.$message({
              type: 'success',
              message: '操作成功!'
            });
            // 重置表单数据
            this.form = {
              phonename:'',
              phonenum:'',
              isshow:'0'
            }
            this.DialogVisible = false
          })
        }else if(this.dialogTitle === '编辑'){
          editSysPhone(this.form).then(() => {
            this.getTableData()
            this.$message({
              type: 'success',
              message: '操作成功!'
            });
            // 重置表单数据
            this.form = {
              phonename:'',
              phonenum:'',
              isshow:'0'
            }
            this.DialogVisible = false
          })
        }
      },
    }
}
</script>

<style lang="less" scoped>
.container {
  .avtor_box {
    .avtor {
      display: flex;
      justify-content: center; /* 水平居中 */
      align-items: center; /* 垂直居中 */
      &>img {
        display: inline-block;
        width: 100px;
        height: 100px;  
      }
    }
    .btn {
      margin-top: 10%;
      display: flex;
      justify-content: center; /* 水平居中 */
      align-items: center; /* 垂直居中 */
    }
  }
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
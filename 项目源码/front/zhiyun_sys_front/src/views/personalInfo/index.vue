<template>
  <div class="container">
    <el-row :gutter="30">
      <el-col :span="12">
        <el-card>
          <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="昵称">
              <el-input v-model="form.nickName" size="mini" clearable :disabled="editable"></el-input>
            </el-form-item>
            <el-form-item label="用户名">
              <el-input v-model="form.userName" size="mini" clearable :disabled="editable"></el-input>
            </el-form-item>
            <el-form-item label="号码">
              <el-input v-model="form.phonenumber" size="mini" clearable :disabled="editable"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
              <el-input v-model="form.email" size="mini" clearable :disabled="editable"></el-input>
            </el-form-item>
            <el-form-item label="状态">
              <el-select v-model="form.status" placeholder="请选择状态" size="mini" clearable :disabled="editable">
                <el-option label="正常" value="0"></el-option>
                <el-option label="停用" value="1"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button v-if="editable" type="primary" @click="editable = false" size="mini">编辑</el-button>
              <el-button v-if="!editable" type="primary" @click="cancel" size="mini">取消</el-button>
              <el-button v-if="!editable" type="primary" @click="submit" size="mini">确定</el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>
      <el-col :span="12" >
        <el-card class="avtor_box">
          <div class="avtor">
            <img :src="form.avatar"/>
          </div>
          <div class="btn">
            <el-button type="primary" icon="el-icon-refresh" size="mini" @click="randomClick">随机</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import instance from '@/axios'
import {getPersonInfo,editUser} from '@/api/user/personal.js'
export default {
  name:'personalInfo',
  data(){
    return {
      form:{},
      // 旧表单
      oldForm:{},
      // 禁用填写
      editable:true
    }
  },
  created(){
    this.getData()
  },
  methods:{
    // 获取个人信息
    getData(){
      let id = JSON.parse(localStorage.getItem('userInfo')).id
      getPersonInfo({id}).then(res => {
        this.form = JSON.parse(JSON.stringify(res.data))
        this.oldForm = JSON.parse(JSON.stringify(res.data))
        // 将userInfo也存储起来
        localStorage.setItem('userInfo',JSON.stringify(res.data))
      })
    },
    cancel(){
      this.editable = true
      this.form = this.oldForm
    },
    submit(){
      editUser(this.form).then(res => {
        this.getData()
        this.editable = true
        this.$message({
          type: 'success',
          message: '操作成功!'
        });
      }).catch(()=>{
        this.getData()
        this.editable = true
      })
    },
    randomClick(){
      
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
        border-radius: 50%;
      }
    }
    .btn {
      margin-top: 10%;
      display: flex;
      justify-content: center; /* 水平居中 */
      align-items: center; /* 垂直居中 */
    }
  }
}
</style>
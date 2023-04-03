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
              <el-select v-model="form.status" placeholder="请选择状态" size="mini" clearable>
                <el-option label="正常" value="0"></el-option>
                <el-option label="停用" value="1"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="onSubmit" size="mini">编辑</el-button>
              
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card>
          头像区
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {getPersonInfo} from '@/api/user/personal.js'
export default {
  name:'personalInfo',
  data(){
    return {
      form:{},
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
        this.form = res.data
      })
    }
  }
}
</script>

<style lang="less" scoped>

</style>
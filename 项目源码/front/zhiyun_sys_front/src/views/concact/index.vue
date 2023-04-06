<template>
    <div class="container">
        <el-row :gutter="30">
            <el-col :span="12">
                <el-card>
                    <el-form ref="form" :model="form" label-width="140px">
                        <el-form-item label="QQ">
                            <el-input v-model="form.qqnum" size="mini" clearable :disabled="editable"></el-input>
                        </el-form-item>
                        <el-form-item label="电话">
                            <el-input v-model="form.phonenum" size="mini" clearable :disabled="editable"></el-input>
                        </el-form-item>
                        <el-form-item label="邮箱">
                            <el-input v-model="form.emailnum" size="mini" clearable :disabled="editable"></el-input>
                        </el-form-item>
                        <el-form-item label="地址">
                            <el-input v-model="form.address" size="mini" clearable :disabled="editable"></el-input>
                        </el-form-item>
                        <el-form-item label="隐私地址路径">
                            <el-input v-model="form.path" size="mini" clearable :disabled="editable"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button v-if="editable" type="primary" @click="editable = false" size="mini">编辑</el-button>
                            <el-button v-if="!editable" type="primary" @click="cancel" size="mini">取消</el-button>
                            <el-button v-if="!editable" type="primary" @click="submit" size="mini">确定</el-button>
                        </el-form-item>
                    </el-form>
                </el-card>
            </el-col>
        </el-row>
    </div>
</template>

<script>
import {getContact,edidContact} from '@/api/front/contact.js'
export default {
    name:'Concact',
    data(){
        return {
            form:{},
            oldform:{},
            editable:true
        }
    },
    mounted(){
        this.getData()
    },
    methods:{
        getData(){
            getContact().then((res) => {
                this.form = JSON.parse(JSON.stringify(res.data))
                this.oldform = JSON.parse(JSON.stringify(res.data))
            })
        },
        //取消
        cancel(){
            this.editable = true
            this.form = this.oldform
        },
        // 提交
        submit(){
            edidContact(this.form).then(() => {
                this.$message({
                    type: 'success',
                    message: '操作成功!'
                });
                this.getData()
                this.editable = true
            }) 
        },
    }
}
</script>

<style lang="less" scoped>
.container {

}
</style>
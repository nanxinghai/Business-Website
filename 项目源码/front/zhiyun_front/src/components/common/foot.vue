<template>
  <div class="footer">
    <el-row type="flex" justify="center">
      <!-- 中间盒子 -->
      <el-col :lg="{span:15}" :xl="{span:15}" class="top_box">
          <el-row>
            <!-- 下属三个盒子 -->
            <!-- 联系方式 -->
            <el-col :sm="{span:9}" style="height:140px;" class="contactPhone">
              <div class="top">
                <img src="../../../static/foot/phone.png" />
                <span>全国免费服务热线</span>
              </div>
              <div>

              </div>
            </el-col>
            <!-- 公司地址 -->
            <el-col :sm="{span:9}" style="background: #cee6f4;height:140px;"></el-col>
            <el-col :sm="{span:6}" style="background: #e43e2e;height:140px;"></el-col>
          </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {

}
</script>

<style lang="less" scoped>
.footer {
  width: 100%;
  background: #2E3033;
  height: 280px;
  font-size: @font_size_small;
  .contactPhone {
    padding: 20px 0;
    .top {
      color: @font_grey_color;
    }
  }
}
.top_box {
  height:140px;
  border-bottom: 1px solid #575555;
}
</style>
module.exports = {
    lintOnSave:false,
  // webpack配置
  // see https://github.com/vuejs/vue-cli/blob/dev/docs/webpack.md
  configureWebpack: {
      resolve: {
          alias: {
              "src": "@"
          }
      }
  },
  // webpack-dev-server 相关配置
  devServer: {
      // open: process.platform === 'vue',
      // host: '127.0.0.1',
      port: 8999,
      // https: false,
      // hotOnly: false,
      // proxy: { // 设置代理
      //     '/api': {
      //         target: 'http://www.xxxxx.com/',
      //         changeOrigin: true,
      //         pathRewrite: {
      //             '^/api': '/api'
      //         }
      //     }
      // },
      // disableHostCheck: true
  },
  // 第三方插件配置
  pluginOptions: {
      // ...
  }
}
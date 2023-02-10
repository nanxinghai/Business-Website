const path = require('path');
const resolve = dir => path.join(__dirname, dir)
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
  // 添加全局less变量
  pluginOptions: {
    'style-resources-loader': {
      preProcessor: 'less',
      patterns: [
        // 路径
        path.resolve(__dirname, './src/assets/css/theme.less'),
      ],

    },

  },
}
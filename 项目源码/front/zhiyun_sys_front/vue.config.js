const path = require('path');
const resolve = dir => path.join(__dirname, dir)
module.exports = {
  lintOnSave:false,
  // 页面设置
  pages: {
    index: {
      entry: 'src/main.js', // 入口文件
      title: '智云科技后台'
    }
  },
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
      // 不检查hosts文件
      disableHostCheck: true,
      proxy:'http://localhost:9898',
      // open: process.platform === 'vue',
      // host: '127.0.0.1',
      port: 80,
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
  // svg配置
  chainWebpack (config) {
    config.module
      .rule('svg')
      .exclude.add(resolve('src/assets/icons'))
      .end()
    config.module
      .rule('icons')
      .test(/\.svg$/)
      .include.add(resolve('src/assets/icons'))
      .end()
      .use('svg-sprite-loader')
      .loader('svg-sprite-loader')
      .options({
        symbolId: 'icon-[name]'
      })
      .end()
  }
}
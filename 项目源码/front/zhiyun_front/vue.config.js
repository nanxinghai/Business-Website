const path = require('path');
const resolve = dir => path.join(__dirname, dir)
module.exports = {
    lintOnSave: false,
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
        // port: 8080,
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
        // 全局变量CSS
        'style-resources-loader': {
            preProcessor: 'less',
            patterns: [
              // 路径
              path.resolve(__dirname, './src/assets/css/index.less'),
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
export default {
  data(){
    return {
      options: {
        licenseKey: 'OPEN-SOURCE-GPLV3-LICENSE',
        //是否显示导航，默认为false(竖向)
        navigation: true,
        //是否显示两侧的箭头
        controlArrows: true,
        //横向slide幻灯片是否循环滚动(最后一张再切换回到第一张)
        loopHorizontal: true,
        //为每个section设置背景色
        sectionsColor: [],
        onLeave:(index, nextIndex, direction)=>{
          this.currentIndex = nextIndex.index
        }
      },
      currentIndex:0
    }
  }
}
//6.4 滚动监听及控制
/*
* 6.4.1 ScrollController
* ScrollController构造函数如下：
* ScrollController({
  double initialScrollOffset = 0.0, //初始滚动位置
  this.keepScrollOffset = true,//是否保存滚动位置
  ...
})
*
* offset：可滚动组件当前的滚动位置。
* jumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，它们不同之处在于，后者在跳转时会执行一个动画，而前者不会。
*
* */
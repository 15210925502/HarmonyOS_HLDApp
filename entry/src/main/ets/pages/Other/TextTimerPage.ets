@Entry
@Component
struct TextTimerPage {
  timeController: TextTimerController = new TextTimerController()

  build() {
    Column() {
      Column() {
        TextTimer({controller:this.timeController})
          .backgroundColor(Color.Red)
      }.width(100)
      .backgroundColor(Color.Green)
      .justifyContent(FlexAlign.Center)
      Row({space:20}){
        Button('开始')
          .onClick(()=>{
            this.timeController.start()
          })
        Button('暂停')
          .onClick(()=>{
            this.timeController.pause()
          })
        Button('结束')
          .onClick(()=>{
            this.timeController.reset()
          })
      }
      .margin({top:20})
    }
    .height('100%')
    .width('100%')
  }
}
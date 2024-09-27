import { router } from '@kit.ArkUI'

@Component
export default struct AppBar {
  // 在build方法执行之前执行
  aboutToAppear(): void {

  }

  // build方法执行完毕后才执行
  onPageShow(): void {

  }

  title: string = ''

  build() {
    Row() {
      if (parseInt(router.getLength()) > 1) {
        Image($r('app.media.icon'))
          .width(20)
          .margin({ left: 10, right: 10 })
          .onClick(() => {
            router.back()
          })
      }
      Text(this.title)
        .fontColor(Color.White)
        .fontSize(26)
        .textAlign(TextAlign.Center)
        .layoutWeight(1)
      if (parseInt(router.getLength()) > 1) {
        Image($r('app.media.icon'))
          .width(20)
          .margin({ left: 10, right: 10 })
      }
    }
    .width('100%')
    .height(49)
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.Start)
    .alignItems(VerticalAlign.Center)
  }
}
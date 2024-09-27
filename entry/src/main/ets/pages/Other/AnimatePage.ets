@Entry
@Component
struct AnimatePage {
  @State length: number = 150;
  @State isShow: boolean = false;

  build() {
    Column() {
      Image($r('app.media.icon'))
        .width(this.length)
        .margin({ bottom: 20 })
      Row({ space: 10 }) {
        Button('增大')
          .onClick(() => {
            animateTo({ duration: 500 }, () => {
              this.length = 300
            })
          })

        Button('缩小')
          .onClick(() => {
            animateTo({ duration: 500 }, () => {
              this.length = 150
            })
          })
      }.margin({ bottom: 150 })


      if (this.isShow) {
        Image($r('app.media.icon'))
          .width(this.length)
          .margin({ bottom: 20 })
      }
      Row({ space: 10 }) {
        Button('出现')
          .onClick(() => {
            this.isShow = true
          })

        Button('消失')
          .onClick(() => {
            this.isShow = false

          })
      }
    }
    .height('100%')
    .width('100%')
  }
}
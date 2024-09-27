@Entry
@Component
struct GridPage {
  build() {
    Grid() {
      GridItem() {
        Text('1')
          .fontSize(36)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
      }.rowStart(0)
      .rowEnd(1)
      .columnStart(0)
      .columnEnd(1)
      GridItem() {
        Text('2')
          .fontSize(36)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      GridItem() {
        Text('3')
          .fontSize(36)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      GridItem() {
        Text('4')
          .fontSize(36)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      GridItem() {
        Text('5')
          .fontSize(36)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      GridItem() {
        Text('6')
          .fontSize(36)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      GridItem() {
        Text('7')
          .fontSize(36)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      GridItem() {
        Text('8')
          .fontSize(36)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      GridItem() {
        Text('9')
          .fontSize(36)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
      }
    }.width('100%')
    .height('100%')
    .backgroundColor(Color.Orange)
    .columnsGap(10)
    .rowsGap(10)
    .padding(10)
    .rowsTemplate('1fr 1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr 1fr')
  }
}
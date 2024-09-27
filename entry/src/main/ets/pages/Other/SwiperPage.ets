@Entry
@Component
struct SwiperPage {
  swiperController: SwiperController = new SwiperController();

  build() {
    Column() {
      Swiper(this.swiperController) {
        Text('1')
          .backgroundColor(Color.Brown)
          .fontSize(36)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
        Text('2')
          .backgroundColor(Color.Yellow)
          .fontSize(36)
          .fontColor(Color.Red)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height(200)
      .backgroundColor(Color.Gray)
      .loop(true)
      // .autoPlay(true)
      // .interval(2000)
      // .indicatorStyle({
      //   size: 30,
      //   left: 0,
      //   color: Color.Blue
      // })
      .indicator(true)

      Row() {
        Button('上一页').onClick((event: ClickEvent) => {
          this.swiperController.showNext();
        })
        Button('下一页').onClick((event: ClickEvent) => {
          this.swiperController.showPrevious();
        })
      }.width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
  }
}
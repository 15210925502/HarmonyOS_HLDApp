@Entry
@Component
struct LinkPage {
  @State num: number = 0

  build() {
    Column() {
      Text(this.num.toString())
        .fontColor(Color.Black)
        .fontWeight(600)
        .fontSize(36)
        .textAlign(TextAlign.Center)
        .width('100')
        .height('30')
        .margin({ top: 20 })

      Box1({
        color: Color.Red,
        num: this.num
      })
      Box1({
        color: Color.Pink,
        num: this.num
      })
      Box1({
        color: Color.Orange,
        num: this.num
      })

      Button('+')
        .fontSize(36)
        .height(50)
        .width(100)
        .margin({ top: 20 })
        .onClick(() => {
          this.num++
        })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct Box1 {
  color: Color = Color.Red
  @Link
  num: number

  build() {
    Column() {
      Text(this.num.toString())
        .fontColor(Color.White)
        .fontWeight(600)
        .fontSize(36)
        .textAlign(TextAlign.Center)
        .width('100%')
        .height('100%')
    }.backgroundColor(this.color)
    .width(100)
    .height(100)
    .margin({ top: 20 })
    .onClick(()=>{
      this.num ++
    })
  }
}
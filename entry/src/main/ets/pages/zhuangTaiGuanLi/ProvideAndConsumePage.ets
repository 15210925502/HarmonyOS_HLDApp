@Entry
@Component
struct ProvideAndConsumePage {
  @Provide('num') num: number = 0

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
      })
      Box1({
        color: Color.Pink,
      })
      Box1({
        color: Color.Orange,
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

  build() {
    Column() {
      Box2({
        color: this.color
      })
    }
    .backgroundColor(this.color)
    .width(100)
    .height(100)
    .margin({ top: 20 })
  }
}

@Component
struct Box2 {
  color: Color = Color.Red
  @Consume('num') num: number

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
    .width('100%')
    .height('100%')
    .onClick(() => {
      this.num++
    })
  }
}

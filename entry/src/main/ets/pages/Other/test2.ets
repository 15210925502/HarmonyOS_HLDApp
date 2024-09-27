@Entry
@Component
struct UITest2 {
  textValue = 'Hello ArkTS'
  textSize: number = 50
  imageHeight = 800
  imageWidth = 500

  build() {
    Column() {
      Text(this.textValue)
        .fontSize(this.textSize)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
      Image('http://gips0.baidu.com/it/u=3822353666,2757632348&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280')
        .width(this.imageWidth)
        .height(this.imageHeight)
    }
  }
}
@Entry
@Component
struct UITest3 {
  textValue = 'Hello ArkTS'
  @State
  textSize: number = 50
  myClickHandler():void {
    this.textSize += 4
  }

  build() {
    Column() {
      Text(this.textValue)
        .fontSize(this.textSize)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
      Button('增大字体')
        .height(50)
        .width(100)
        .margin({ top: 20 })
        .onClick(this.myClickHandler.bind(this))
        // .onClick(function(): void{
        //   this.textSize += 1
        // }.bind(this))
    }
  }
}
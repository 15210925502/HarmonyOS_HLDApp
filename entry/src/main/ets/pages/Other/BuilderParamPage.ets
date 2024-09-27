@Entry
@Component
struct BuilderParamPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Container({ title: '你好' }) {
        Text('123')
        Text('465')
      }
      Container({ title: '你好' })
    }
    .backgroundColor(Color.Orange)
    .height('100%')
    .width('100%')
  }
}

@Component
struct Container {
  @Builder
  myComponent() {
    Text('默认插槽')
  }

  @BuilderParam child: () => void = this.myComponent
  title: string = ''

  build() {
    Column() {
      Text(this.title)
        .fontSize(18)
        .fontColor(Color.White)
        .backgroundColor(Color.Green)
        .width(50)
      this.child() // 在这里插入额外的子组件
    }.width(100)
    .height(100)
    .backgroundColor(Color.Red)
  }
}

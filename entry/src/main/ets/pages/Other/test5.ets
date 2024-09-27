@Builder
// 地址传递
function MyBuilder($$userName: string) {
  Column(){
    Text(`Hello ${$$userName}`)
      .fontSize(30)
      .margin(20)
  }
}

@Entry
@Component
struct Parent {
  @State parent_name: string = "张珊"
  build(){
    Column(){
      MyBuilder(this.parent_name)
      // MyBuilder({userName: this.parent_name})
      Button("修改值").onClick(() => {
        this.parent_name = "李四"
      })
    }
  }
}
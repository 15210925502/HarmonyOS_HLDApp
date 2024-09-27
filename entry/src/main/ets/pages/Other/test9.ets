class MyData {
  id: number
  title: string
  content: string

  constructor(id: number, title: string, content: string) {
    this.id = id
    this.title = title
    this.content = content
  }
}

@Component
struct MyComponent {
  myData: MyData= new MyData(1, "", "")

  build() {
    Row() {
      Image($r("app.media.icon"))
        .width(80)
        .height(80)
        .margin({ right: 20 })

      Column() {
        Text(this.myData.title)
          .fontSize(20)
          .margin({ top: 10, bottom: 10 })

        Text(this.myData.content)
          .fontSize(16)
          .fontColor(Color.Gray)
          .margin({ bottom: 10 })
      }.alignItems(HorizontalAlign.Start)
      .width("80%")
      .height("100%")
    }
    .margin(20)
    .borderRadius(12)
    .backgroundColor(Color.Orange)
    .height(120)
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Entry
@Component
struct Test9 {
  @State isListEndReach: boolean = false
  @State array: Array<MyData> = [
    new MyData(1, "第1篇文章", "第1篇文章内容"),
    new MyData(2, "第2篇文章", "第2篇文章内容"),
    new MyData(3, "第3篇文章", "第3篇文章内容"),
    new MyData(4, "第4篇文章", "第4篇文章内容"),
    new MyData(5, "第5篇文章", "第5篇文章内容"),
    new MyData(6, "第6篇文章", "第6篇文章内容")]

  build() {
    Column() {
      List() {
        ForEach(this.array, (temp: MyData) => {
          MyComponent({myData:temp})
            .margin({ top: 20 })
        })
      }.onReachEnd(() => {
        // 到达列表底部
        this.isListEndReach = true
      })
      .parallelGesture(PanGesture({ direction: PanDirection.Up, distance: 80 })
        .onActionStart(() => {
          // 检查到往上滑动的手势
          if (this.isListEndReach) {
            // 加载新的文章
            let count = this.array.length
            let new_id = count += 1
            this.array.push(new MyData(new_id, "第" + new_id + "篇文章", "第" + new_id + "篇文章内容"))
            this.isListEndReach = false
          }
        }))
      .padding(20)
      .scrollBar(BarState.Off)
    }
    .width("100%")
    .height("100%")
  }
}
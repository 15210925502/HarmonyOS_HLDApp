import Item from './Item'
import Person from './Person'
import DataModel from './DataModel'

@Entry
@Component
struct MainAppPage {
  @State
  list: Array<Person> = []
  @Provide('Index') selectCurrentIndex: number = 0

  aboutToAppear(): void {
    this.list.push(new Person({image:$r('app.media.icon'), name:'张珊',isLove:false, phone:'15210925502'} as DataModel))
  }

  build() {
    Column() {
      Row() {
        Text('联系人')
          .width(120)
          .fontWeight(500)
          .fontSize(28)
          .height('100%')
        Blank()
        Button('选择')
          .onClick((event: ClickEvent) => {

          })
          .width(55)
          .height(28)
          .margin({ right: 10 })
        Button('+')
          .onClick((event: ClickEvent) => {
            this.list.push(new Person({image:$r('app.media.icon'), name:'王五',isLove:true, phone:'15210925506'} as DataModel))
          })
          .width(45)
          .height(28)
      }
      .width('100%')
      .height(45)
      .padding({ left: 20, right: 20 })
      .margin({ bottom: 20 })

      List({ space: 15 }) {
        ForEach(this.list, (item: Person) => {
          ListItem() {
            Item({ person: item })
          }
          .backgroundColor(Color.Gray)
        })
      }.layoutWeight(1)

      Button('删除')
        .fontColor(Color.White)
        .fontSize(20)
        .backgroundColor(Color.Red)
        .width(100)
        .height(35)
        .onClick(() => {
          this.list.pop()
        })
    }
    .height('100%')
    .width('100%')
    .expandSafeArea()
  }
}
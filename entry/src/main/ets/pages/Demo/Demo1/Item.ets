import DataModel from './DataModel'
import Person from './Person'

@Component
export default struct Item {
  @Consume('Index') selectCurrentIndex: number
  person: Person = new Person({} as DataModel)
  // person: Person = new Person({name:'李四'} as DataModel)

  build() {
    Column() {
      Row() {
        Image(this.person.image)
          .width(30)
          .margin({ right: 10 })
        Text(this.person.name)
          .width(150)
        Blank()
        Checkbox({ name: '132', group: '321' })
          .select(this.person.isLove)
      }
      .width('100%')
      if(this.selectCurrentIndex == this.person.idNum) {
        Column() {
          Divider()
            .height(1)
            .backgroundColor(Color.Black)
            .margin({ top: 10, bottom: 10 })
          Text(`电话${this.person.phone}`)
            .width('100%')
        }
      }
    }
    .width('100%')
    .padding(10)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.selectCurrentIndex = this.person.idNum as number
    })
  }
}
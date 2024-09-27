import AppBar from '../../component/AppBar'

@Component
export default struct PersistentStoragePage {
  @State buttonNumber: number = 0
  build() {
    Column() {
      AppBar({ title: '分类' })
      Button('PersistentStorage设置值')
        .fontSize(18)
        .fontColor(Color.White)
        .width(300)
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          PersistentStorage.persistProp('aa',100)
        })
      Button(`获取PersistentStorage的值为:${this.buttonNumber}`)
        .fontSize(18)
        .fontColor(Color.White)
        .width(350)
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          this.buttonNumber = AppStorage.get('aa') as number
        })
    }.width('100%')
    .height('100%')
  }
}
import AppBar from './AppBar'

@Component
export default struct Main {
  @State count: number = 0
  @State buttonNumber: number = 0

  build() {
    Column() {
      AppBar({ title: '我的' })

      Button(`获取AppStorage的值为:${this.buttonNumber}`)
        .fontSize(18)
        .fontColor(Color.White)
        .width(300)
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          this.buttonNumber = AppStorage.get('num') as number
        })
      Button(`获取PersistentStorage的值为:${this.count}`)
        .fontSize(18)
        .fontColor(Color.White)
        .width(350)
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          this.count = AppStorage.get('aa') as number
        })
    }.width('100%')
    .height('100%')
  }
}
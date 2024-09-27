import AppBar from '../../component/AppBar'
import { router } from '@kit.ArkUI'

@Component
export default struct StoragePropPage {
  @StorageProp('num') num: number = 1
  @State buttonNumber: number = this.num

  build() {
    Column() {
      AppBar({ title: '首页' })
      Text(this.num.toString())
        .fontSize(30)
        .margin({ top: 10 })
      Button('设置AppStorage值')
        .fontSize(18)
        .fontColor(Color.White)
        .width(200)
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          AppStorage.set('num', ++this.num)
        })
      Button(`获取AppStorage的值为:${this.buttonNumber}`)
        .fontSize(18)
        .fontColor(Color.White)
        .width(300)
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          this.buttonNumber = AppStorage.get('num') as number
        })

      Button('设置num的值')
        .fontSize(18)
        .fontColor(Color.White)
        .width(150)
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          this.num += 1
        })
    }.width('100%')
    .height('100%')
  }
}
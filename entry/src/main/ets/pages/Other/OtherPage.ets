
@Entry
@Component
struct OtherPage {
  build() {
    Column() {
      Column() {
        Text('单选框')
          .fontSize(36)
          .width('100%')
          .margin({ top: 20, left: 20 })
        Row() {
          Text('男')
            .fontSize(30)
            .margin({ right: 5 })
          Radio({ value: '1', group: 'sex' }).width(30).checked(false)
            .margin({ right: 30 })
          Text('女')
            .fontSize(30)
            .margin({ right: 5 })
          Radio({ value: '2', group: 'sex' }).width(30).checked(true)
        }.margin({ top: 20 })
      }
      Column() {
        Text('复选框')
          .fontSize(36)
          .width('100%')
          .margin({ top: 20, left: 20,bottom:20 })
        Row() {
          Text('男')
            .fontSize(30)
          Checkbox({
            name: '1',
            group: 'sex'
          }) {
          }.select(true)
          .shape(CheckBoxShape.ROUNDED_SQUARE)

          Text('女')
            .fontSize(30)
          Checkbox({
            name: '2',
            group: 'sex'
          }) {
          }.select(false)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
        }.width('100%')
      }.width('100%')
      Toggle({
        type:ToggleType.Switch,
        isOn:true
      })
      QRCode('2httpasdlf22')
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Orange)
  }
}
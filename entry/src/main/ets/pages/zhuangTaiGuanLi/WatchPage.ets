@Entry
@Component
struct WatchPage {
  @State @Watch('change') num: number = 0
  @State @Watch('change') pow: number = 0
  @State res: number = 0

  change() {
    this.res = Math.pow(this.num, this.pow)
  }

  build() {
    Column({ space: 10 }) {
      Row() {
        Text('基数：')
          .textAlign(TextAlign.Center)
        TextInput()
          .layoutWeight(1)
          .type(InputType.Number)
          .onChange((value) => {
            if (value == null || value == '' || value == undefined) {
              this.num = 0
            } else {
              this.num = parseInt(value)
            }
          })
      }.width('100%')

      Row() {
        Text('次幂：')
          .textAlign(TextAlign.Center)
        TextInput()
          .layoutWeight(1)
          .type(InputType.Number)
          .onChange((value) => {
            if (value == null || value == '' || value == undefined) {
              this.pow = 0
            } else {
              this.pow = parseInt(value)
            }
          })
      }.width('100%')

      Text(`结果:${this.res}`)
        .textAlign(TextAlign.Center)
        .fontSize(36)
        .width('100%')
    }
    .height('100%')
    .width('100%')
    .padding(20)
  }
}
import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct NumberKeyboard {
  numbers: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.']
  @Link value: string
  @Link amount: number

  @Styles
  keyBoxStyle(){
    .backgroundColor(Color.White)
    .borderRadius(8)
    .height(60)
  }

  build() {
    Grid() {
      ForEach(this.numbers, (number: string) => {
        GridItem() {
          Text(number)
            .fontSize(20)
            .fontWeight(CommonConstants.FONT_WEIGHT_900)
        }.keyBoxStyle()
        .onClick(() => {
          this.clickNumber(number)
        })
      })
      GridItem() {
        Text('删除')
          .fontSize(20)
          .fontWeight(CommonConstants.FONT_WEIGHT_900)
      }.keyBoxStyle()
      .onClick(() => {
        this.clickDelete()
      })
    }
    .width('100%')
    .height(280)
    .backgroundColor($r('app.color.index_page_background'))
    .columnsTemplate('1fr 1fr 1fr')
    // 列间距
    .columnsGap(8)
    // 行间距
    .rowsGap(8)
    .padding(8)
    .margin({ top: 10 })
  }

  clickNumber(number: string) {
    // 字符串拼接
    let val = this.value + number
    // 校验格式
    // 从左向右查找小数点第一个的下标位置
    let firstIndex = val.indexOf('.')
    // 从右向左查找小数点第一个的下标位置
    let lastIndex = val.lastIndexOf('.')
    // 保留一位小数
    if (firstIndex !== lastIndex || (lastIndex != -1 && lastIndex < val.length - 2)) {
      // 非法输入
      return
    }
    let amount = this.parseFloatFunction(val)
    if (amount > 999.9) {
      this.amount = 999.0
      this.value = '999'
    }else {
      this.amount = amount
      this.value = val
    }
  }

  clickDelete() {
    if (this.value.length <= 0) {
      this.value = ''
      this.amount = 0
      return
    }
    this.value = this.value.substring(0,this.value.length - 1)
    this.amount = this.parseFloatFunction(this.value)
  }

  parseFloatFunction(str: string) {
    if (!str){
     return 0
    }
    // 判断是否以.结尾
    if (str.endsWith('.')) {
      // 如果是，把小数点去掉
      str = str.substring(0, str.length - 1)
      if (str.length <= 0) {
        str = '0'
      }
    }
    return parseFloat(str)
  }
}
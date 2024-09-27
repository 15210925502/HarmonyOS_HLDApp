import { CommonConstants } from '../common/constants/CommonConstants'
import ItemList from '../view/item/ItemList'
import { router } from '@kit.ArkUI'
import ItemPanelHead from '../view/item/ItemPanelHead'
import ItemCard from '../view/item/ItemCard'
import NumberKeyboard from '../view/item/NumberKeyboard'
import { RecordItem, RecordItemIO } from '../viewmodel/RecordItem'
import { RecordType } from '../viewmodel/RecordType'
import { RecordTypeEnum, RecordTypes } from '../model/RecordTypeModel'
import RecordService from '../service/RecordService'

@Entry
@Component
struct ItemIndex {
  @State showPanel: boolean = false
  @State amount: number = 1
  // 临时记录键盘输入的数据
  @State value: string = ''
  @State item: RecordItem = new RecordItem({} as RecordItemIO)
  @State type: RecordType = RecordTypes[0]
  @State isFood: boolean = true

  onPageShow() {
    // 获取页面跳转时传来的参数并赋值
    // this.type = (router.getParams() as Record<string,RecordType>)['type']
    this.type = router.getParams() as RecordType
    this.isFood = this.type.id !== RecordTypeEnum.WORKOUT
  }

  build() {
    Column() {
      // 导航
      this.Header()
      // 列表
      // 函数作为参数进行传值，传递其它值
      ItemList({ onPanelShow: (item: RecordItem): void => this.onPanelShow(item), isFood: this.isFood })
      // 最好设置双向绑定，showClose设置为ture时，关闭后无法弹窗
    }.bindSheet($$this.showPanel,
      this.myBind,
      {
        showClose: false,
        // 背景颜色
        backgroundColor: Color.White,
        // 蒙层颜色
        maskColor: $r('app.color.light_gray'),
        // 高度档位
        detents: [SheetSize.LARGE, SheetSize.MEDIUM, 200]
      })
    .height('100%')
    .width('100%')
  }

  @Builder
  Header() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(24)
        .onClick(() => {
          router.back()
        })
      Blank()
      Text(this.type.name)
        .fontSize(18)
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
    }.width(CommonConstants.THOUSANDTH_940)
    .height(32)
  }

  onPanelShow(item: RecordItem) {
    this.value = ''
    this.amount = 1
    this.showPanel = true
    this.item = item
  }

  @Builder
  myBind() {
    Column() {
      // 日期
      ItemPanelHead()
      // 记录项卡片
      if (this.item) {
        ItemCard({ amount: this.amount, item: this.item })
      }
      // 数字键盘
      NumberKeyboard({ amount: $amount, value: $value })
      // 按钮
      Row({ space: CommonConstants.SPACE_10 }) {
        Button('取消')
          .width(120)
          .backgroundColor($r('app.color.light_gray'))
          .type(ButtonType.Normal)
          .borderRadius(16)
          .onClick(() => {
            this.showPanel = false
          })
        Button('确定')
          .width(120)
          .backgroundColor($r('app.color.primary_color'))
          .type(ButtonType.Normal)
          .borderRadius(16)
          .onClick(() => {
            // 持久化保存数据
            RecordService.insert(this.type.id, this.item.id, this.amount)
              .then(() => {
                this.showPanel = false
              })
              .catch(() => {

              })
          })
      }.margin({ top: 15 })
    }
  }
}
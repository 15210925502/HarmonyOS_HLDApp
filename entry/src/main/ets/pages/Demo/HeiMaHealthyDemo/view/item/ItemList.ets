import { CommonConstants } from '../../common/constants/CommonConstants'
import ItemModel from '../../model/ItemModel'
import GroupInfo from '../../viewmodel/GroupInfo'
import { RecordItem } from '../../viewmodel/RecordItem'
import { RecordType } from '../../viewmodel/RecordType'

@Component
export default struct ItemList {
  @Prop isFood: boolean
  onPanelShow?: (item: RecordItem) => void

  build() {
    Tabs() {
      TabContent() {
        this.TabContentBuilder(ItemModel.list(this.isFood))
      }.tabBar('全部')

      ForEach(ItemModel.listItemGroupByCategory(this.isFood), (item: GroupInfo<RecordType, RecordItem>) => {
        TabContent() {
          this.TabContentBuilder(item.items)
        }.tabBar(item.type.name)
      })
    }.width(CommonConstants.THOUSANDTH_940)
    .barMode(BarMode.Scrollable)
    .height('100%')
  }

  @Builder
  TabContentBuilder($$items: RecordItem[]) {
    List({ space: CommonConstants.SPACE_10 }) {
      ForEach($$items, (item: RecordItem) => {
        ListItem() {
          Row({ space: CommonConstants.SPACE_6 }) {
            Image(item.image)
              .width(50)
            Column({ space: CommonConstants.SPACE_4 }) {
              Text(item.name)
                .fontWeight(CommonConstants.FONT_WEIGHT_500)
              Text(`${item.calorie}千卡/${item.unit}`)
                .fontSize(14)
                .fontColor($r('app.color.light_gray'))
            }.alignItems(HorizontalAlign.Start)

            Blank()
            Image($r('app.media.ic_public_add_norm_filled'))
              .width(18)
              .fillColor($r('app.color.primary_color'))
          }.width('100%')
          .padding(CommonConstants.SPACE_6)
        }.onClick(() => {
          if (this.onPanelShow) {
            this.onPanelShow(item)
          }
        })
      })
    }.width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
  }
}
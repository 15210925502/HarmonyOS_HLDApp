import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordService from '../../service/RecordService'
import GroupInfo from '../../viewmodel/GroupInfo'
import { RecordVO } from '../../viewmodel/RecordVO'
import { router } from '@kit.ArkUI'
import { RecordType } from '../../viewmodel/RecordType'

@Extend(Text)
function grayText() {
  .fontSize(14)
  .fontColor($r('app.color.light_gray'))
}

@Component
export default struct RecordList {
  @Consume @Watch('handleRecordsChange') records: RecordVO[]
  @State groups: GroupInfo<RecordType, RecordVO>[] = []

  handleRecordsChange() {
    this.groups = RecordService.calculateGroupInfo(this.records)
  }

  build() {
    List({ space: CommonConstants.SPACE_10 }) {
      ForEach(this.groups, (group: GroupInfo<RecordType, RecordVO>) => {
        ListItem() {
          Column() {
            Row({ space: CommonConstants.SPACE_4 }) {
              // 分组标题
              Image(group.type.icon)
                .width(24)
              // 组内记录列表
              Text(group.type.name)
                .fontSize(18)
                .fontWeight(CommonConstants.FONT_WEIGHT_700)
              Text(`建议${group.type.min}~${group.type.max}千卡`)
                .grayText()
              Blank()
              Text(group.calorie.toFixed(0))
                .fontSize(14)
                .fontColor($r('app.color.primary_color'))
              Text('千卡')
                .grayText()
              Image($r('app.media.ic_public_add_norm_filled'))
                .width(20)
                .fillColor($r('app.color.primary_color'))
            }.width('100%')
            .onClick(() => {
              router.pushUrl({
                url: 'pages/Demo/HeiMaHealthyDemo/page/ItemIndex',
                params: group.type
                // params: { type: group.type }
              })
            })

            List() {
              ForEach(group.items, (item: RecordVO, index) => {
                ListItem() {
                  Row({ space: CommonConstants.SPACE_6 }) {
                    Image(item.recordItem.image)
                      .width(50)
                    Column({ space: CommonConstants.SPACE_4 }) {
                      Text(item.recordItem.name)
                        .fontWeight(CommonConstants.FONT_WEIGHT_500)
                      Text(`${item.amount}${item.recordItem.unit}`)
                        .grayText()
                    }

                    Blank()
                    Text(`${item.calorie.toFixed(0)}千卡`)
                      .grayText()
                  }.width('100%')
                  .padding(CommonConstants.SPACE_6)
                }
                // 添加左滑删除按钮
                .swipeAction({ end: (): void => this.deleteButton(group.items, item) })
              })
            }.width('100%')
          }
          .width('100%')
          .backgroundColor(Color.White)
          .borderRadius(CommonConstants.DEFAULT_18)
          .padding(CommonConstants.SPACE_12)
        }
      })
    }.width(CommonConstants.THOUSANDTH_940)
    .height('100%')
    .margin({ top: 10 })
    .scrollBar(BarState.Off)
  }

  @Builder
  deleteButton(groupItems: Array<RecordVO>,item:RecordVO) {
    Image($r('app.media.ic_public_delete_filled'))
      .width(20)
      .fillColor(Color.Red)
      .margin(5)
      .onClick(() => {
        RecordService.deleteById(item.id)
          .then(() => {
            // 查找元素所在数组中的位置
            let index = groupItems.indexOf(item)
            if (index > -1) {
              // 从数组中第几个位置删除，多少个元素，原数组是删除后的数据，返回删除的数据
              groupItems.splice(index, 1)
            }
          })
          .catch(() => {

          })
      })
  }
}

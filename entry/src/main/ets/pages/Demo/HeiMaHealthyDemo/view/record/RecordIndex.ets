import DateUtil from '../../common/utils/DateUtil'
import RecordService from '../../service/RecordService'
import { RecordVO } from '../../viewmodel/RecordVO'
import RecordList from './RecordList'
import SearchHeader from './SearchHeader'
import StatsCard from './StatsCard'

@Component
export default struct RecordIndex {
  @StorageProp('selectedDate')
  @Watch('aboutToAppear')
  selectedDate: number = DateUtil.beginTimeOfDay(new Date())
  @Provide records: RecordVO[] = []
  @Prop @Watch('handleAction') isPageShow: boolean

  // 收到通知，刷新页面
  handleAction(){
    if (this.isPageShow) {
      this.aboutToAppear()
    }
  }

  async aboutToAppear() {
    this.records = await RecordService.queryRecordByDate(this.selectedDate)
  }

  build() {
    Column() {
      // 头部搜索
      SearchHeader()
      // 统计卡片
      StatsCard()
      // 记录列表
      RecordList()
        .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_page_background'))
  }
}

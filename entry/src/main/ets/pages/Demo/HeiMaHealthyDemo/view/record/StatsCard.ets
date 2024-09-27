import BreakpointConstants from '../../common/constants/BreakpointConstants'
import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import RecordService from '../../service/RecordService'
import { RecordVO } from '../../viewmodel/RecordVO'
import StatsInfo from '../../viewmodel/StatsInfo'
import CalorieStats from './CalorieStats'
import DatePickDialog from './DatePickDialog'
import NutrientStats from './NutrientStats'

@Component
export default struct StatsCard {
  @StorageProp('selectedDate') selectedDate: number = new Date().getTime()
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_SM
  @Consume @Watch('handleRecordsChange') records: RecordVO[]
  @State info: StatsInfo = new StatsInfo()

  handleRecordsChange(){
    this.info = RecordService.calculateStatsInfo(this.records)
  }

  controller: CustomDialogController = new CustomDialogController({
    builder: DatePickDialog({ selectedDate: new Date(this.selectedDate) })
  })

  chooseBarPosition3(){
    let p:Record<string,number> = {
      'sm': 1,
      'md': 1,
      'lg': 2
    }
    return p[this.currentBreakpoint]
  }

  build() {
    Column() {
      // 日期信息
      Row() {
        Text(DateUtil.formatDate(this.selectedDate))
          .fontColor($r('app.color.secondary_color'))
        Image($r('app.media.ic_public_spinner'))
          .width(20)// svg图片才可以修改fillColor
          .fillColor($r('app.color.secondary_color'))
      }.padding(CommonConstants.SPACE_8)
      .onClick(() => {
        this.controller.open()
      })

      Swiper() {
        // 热量统计
        CalorieStats({inTake:this.info.intake,expend:this.info.expend})
        // 营养统计
        NutrientStats({protein:this.info.protein,carbon:this.info.carbon,fat:this.info.fat})
      }
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(CommonConstants.DEFAULT_18)
      // 设置圆点选中的颜色
      .indicator(this.chooseBarPosition3() === 2 ? false : new DotIndicator().selectedColor($r('app.color.welcome_page_background')))
      // 设置元素显示个数
      .displayCount(this.chooseBarPosition3())

      // 统计信息
    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_18)
  }
}
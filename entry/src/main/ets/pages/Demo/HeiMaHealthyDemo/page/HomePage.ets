import BreakpointConstants from '../common/constants/BreakpointConstants'
import { CommonConstants } from '../common/constants/CommonConstants'
import BreakpointSystem from '../common/utils/BreakpointSystem'
import RecordIndex from '../view/record/RecordIndex'

@Entry
@Component
struct HomePage {
  @State currentIndex: number = 0
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_SM
  private breakpointSystem: BreakpointSystem = new BreakpointSystem()

  @State isPageShow: boolean = false

  onPageShow(): void {
    this.isPageShow = true
  }

  onPageHide(): void {
    this.isPageShow = false
  }

  @Builder
  tabBarComponent($$image: ResourceStr, $$title: ResourceStr, $$index: number) {
    Column({ space: CommonConstants.SPACE_8 }) {
      Image($$image)
        .width(22)
        .fillColor(this.selectColor($$index))
      Text($$title)
        .fontSize(14)
        .fontColor(this.selectColor($$index))
    }
  }

  selectColor(index: number) {
    return this.currentIndex === index ? $r('app.color.primary_color') : $r('app.color.gray')
  }

  chooseBarPosition(){
    // 方法一：
    let p:Record<string,number> = {
      'sm': BarPosition.End,
      'md': BarPosition.Start,
      'lg': BarPosition.Start
    }
// 方法二：
//     let p = new HashMap<String,Number>()
//     p['sm'] = BarPosition.End
//     p['md'] = BarPosition.Start
//     p['lg'] = BarPosition.Start

    return p[this.currentBreakpoint]
  }

  chooseBarPosition1(){
    let p:Record<string,boolean> = {
      'sm': false,
      'md': true,
      'lg': true
    }
    return p[this.currentBreakpoint]
  }

  aboutToAppear(): void {
    this.breakpointSystem.register()
  }

  build() {
    Tabs({ barPosition:this.chooseBarPosition() }) {
      TabContent() {
        RecordIndex({isPageShow:this.isPageShow})
      }.tabBar(this.tabBarComponent($r('app.media.ic_calendar'), $r('app.string.tab_record'), 0))

      TabContent() {
        Text('发现页面')
      }.tabBar(this.tabBarComponent($r('app.media.discover'), $r('app.string.tab_discover'), 1))

      TabContent() {
        Text('我的页面')
      }.tabBar(this.tabBarComponent($r('app.media.ic_user_portrait'), $r('app.string.tab_user'), 2))
    }
    .height('100%')
    .width('100%')
    .onChange(index => this.currentIndex = index)
    .vertical(this.chooseBarPosition1())
    .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.TOP,SafeAreaEdge.BOTTOM])
  }
}
import StoragePropPage from '../zhuangTaiGuanLi/StoragePropPage'
import Main from '../../component/Main'
import StorageLinkPage from '../zhuangTaiGuanLi/StorageLinkPage'
import PersistentStoragePage from '../zhuangTaiGuanLi/PersistentStoragePage'

@Entry
@Component
struct Index {
  @State currentSelectIndex: number = 0

  @Builder
  tabComponent(title: string, index: number) {
    Column() {
      Image($r('app.media.icon'))
        .width(30)
        .margin({ bottom: 5 })
      Text(title)
        .fontColor(index == this.currentSelectIndex ? Color.Red : Color.Black)
    }
  }

  build() {
    Tabs({ index: 0 }) {
      TabContent() {
        StoragePropPage()
      }.tabBar(this.tabComponent('首页', 0))

      TabContent() {
        StorageLinkPage()
      }.tabBar(this.tabComponent('商城', 1))

      TabContent() {
        PersistentStoragePage()
      }.tabBar(this.tabComponent('分类', 2))

      TabContent() {
        Main()
      }.tabBar(this.tabComponent('我的', 3))
    }.barPosition(BarPosition.End)
    .animationMode(AnimationMode.NO_ANIMATION)
    .onTabBarClick((value) => {
      this.currentSelectIndex = value
    })
  }
}
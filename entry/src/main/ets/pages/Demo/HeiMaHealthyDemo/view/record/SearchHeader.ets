import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct SearchHeader {
  build() {
    Row({ space: CommonConstants.SPACE_6 }) {
      // 添加搜索框
      Search({ placeholder: '搜索饮食或运动信息' })
        .textFont({ size: 18 })
        .layoutWeight(1)
      // 在控件上添加压标
      Badge({count: 1,position:BadgePosition.RightTop,style:{fontSize: 12}}) {
        Image($r('app.media.ic_public_email'))
          .width(24)
      }
    }
    .width(CommonConstants.THOUSANDTH_940)
  }
}
import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export default struct UserPrivacyDialog {
  controller: CustomDialogController
  confirm?: () => void
  cancel?: () => void

  // confirmAction = ()=>void
  // cancelAction = ()=>void

  build() {
    Column({ space: 10 }) {
      Text($r('app.string.user_privacy_title'))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      Text($r('app.string.user_privacy_content'))
      Button($r('app.string.agree_label'))
        .width(150)
        .backgroundColor($r('app.color.primary_color'))
        .onClick(() => {
          this.controller.close()
          if (this.confirm) {
            this.confirm()
          }
        })
      Button($r('app.string.refuse_label'))
        .width(150)
        .backgroundColor($r('app.color.lightest_primary_color'))
        .fontColor($r('app.color.light_gray'))
        .onClick(() => {
          if (this.cancel) {
            this.cancel()
          }
          this.controller.close()
        })
    }
    .width('100%')
    .padding(10)
  }
}
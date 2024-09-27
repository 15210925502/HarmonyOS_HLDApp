import UserPrivacyDialog from '../view/Welcome/UserPrivacyDialog'
import { common } from '@kit.AbilityKit'
import PreferenceUtil from '../common/utils/PreferenceUtil'
import { router } from '@kit.ArkUI'

@Extend(Text)
function opacityWhiteText(opacity: number, fontSize: number = 10) {
  .fontSize(fontSize)
  .fontColor(Color.White)
  .opacity(opacity)
}

const PREF_KEY = 'userPrivacyKey'

@Entry
@Component
struct WelcomePage {
  context = getContext(this) as common.UIAbilityContext
  controller: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm: (): void => this.onConfirm(),
      cancel: (): void => this.exitApp()
    })
  })

  async aboutToAppear() {
    // 加载首选项
    let isAgree = await PreferenceUtil.getPreferenceValue(PREF_KEY, false)
    // 判断是否同意
    if (isAgree) {
      // 同意，跳转首页
      this.jumpToHome()
    } else {
      // 不同意，弹窗
      this.controller.open()
    }
  }

  onConfirm() {
    PreferenceUtil.putPreferenceValue(PREF_KEY, true)
    this.jumpToHome()
  }

  jumpToHome() {
   setTimeout(()=>{
     router.replaceUrl({
       url: 'pages/Demo/HeiMaHealthyDemo/page/HomePage'
     })
   },3000)
  }

  exitApp() {
    // 退出APP
    this.context.terminateSelf()
  }

  build() {
    Column({ space: 10 }) {
      Row() {
        Image($r('app.media.home_slogan'))
          .width(260)
      }
      .layoutWeight(1)

      Image($r('app.media.home_logo'))
        .width(150)
      Row() {
        Text('黑马健康支持')
          .opacityWhiteText(0.8, 12)
        Text('IPv6')
          .opacityWhiteText(0.8, 12)
          .border({
            style: BorderStyle.Solid,
            width: 1,
            color: Color.White,
            radius: 15
          })
          .margin({ left: 5, right: 5 })

        Text('网络')
          .opacityWhiteText(0.8, 12)
      }

      Text(`'减更多'指黑马健康App希望通过软件工具的形式，帮助更多用户实现身材健康`)
        .opacityWhiteText(0.6, 10)
      Text('浙ICP备案0000000000000号-36D')
        .opacityWhiteText(0.4, 10)
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.welcome_page_background'))
    .expandSafeArea()
  }
}
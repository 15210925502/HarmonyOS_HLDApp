import { TipsDialog } from '@kit.ArkUI';
import AppBar from '../../component/AppBar';

@Entry
@Component
struct Index {
  tipsDialog: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      // imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: '想要卸载这个APP嘛?',
      primaryButton: {
        value: '取消',
        action: () => {
          console.info('Callback when the first button is clicked')
        },
      },
      secondaryButton: {
        value: '删除',
        role: ButtonRole.ERROR,
        action: () => {
          console.info('Callback when the second button is clicked')
        }
      },
      onCheckedChange: () => {
        console.info('Callback when the checkbox is clicked')
      }
    }),
  })

  build() {
    Column() {
      AppBar({title:'132'})
      Button("上图下文弹出框")
        .width(96)
        .height(40)
        .onClick(() => {
          this.tipsDialog.open()
        })
    }.width('100%')
    .height('100%')
    .backgroundColor(Color.Orange)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
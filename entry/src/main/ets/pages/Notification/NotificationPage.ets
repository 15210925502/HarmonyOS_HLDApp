import { notificationManager } from '@kit.NotificationKit'
import { PromptAction } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'
import { JSON } from '@kit.ArkTS'
import { BusinessError } from '@kit.BasicServicesKit'
import DownloadCard from './DownloadCard'

@Extend(Button)
function myButtonStyle() {
  .width(200)
  .height(50)
  .backgroundColor(Color.Orange)
}

@Entry
@Component
struct NotificationPage {
  pixel: PixelMap | undefined = undefined
  indexID: number = 100

  async aboutToAppear() {
    // 获取资源管理器
    let rm = getContext(this).resourceManager
    // 读取图片
    let file = await rm.getMediaContent($r('app.media.icon'))
    // 创建pixelMap
    image.createImageSource(file.buffer).createPixelMap()
      .then((value) => {
        this.pixel = value
      })
      .catch((reason: Error) => {
        console.log('testTag', '加载图片异常', JSON.stringify(reason))
      })
  }

  build() {
    Column({ space: 20 }) {
      Image($r('app.media.soybean_milk'))
        .width(150)

      Button('发送普通通知')
        .myButtonStyle()
        .onClick(() => {
          this.publishNotification_basicText()
        })
      Button('发送长文本通知')
        .myButtonStyle()
        .onClick(() => {
          this.publishNotification_longText()
        })
      Button('发送多行文本通知')
        .myButtonStyle()
        .onClick(() => {
          this.publishNotification_multiline()
        })
      Button('发送图片通知通知')
        .myButtonStyle()
        .onClick(() => {
          this.publishNotification_picture()
        })
      DownloadCard()
    }
    .height('100%')
    .width('100%')
  }

  publishNotification_basicText() {
    let notificationRequest: notificationManager.NotificationRequest = {
      id: this.indexID ++, //通知ID
      content: {
        //通知内容
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, //普通文本型通知
        normal: {
          //基本类型通知内容
          title: '普通文本标题',
          text: '普通文本内容',
          additionalText: '普通文本附加内容'
        }
      },
      showDeliveryTime:true,
      deliveryTime:new Date().getTime(),
      groupName:'HLD',
      notificationSlotType:notificationManager.SlotType.SOCIAL_COMMUNICATION
    }
    this.publish(notificationRequest)
  }

  publishNotification_longText() {
    let notificationRequest: notificationManager.NotificationRequest = {
      id: this.indexID ++,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
        longText: {
          title: '长文本标题',
          text: '长文本内容',
          additionalText: '长文本附加内容',
          longText: '通知中的文本，我很长，我很长，很长，长，。。。。。。',
          briefText: '通知概要和总结',
          expandedTitle: '通知展开时的标题'
        }
      }
    }
    this.publish(notificationRequest)
  }

  publishNotification_multiline() {
    let notificationRequest: notificationManager.NotificationRequest = {
      id: this.indexID ++,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
        multiLine: {
          title: '多行文本标题',
          text: '多行文本内容',
          additionalText: '多行文本附加内容',
          briefText: '多行文本概要和总结',
          longTitle: '展开时的标题，有多行，我很宽',
          lines: [
            '第一行',
            '第二行',
            '第三行'
          ]
        }
      }
    }
    this.publish(notificationRequest)
  }

  publishNotification_picture() {
    let notificationRequest: notificationManager.NotificationRequest = {
      id: this.indexID ++,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: {
          title: '图片标题',
          text: '图片内容',
          additionalText: '图片附加内容',
          briefText: '图片通知概要和总结',
          expandedTitle: '图片展开后标题',
          picture: this.pixel as PixelMap
        }
      }
    }
    this.publish(notificationRequest)
  }

  private publish(notificationRequest: notificationManager.NotificationRequest) {
    notificationManager.publish(notificationRequest)
      .then(() => {

      })
      .catch((error: BusinessError) => {
        new PromptAction().showToast({ message: error.code.toString() + error.name + error.message })
      })
  }
}
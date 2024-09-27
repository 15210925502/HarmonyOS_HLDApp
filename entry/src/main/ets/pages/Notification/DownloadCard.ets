import { PromptAction, promptAction } from '@kit.ArkUI'
import { notificationManager } from '@kit.NotificationKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { WantAgent, wantAgent } from '@kit.AbilityKit'

enum DownloadState {
  NOT_BEGIN = '未开始',
  DOWNLOADING = '下载中',
  PAUSE = '已停止',
  FINISHED = '已完成'
}

@Entry
@Component
export default struct DownloadCard {
  // 下载进度
  @State progressValue: number = 0
  // 任务状态
  @State state: DownloadState = DownloadState.NOT_BEGIN
  fileName: string = 'HLD.mp4'
  taskID: number = -1
  isSupport: boolean = false
  notificationID: number = 999
  wantAgentInstance: WantAgent | undefined = undefined

  async aboutToAppear() {
    // 判断当前系统是否支持进度条模板
    this.isSupport = await notificationManager.isSupportTemplate('downloadTemplate')
    // 创建拉取当前应用的行为意图
    // 创建wantInfo消息
    let wantInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          deviceId:'',
          bundleName:'com.example.myapplication',
          abilityName: 'com.example.myapplication.EntryAbility',
          action: '',
          entities: [],
          uri: '',
          parameters: {}
        }
      ],
      requestCode:0,
      actionType: wantAgent.OperationType.START_ABILITY,
      actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
    }
    // 创建wantAgent实例
    this.wantAgentInstance = await wantAgent.getWantAgent(wantInfo)
  }

  build() {
    Row({ space: 5 }) {
      Image($r('app.media.icon'))
        .width(50)
      Column({ space: 10 }) {
        Row() {
          Text(this.fileName)
          Text(`${this.progressValue}%`)
            .fontColor('#c1c2c1')
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('100%')

        Progress({
          value: this.progressValue,
          total: 100
        })
        Row() {
          Text(`${(this.progressValue * 0.43).toFixed(2)}MB`)
            .fontSize(14)
            .fontColor('#c1c2c1')
          Blank()
          if (this.state === DownloadState.NOT_BEGIN) {
            Button('未开始')
              .height(25)
              .onClick(() => {
                this.download()
              })
          } else if (this.state === DownloadState.DOWNLOADING) {
            Button('取消')
              .height(25)
              .onClick(() => {
                this.cancel()
              })
            Button('暂停')
              .height(25)
              .onClick(() => {
                this.pause()
              })
          } else if (this.state === DownloadState.PAUSE) {
            Button('取消')
              .height(25)
              .onClick(() => {
                this.cancel()
              })
            Button('继续')
              .height(25)
              .onClick(() => {
                this.download()
              })
          } else if (this.state === DownloadState.FINISHED) {
            Button('已完成')
              .height(25)
              .onClick(() => {
                this.open()
              })
          }
        }.width('100%')
      }
      .layoutWeight(1)
      .margin({ right: 10 })
    }
    .width('100%')
    .padding(10)
    .margin(10)
  }

  cancel() {
    if (this.taskID >= 0) {
      clearInterval(this.taskID)
      this.taskID = -1
    }
    this.progressValue = 0
    this.state = DownloadState.NOT_BEGIN
    notificationManager.cancel(this.notificationID)
  }

  download() {
    if (this.taskID >= 0) {
      clearInterval(this.taskID)
    }
    this.taskID = setInterval(() => {
      if (this.progressValue >= 100) {
        clearInterval(this.taskID)
        this.progressValue = 100
        this.state = DownloadState.FINISHED
        this.taskID = -1
      } else {
        this.progressValue += 2
        this.publishNotification_download()
      }
    }, 500)
    this.state = DownloadState.DOWNLOADING
  }

  pause() {
    if (this.taskID >= 0) {
      clearInterval(this.taskID)
      this.taskID = -1
    }
    this.state = DownloadState.PAUSE
    this.publishNotification_download()
  }

  open() {
    promptAction.showToast({
      message: '功能未实现'
    })
    this.publishNotification_download()
  }

  async publishNotification_download() {
    if (!this.isSupport) {
      // 不支持
      return
    }
    let request: notificationManager.NotificationRequest = {
      id: this.notificationID,
      wantAgent:this.wantAgentInstance,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '下载进度条标题',
          text: '下载进度条内容',
          additionalText: '下载进度条附加内容'
        }
      },
      template: {
        // 构造进度条模板，name字段当前需要固定配置为downloadTemplate
        name: 'downloadTemplate',
        data: {
          title: this.progressValue + '%',
          fileName: this.fileName,
          progressValue: this.progressValue
        }
      }
    }
    this.publish(request)
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
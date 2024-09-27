import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct WebPage {
  @State message: string = 'Hello World';
  webContent: webview.WebviewController = new webview.WebviewController()

  build() {
    Column() {
      Web({ src: 'https://www.baidu.com',controller:this.webContent})
        .width('100%')
        .height(300)
    }
    .height('100%')
    .width('100%')
  }
}
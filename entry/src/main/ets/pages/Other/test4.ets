import router from '@ohos.router';

@Component
struct myComponent {
  @State userName: string = "张三"

  aboutToAppear() {
    console.info("myComponent组件已被创建啦")
  }

  aboutToDisappear() {
    console.info("myComponent组件已被销毁啦")
  }

  build() {
    Column() {
      Text(`你好 ${this.userName}`)
        .fontSize(30)
        .width(200)
        .height(100)
        .onClick(() => {
          this.userName = "李四"
        })
    }
  }
}

@Entry
@Component
struct Test4 {
  @State
  isShowChild: boolean = true //是否显示自定义组件

  aboutToAppear() {
    console.info("Test4组件已被创建啦")
  }

  aboutToDisappear() {
    console.info("Test4组件已被销毁啦")
  }

  onPageShow() {
    console.info("Test4页面已经显示")
  }

  onPageHide() {
    console.info("Test4页面已经隐藏")
  }

  onBackPress() {
    console.info("返回按钮被点击")
  }

  build() {
    Column() {
      Text('我的主页面Test4')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      if (this.isShowChild) {
        myComponent()
      }

      Button("删除子组件")
        .onClick(() => {
          this.isShowChild = false
        })

      Button("跳转页面").onClick(() => {
        router.pushUrl({ url: "pages/Index" })
      })
    }
  }
}

class ButtonState {
  value: string
  width: number = 0

  constructor(value:string,width:number) {
    this.value = value
    this.width = width
  }
}

@Component
struct MyChildGreenButton {
  @Link
  buttonState: ButtonState

  build(){
    Column(){
      Button(`${this.buttonState.value}`).onClick(() => {
        if (this.buttonState.width < 700) {
          this.buttonState.width += 100
        }else {
          this.buttonState = new ButtonState("绿色按钮",100)
        }
      })
        .width(this.buttonState.width)
        .height(150)
        .backgroundColor(Color.Green)
    }
  }
}

@Component
struct MyChildRedButton {
  @Link
  value: string
  @Link
  buttonWidth: number

  build(){
    Column(){
      Button(`${this.value}`).onClick(() => {
        this.buttonWidth += 50
      })
        .width(this.buttonWidth)
        .height(150)
        .backgroundColor(Color.Red)
    }
  }
}



@Entry
@Component
struct MyParent {
  @State parentGreenButton: ButtonState = new ButtonState("壹号子组件",300)
  @State parentRedValue: string = "二号子组件"
  @State parentRedWidth: number = 200

  build() {
  Column(){
    // 父组件中调整按钮的宽度
    Button(`父组件中修改绿色按钮的宽度：${this.parentGreenButton.width}`)
      .onClick(() =>{
        this.parentGreenButton.width = this.parentGreenButton.width < 700 ? this.parentGreenButton.width + 100 : 100
      })

    Button(`父组件中修改红色按钮的宽度：${this.parentRedWidth}`)
      .onClick(() =>{
        this.parentRedWidth = this.parentRedWidth < 700 ? this.parentRedWidth + 100 : 100
      })

    Divider()
    MyChildGreenButton({buttonState: $parentGreenButton})
    MyChildRedButton({value: $parentRedValue,buttonWidth:$parentRedWidth})
  }
  }
}
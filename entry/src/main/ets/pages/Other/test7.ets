@Component
struct MyChild {
  @Prop
  age: number

  build() {
    Column() {
      Text(`子组件年龄为:${this.age}`)
        .fontSize(20)
        .width(200)
        .height(50)
      Button("+子组件年龄").onClick(() => {
        this.age += 1
      })
        .width(200)
        .height(50)
        .margin(30)
    }
  }
}

@Entry
@Component
struct myFather {
  @State
  initAge: number = 16

  build() {
    Column() {
      Text(`父组件年龄为:${this.initAge}`)
        .fontSize(20)
        .width(200)
        .height(50)
      Button("-父组件年龄").onClick(() => {
        this.initAge -= 1
      })
        .width(200)
        .height(50)
        .margin(30)

      Divider()
      MyChild({age:this.initAge})

      Divider()
      MyChild({age: 30})
    }
  }
}
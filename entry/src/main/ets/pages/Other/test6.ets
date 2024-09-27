class Person {
  public name: string
  public age: number

  constructor(xName: string, xAge: number) {
    this.name = xName
    this.age = xAge
  }
}

@Component
struct MyChild {
  @State
  person: Person = new Person("张三", 34)
  private increase: number = 1

  build() {
    Column() {
      Text(`${this.person.name}`)
        .height(60)
      Divider()
      Button("修改名字").onClick(() => {
        this.person.name = this.person.name === "张三" ? "李四" : "张三"
      })
        .height(50)
        .width(100)
        .margin(10)
      Button(`修改年龄:${this.person.age}`).onClick(() => {
        this.person.age += this.increase
      })
        .width(100)
        .height(50)
        .margin(10)
    }
  }
}

@Entry
@Component
struct Myparent {
  build(){
    Column(){
      MyChild({person: new Person('李四',38)})
      MyChild({increase: 2})
    }
  }
}
